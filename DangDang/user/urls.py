from django.urls import path
from user import views

app_name = 'user'

urlpatterns = [
    path('register_page/', views.register_page, name='register_page'),
    path('check_username/', views.check_username, name='check_username'),
    path('check_captcha/', views.check_captcha, name='check_captcha'),
    path('register_logic/', views.register_logic, name='register_logic'),
    path('login_page/', views.login_page, name='login_page'),
    path('login_logic/', views.login_logic, name='login_logic'),
    path('register_ok/', views.register_ok, name='register_ok'),
    path('sign_out/', views.sign_out, name='sign_out'),
    path('send_email/', views.send_email, name='send_email'),
    path('check_code/', views.check_code, name='check_code'),
]
