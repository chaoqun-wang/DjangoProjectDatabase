from django.urls import path
from cart import views

app_name = 'cart'

urlpatterns = [
    path('shopping_cart/', views.shopping_cart, name='shopping_cart'),
    path('add_cart/', views.add_cart, name='add_cart'),
    path('reduce_cart/', views.reduce_cart, name='reduce_cart'),
    path('change_number/', views.change_number, name='change_number'),
    path('del_cart/', views.del_cart, name='del_cart'),
]
