from django.shortcuts import redirect
from django.utils.deprecation import MiddlewareMixin
from home.models import TUser


class MyMiddleware(MiddlewareMixin):  # 自定义的中间件
    def __init__(self, get_response):  # 初始化
        super().__init__(get_response)

    # 前端页面发请求  -> 视图函数

    # view处理请求前执行
    def process_request(self, request):  # 某一个view
        # print("request:", request, '中间件第13行打印~~~')
        if '/' == request.path:  # 直接进入主页
            return redirect('home:home_page')
        # 从那儿来回哪儿去
        book_id = request.GET.get('book_id')
        if 'home_page' in request.path or 'list_page' in request.path or 'details_page' in request.path or 'shopping_cart' in request.path or 'indent_page' in request.path:
            if request.path == '/dangdang/details_page/':
                request.session['url'] = request.path + '?book_id=' + book_id
            else:
                request.session['url'] = request.path
        # 登录用户后，并点击了记住我（一周），下次打开当当网，实现自动登录
        if request.session.get('flag'):  # 判断是否有标记，有标记不做任何事
            pass
        else:  # 无标记验证是否有七天记住我
            if 'home_page' in request.path or 'list_page' in request.path or 'details_page' in request.path or 'shopping_cart' in request.path:
                username = request.COOKIES.get('username')  # 取用户名
                password = request.COOKIES.get('password')  # 取密码
                url = request.session.get('url')
                if username:  # 如果用户名存在，验证用户名密码是否正确
                    if '@' in username:
                        result = TUser.objects.filter(username=username, password=password, status=1)
                    else:
                        result = TUser.objects.filter(phone_number=username, password=password, status=1)
                    if result:
                        request.session['flag'] = True  # 存标记防止重定向过多
                        request.session['login_status'] = True
                        request.session['username'] = username
                        return redirect(url)
                    request.session['flag'] = True  # 存标记防止重定向过多
                    return redirect(url)
                request.session['flag'] = True  # 存标记防止重定向过多
                return redirect(url)
        # 订单页，订单完成页强制登录验证
        if 'indent_page' in request.path or 'indent_ok' in request.path:
            if request.session.get('login_status'):
                pass
            else:
                return redirect('user:login_page')
        # 限制访问页面
        if 'register_ok' in request.path or 'indent_page' in request.path or 'indent_ok' in request.path:
            if request.META.get('HTTP_REFERER') is None:
                return redirect('home:home_page')

    # 在process_request之后View之前执行
    def process_view(self, request, view_func, view_args, view_kwargs):
        # print("view:", request, view_func, view_args, view_kwargs, '中间件第34行打印~~~')
        pass

    # view执行之后，响应之前执行
    def process_response(self, request, response):
        # print("response:", request, response, '中间件第38行打印~~~')
        return response  # 必须返回response

    # 如果View中抛出了异常
    def process_exception(self, request, ex):  # View中出现异常时执行
        print("exception:", request, ex, '中间件第69行打印~~~')
        pass
