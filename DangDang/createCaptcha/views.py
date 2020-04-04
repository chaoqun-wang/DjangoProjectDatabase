from django.shortcuts import HttpResponse
from captcha.image import ImageCaptcha
import random, string


# Create your views here.

def get_captcha(request):
    # 1.声明一个ImageCaptcha()对象
    image = ImageCaptcha()
    # 2.随机生成验证码列表(以大小写字母和阿拉伯数字随机组成组成)
    code_list = random.sample(string.ascii_letters + string.digits, 5)
    # 3.验证码列表转成字符串
    code = ''.join(code_list)
    print(code, '我是验证码！！！')
    # 4.将验证码存到session中以便后续验证使用
    request.session['code'] = code
    # 5.将转成字符串形式的随机验证码画到图片上
    data = image.generate(code)  # data是二进制数据
    return HttpResponse(data, 'image/png')
