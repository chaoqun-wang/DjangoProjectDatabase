from django.shortcuts import render, HttpResponse
from home.models import TBookClassification, TBooks
from django.core.paginator import Paginator


# Create your views here.


# 渲染当当网首页
def home_page(request):
    try:
        username = request.session.get('username')
        level_one = TBookClassification.objects.filter(level=1)
        level_two = TBookClassification.objects.filter(level=2)
        new_book = TBooks.objects.all().order_by('-add_time')[0:8]
        recommend_book = TBooks.objects.all()[0:10]
        new_hot_top = TBooks.objects.all().order_by('-add_time', '-sales')[0:5]
        new_hot_bottom = TBooks.objects.all().order_by('-add_time', '-sales')[0:10]
        return render(request, 'home/index.html', {
            'username': username,
            'level_one': level_one,
            'level_two': level_two,
            'new_book': new_book,
            'recommend_book': recommend_book,
            'new_hot_top': new_hot_top,
            'new_hot_bottom': new_hot_bottom,
        })
    except Exception as error:
        print(error)
        return HttpResponse('哎呀！服务器出错了~')


# 渲染书籍详情页面
def details_page(request):
    try:
        username = request.session.get('username')
        book_id = request.GET.get('book_id')
        book = TBooks.objects.filter(id=book_id)
        return render(request, 'home/Book details.html', {'book': book[0], 'username': username})
    except Exception as error:
        print(error)
        return HttpResponse('<h1>无此书籍信息</h1>')


# 渲染书籍列表页面
def list_page(request):
    try:
        username = request.session.get('username')
        level_one = TBookClassification.objects.filter(level=1)
        level_two = TBookClassification.objects.filter(level=2)
        id = request.GET.get('category_id')
        level = request.GET.get('level')
        if id and level:
            request.session['id'] = id
            request.session['level'] = level
        else:
            id = request.session.get('id')
            level = request.session.get('level')
        page_num = request.GET.get('number', default='1')
        queryset = TBookClassification.objects.filter(pk=0).none()
        if level == '1':
            data = TBookClassification.objects.filter(parent_id=id)
            for i in data:
                book = TBooks.objects.filter(category_id=i.id)
                queryset |= book
        elif level == '2':
            queryset = TBooks.objects.filter(category_id=id)
        else:
            queryset = TBookClassification.objects.filter(pk=0).none()
        sort_select = request.GET.get('num')
        if sort_select == '1':
            html_file = 'home/booklist_default.html'
        elif sort_select == '2':
            queryset = queryset.order_by('-sales')
            html_file = 'home/booklist_sale_desc.html'
        elif sort_select == '3':
            queryset = queryset.order_by('dang_price')
            html_file = 'home/booklist_price_asc.html'
        elif sort_select == '4':
            queryset = queryset.order_by('-publishing_time')
            html_file = 'home/booklist_pubdate_desc.html'
        else:
            html_file = 'home/booklist_default.html'
        pager_obj = Paginator(queryset, per_page=4)
        if page_num.isdigit() is not True or int(page_num) not in pager_obj.page_range:
            page_num = 1
        page_obj = pager_obj.page(int(page_num))
        return render(request, html_file, {
            'username': username,
            'level_one': level_one,
            'level_two': level_two,
            'page_obj': page_obj,
        })
    except Exception as error:
        print(error)
        return HttpResponse('哎呀！服务器出错了~')
