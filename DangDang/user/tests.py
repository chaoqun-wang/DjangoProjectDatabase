from django.test import TestCase
import re, uuid


# Create your tests here.


def hehe():
    username = input('请输入:')
    # re_phone = r"^1[35678]\d{9}$"
    if re.match(r"^1[35678]\d{9}$", username):
        return 1
    return 0

