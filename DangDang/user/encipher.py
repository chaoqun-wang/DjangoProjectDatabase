import os, uuid, hashlib, django

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "DangDang.settings")
django.setup()

from home.models import TUser


def generate_salt():
    """
    生成随机字符串（盐）
    :return: 返回随机字符串（盐）
    """
    salt = hashlib.md5()
    salt.update(str(uuid.uuid4()).replace('-', '').encode())
    return str(salt.hexdigest())


def generate_password(password):
    """
    密码加密
    :param password: 获取明文密码
    :return: 返回加密后的密码
    """
    sha = hashlib.sha1()
    sha.update(password.encode())
    return str(sha.hexdigest())


def get_salt(username):
    """
    获取数据库中的盐
    :param username: 获取用户名
    :return: 返回获取到的盐，没有返回None
    """
    if '@' in username:
        res = TUser.objects.filter(username=username)
    else:
        res = TUser.objects.filter(phone_number=username)
    if res:
        salt = res[0].salt
        print(salt, '获取盐')
        return salt
    return str()
