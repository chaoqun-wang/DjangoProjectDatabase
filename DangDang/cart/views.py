from django.http import JsonResponse
from django.shortcuts import render, HttpResponse
from cart.cart import Cart
from home.models import TUser, TShoppingCart
from django.db import transaction


# Create your views here.

# 渲染购物车页面
def shopping_cart(request):
    try:
        username = request.session.get('username')
        if request.session.get('login_status'):
            if '@' in username:
                user_id = TUser.objects.filter(username=username)[0].id
            else:
                user_id = TUser.objects.filter(phone_number=username)[0].id
            books = TShoppingCart.objects.filter(user_id=user_id)
            cart = Cart()
            for book in books:
                cart.add_shopping_cart(book.book_id, book.quantity)
        else:
            cart = request.session.get('cart')
        return render(request, 'cart/car.html', {
            'username': username,
            'cart': cart
        })
    except Exception as error:
        print(error)
        return HttpResponse('哎呀！服务器出错了~')


# 添加购物车逻辑
def add_cart(request):
    try:
        with transaction.atomic():
            book_id = request.POST.get('book_id')
            number = request.POST.get('num', '1')
            cart = request.session.get('cart')
            if str(number).isdigit() and int(number) in range(1, 201):
                if request.session.get('login_status'):
                    username = request.session.get('username')
                    if '@' in username:
                        user_id = TUser.objects.filter(username=username)[0].id
                    else:
                        user_id = TUser.objects.filter(phone_number=username)[0].id

                    user_book = TShoppingCart.objects.filter(book_id=int(book_id), user_id=user_id)
                    if user_book:
                        user_book[0].quantity += int(number)
                        user_book[0].save()
                    else:
                        TShoppingCart.objects.create(quantity=int(number), book_id=int(book_id), user_id=user_id)
                else:
                    if cart:
                        cart.add_book(int(book_id), int(number))
                        request.session['cart'] = cart
                    else:
                        cart = Cart()
                        cart.add_book(int(book_id), int(number))
                        request.session['cart'] = cart
                return JsonResponse({'msg': '添加成功，快去购物车看看吧^_^！', 'status': 1})
            return JsonResponse({'msg': '添加失败，添加的数量要在1-200之间', 'status': 0})
    except Exception as error:
        print(error)
        return HttpResponse('哎呀！服务器出错了~')


# 减少购物车逻辑
def reduce_cart(request):
    try:
        with transaction.atomic():
            book_id = request.POST.get('book_id')
            number = request.POST.get('num', '1')
            cart = request.session.get('cart')
            if str(number).isdigit() and int(number) in range(1, 201):
                if request.session.get('login_status'):
                    username = request.session.get('username')
                    if '@' in username:
                        user_id = TUser.objects.filter(username=username)[0].id
                    else:
                        user_id = TUser.objects.filter(phone_number=username)[0].id
                    user_book = TShoppingCart.objects.filter(book_id=int(book_id), user_id=user_id)
                    if user_book:
                        user_book[0].quantity -= int(number)
                        user_book[0].save()
                else:
                    cart.reduce_book(int(book_id), int(number))
                    request.session['cart'] = cart
                return JsonResponse({'msg': '减少成功', 'status': 1})
            return JsonResponse({'msg': '添加失败，添加的数量要在1-200之间', 'status': 0})
    except Exception as error:
        print(error)
        return HttpResponse('哎呀！服务器出错了~')


# 购物车界面input输入框重新修改数量
def change_number(request):
    try:
        with transaction.atomic():
            book_id = request.POST.get('book_id')
            number = request.POST.get('num')
            cart = request.session.get('cart')
            if str(number).isdigit() and int(number) in range(1, 201):
                if request.session.get('login_status'):
                    username = request.session.get('username')
                    if '@' in username:
                        user_id = TUser.objects.filter(username=username)[0].id
                    else:
                        user_id = TUser.objects.filter(phone_number=username)[0].id

                    user_book = TShoppingCart.objects.filter(book_id=int(book_id), user_id=user_id)
                    if user_book:
                        user_book[0].quantity = int(number)
                        user_book[0].save()
                else:
                    cart.change_book(int(book_id), int(number))
                    request.session['cart'] = cart
                return JsonResponse({'msg': '修改成功', 'status': 1})
            return JsonResponse({'msg': '修改失败，修改的数量要在1-200之间', 'status': 0})
    except Exception as error:
        print(error)
        return HttpResponse('哎呀！服务器出错了~')


# 删除购物车逻辑
def del_cart(request):
    try:
        with transaction.atomic():
            book_id = request.POST.get('book_id')
            cart = request.session.get('cart')
            if request.session.get('login_status'):
                username = request.session.get('username')
                if '@' in username:
                    user_id = TUser.objects.filter(username=username)[0].id
                else:
                    user_id = TUser.objects.filter(phone_number=username)[0].id
                user_book = TShoppingCart.objects.filter(book_id=int(book_id), user_id=user_id)
                if user_book:
                    user_book[0].delete()
            else:
                cart.del_book(int(book_id))
                request.session['cart'] = cart
            return JsonResponse({'msg': '删除成功', 'status': 1})
    except Exception as error:
        print(error)
        return HttpResponse('哎呀！服务器出错了~')
