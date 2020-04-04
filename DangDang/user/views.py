from django.core.mail import send_mail
from django.db import transaction
from django.http import JsonResponse
from django.shortcuts import render, redirect, HttpResponse
from home.models import TUser, TShoppingCart
from user.encipher import generate_salt, generate_password, get_salt
import re, uuid


# Create your views here.


# 渲染注册页面
def register_page(request):
    try:
        return render(request, 'user/register.html')
    except Exception as error:
        print(error)
        return HttpResponse('哎呀！服务器出错了~')


# 检查用户名
def check_username(request):
    try:
        username = request.POST.get('username')
        if username == '':
            return JsonResponse({'msg': '帐号不能为空', 'status': 0})
        if '@' in username:
            if re.match(r'^[a-zA-Z0-9_-]+(.[a-zA-Z0-9_-]+){0,4}@[a-zA-Z0-9_-]+(.[a-zA-Z0-9_-]+){0,4}$', username):
                res = TUser.objects.filter(username=username)
                if res:
                    return JsonResponse({'msg': '此账号已存在', 'status': 0})
                return JsonResponse({'msg': '邮箱可用', 'status': 1})
            return JsonResponse({'msg': '邮箱格式错误', 'status': 0})
        else:
            if re.match(r"^1[35678]\d{9}$", username):
                res = TUser.objects.filter(phone_number=username)
                if res:
                    return JsonResponse({'msg': '此账号已存在', 'status': 0})
                return JsonResponse({'msg': '手机号可用', 'status': 1})
            return JsonResponse({'msg': '手机号格式错误', 'status': 0})
    except Exception as error:
        print(error)
        return HttpResponse('哎呀！服务器出错了~')


# 检查验证码
def check_captcha(request):
    try:
        captcha_code = request.POST.get('code')
        if captcha_code.lower() == request.session.get('code').lower():
            return JsonResponse({'msg': '验证码正确', 'status': 1})
        return JsonResponse({'msg': '验证码错误', 'status': 0})
    except Exception as error:
        print(error)
        return HttpResponse('哎呀！服务器出错了~')

# 注册逻辑
def register_logic(request):
    try:
        with transaction.atomic():
            username = request.POST.get('txt_username')
            password = request.POST.get('txt_password')
            salt = generate_salt()
            password = generate_password(password)
            if '@' in username:
                user = TUser.objects.create(username=username, password=password + salt, salt=salt, status=1)
            else:
                user = TUser.objects.create(phone_number=username, password=password + salt, salt=salt, status=1)
            request.session['login_status'] = True
            request.session['username'] = username
            cart = request.session.get('cart')
            if cart:
                for book in cart.book_items:
                    user_book = TShoppingCart.objects.filter(book_id=book.book_id, user_id=user.id)
                    if user_book:
                        user_book[0].quantity += book.book_number
                        user_book[0].save()
                    else:
                        TShoppingCart.objects.create(
                            quantity=book.book_number,
                            book_id=book.book_id,
                            user_id=user.id
                        )
                del request.session['cart']
            return JsonResponse({'msg': '注册成功', 'status': 1})
    except Exception as error:
        print(error)
        return HttpResponse('哎呀！服务器出错了~')


# 渲染注册成功页面
def register_ok(request):
    try:
        url = request.session.get('url')
        if url == None:
            url = '/dangdang/home_page/'
        username = request.session.get('username')
        return render(request, 'user/register ok.html', {'username': username, 'url': url})
    except Exception as error:
        print(error)
        return HttpResponse('哎呀！服务器出错了~')


# 渲染登录页面
def login_page(request):
    try:
        username = request.COOKIES.get('username')
        password = request.COOKIES.get('password')
        url = request.session.get('url')
        if username:
            if '@' in username:
                result = TUser.objects.filter(username=username, password=password, status=1)
            else:
                result = TUser.objects.filter(phone_number=username, password=password, status=1)
            if result:
                request.session['login_status'] = True
                request.session['username'] = username
                return redirect(url)
            return render(request, 'user/login.html')
        return render(request, 'user/login.html')
    except Exception as error:
        print(error)
        return HttpResponse('哎呀！服务器出错了~')


# 登录逻辑
def login_logic(request):
    try:
        with transaction.atomic():
            username = request.POST.get('username')
            password = request.POST.get('password')
            remember = request.POST.get('auto_login')
            url = request.session.get('url')
            if url == None:
                url = '/dangdang/home_page/'
            salt = get_salt(username)
            password = generate_password(password) + salt
            if '@' in username:
                user = TUser.objects.filter(username=username, password=password, status=1)
            else:
                user = TUser.objects.filter(phone_number=username, password=password, status=1)
            if user:
                request.session['login_status'] = True
                request.session['username'] = username
                response = JsonResponse({'msg': url, 'status': 1})
                if remember:
                    response.set_cookie('username', username, max_age=7 * 24 * 3600)
                    response.set_cookie('password', password, max_age=7 * 24 * 3600)
                    return response
                cart = request.session.get('cart')
                if cart:
                    for book in cart.book_items:
                        user_book = TShoppingCart.objects.filter(book_id=book.book_id, user_id=user[0].id)
                        if user_book:
                            user_book[0].quantity += book.book_number
                            user_book[0].save()
                        else:
                            TShoppingCart.objects.create(
                                quantity=book.book_number,
                                book_id=book.book_id,
                                user_id=user[0].id
                            )
                    del request.session['cart']
                return response
            return JsonResponse({'msg': '帐号或密码错误', 'status': 0})
    except Exception as error:
        print(error)
        return HttpResponse('哎呀！服务器出错了~')


# 退出登录
def sign_out(request):
    try:
        response = redirect('home:home_page')
        response.delete_cookie('username')
        response.delete_cookie('password')
        request.session.flush()
        return response
    except Exception as error:
        print(error)
        return HttpResponse('哎呀！服务器出错了~')


# 邮件发送的代码
def send_email(request):
    try:
        username = request.POST.get('username')
        random_code = str(uuid.uuid4())
        print(username, random_code)
        request.session['random_code'] = random_code
        res = send_mail('中期项目：当当-邮箱验证', random_code, '1131584630@qq.com', [username], fail_silently=False)
        if res == 1:
            return JsonResponse({'msg': '发送成功，请注意查收', 'status': 1})
        else:
            return JsonResponse({'msg': '发送失败', 'status': 0})
    except Exception as error:
        print(error)
        return HttpResponse('哎呀！服务器出错了~')


# 检查邮件随机验证码
def check_code(request):
    try:
        code = request.POST.get('code')
        random_code = request.session.get('random_code')
        url = request.session.get('url')
        if code == random_code:
            return JsonResponse({'msg': '恭喜您验证成功', 'status': 1, 'url': url})
        return JsonResponse({'msg': '验证码错误', 'status': 0})
    except Exception as error:
        print(error)
        return HttpResponse('哎呀！服务器出错了~')
