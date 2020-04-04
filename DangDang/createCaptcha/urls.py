from django.urls import path
from createCaptcha import views

app_name = 'createCaptcha'

urlpatterns = [
    path('get_captcha/', views.get_captcha, name='get_captcha'),
]
