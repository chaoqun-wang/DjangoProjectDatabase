from django.urls import path
from home import views

app_name = 'home'

urlpatterns = [
    path('home_page/', views.home_page, name='home_page'),
    path('details_page/', views.details_page, name='details_page'),
    path('list_page/', views.list_page, name='list_page'),
]
