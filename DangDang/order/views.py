from django.db.models import Sum
from django.shortcuts import render, HttpResponse
from django.http import JsonResponse
from home.models import TUser, TAddress, TOrder, TOrderDetail, TShoppingCart
from django.db import transaction
from datetime import datetime
from cart.cart import Cart
import re
from order.generate_order_number import generate_order_number


# Create your views here.


# 渲染订单页面
def indent_page(request):
    try:
        username = request.session.get('username')
        if '@' in username:
            user_id = TUser.objects.filter(username=username)[0].id
        else:
            user_id = TUser.objects.filter(phone_number=username)[0].id
        address = TAddress.objects.filter(user_id=user_id)
        cart = TShoppingCart.objects.filter(user_id=user_id)
        order = Cart()
        for book in cart:
            order.add_shopping_cart(book.book_id, book.quantity)
        total_price = 0
        for book in order.book_items:
            total_price += book.total_price
        request.session['total_price'] = total_price
        request.session['order'] = order
        return render(request, 'order/indent.html', {
            'username': username,
            'address': address,
            'total_price': total_price,
            'order': order,
        })
    except Exception as error:
        print(error)
        return HttpResponse('哎呀！服务器出错了~')


def select_address(request):
    try:
        addr_id = request.POST.get('addr_id')
        address = TAddress.objects.filter(id=addr_id)[0]

        def address_default(addr):
            if isinstance(addr, TAddress):
                return {
                    'id': addr.id,
                    'consignee': addr.consignee,
                    'address': addr.address,
                    'postcode': addr.postcode,
                    'phone_number': addr.phone_number,
                    'telephone': addr.telephone,
                    'user_id': addr.user_id
                }

        return JsonResponse({'msg': address, 'status': 1}, json_dumps_params={"default": address_default})
    except Exception as error:
        print(error)
        return HttpResponse('哎呀！服务器出错了~')


# 提交地址信息
def submit_address(request):
    try:
        with transaction.atomic():
            addr_id = request.POST.get('addr_id')
            consignee = request.POST.get('ship_man')
            address = request.POST.get('address')
            zip_code = request.POST.get('zip_code')
            phone = request.POST.get('phone')
            telephone = request.POST.get('telephone')
            username = request.session.get('username')
            if '@' in username:
                user_id = TUser.objects.filter(username=username)[0].id
            else:
                user_id = TUser.objects.filter(phone_number=username)[0].id
            if addr_id:
                res = TAddress.objects.filter(id=int(addr_id), user_id=int(user_id))
                if res:
                    address_obj = res[0]
                else:
                    return JsonResponse({'msg': '您可真皮^_^~！！！', 'status': 0})
            else:
                if consignee != '' and ('省' in address or '市' in address) and ('区' in address or '县' in address) and re.match(r"[0-9]\d{5}(?!\d)", zip_code) and (re.match(r"^1[35678]\d{9}$", phone) or re.match("^0\\d{2,3}-\\d{7,8}$", telephone)):
                    address_obj = TAddress.objects.create(consignee=consignee, address=address, postcode=zip_code, phone_number=phone, telephone=telephone, user_id=user_id)
                else:
                    return JsonResponse({'msg': '请检查信息是否填写正确78', 'status': 0})
            order_obj = TOrder.objects.create(order_number=generate_order_number(), generated_time=datetime.now(), total_price=request.session.get('total_price'), user_id=user_id, address_id=address_obj.id, status=0)
            order = request.session.get('order')
            for book in order.book_items:
                TOrderDetail.objects.create(book_id=book.book_id, price=book.book_price, books_number=book.book_number, order_id=order_obj.id)
            del request.session['order']
            TShoppingCart.objects.filter(user_id=user_id).delete()
            return JsonResponse({'msg': '/order/indent_ok/', 'status': 1})
    except Exception as error:
        print(error)
        return HttpResponse('哎呀！服务器出错了~')


# 渲染订单完成页面
def indent_ok(request):
    try:
        username = request.session.get('username')
        if '@' in username:
            user_id = TUser.objects.filter(username=username)[0].id
        else:
            user_id = TUser.objects.filter(phone_number=username)[0].id
        order = TOrder.objects.filter(user_id=user_id, status=0)
        order_number = order[0].order_number
        total_price = order[0].total_price
        books_number = order[0].torderdetail_set.all().aggregate(books_number=Sum('books_number'))['books_number']
        address = TAddress.objects.filter(id=order[0].address_id)[0]
        books = Cart()
        for order_detail in TOrderDetail.objects.filter(order_id=order[0].id):
            books.add_shopping_cart(order_detail.book_id, order_detail.books_number)
        order[0].status = 1
        order[0].save()
        return render(request, 'order/indent ok.html', {
            'username': username,
            'order_number': order_number,
            'total_price': total_price,
            'books_number': books_number,
            'address': address,
            'books': books.book_items
        })
    except Exception as error:
        print(error)
        return HttpResponse('哎呀！服务器出错了~')
