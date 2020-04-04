from home.models import TBooks


# 创建一个书籍对象
class Book:
    def __init__(self, book_id, number):
        """
        初始化购物车中书籍属性
        :param book_id: 获取书籍id
        :param number: 获取书籍数量
        """
        # 通过书籍的id获取数据库中的书籍对象
        book = TBooks.objects.filter(id=book_id)[0]
        # 初始化书籍对象属性
        self.book_id = book.id
        self.book_name = book.book_name
        self.book_price = book.dang_price
        self.book_number = number
        self.book_picture = book.picture_one
        self.total_price = self.book_price * self.book_number
        self.publisher = book.publisher


# 创建购物车对象
class Cart:
    def __init__(self):
        """
        初始化书籍容器，用来存储购物车中的书籍对象
        """
        self.book_items = []

    def get_book(self, book_id):
        """
        获取书籍对象
        :param book_id: 获取书籍id
        :return: 书籍对象，没有自动返回None
        """
        for book in self.book_items:
            print(book.book_id, '37行', type(book.book_id))
            print(book_id, '38行', type(book_id))
            if book.book_id == book_id:
                return book

    def add_book(self, book_id, number=1):
        """
        增加书籍的方法
        :param book_id: 获取书籍id
        :param number: 获取书籍数量
        :return:
        """
        print(book_id)
        book = self.get_book(book_id)
        if book:
            print('以有此书：', book)
            book.book_number += number
            book.total_price = book.book_number * book.book_price
        else:
            print('没有此书')
            book = Book(book_id, number)
            self.book_items.append(book)

    def reduce_book(self, book_id, number=1):
        """
        减少书籍的方法
        :param book_id: 获取书籍id
        :param number: 获取书籍数量
        :return:
        """
        book = self.get_book(book_id)
        if book:
            book.book_number -= number
            book.total_price = book.book_number * book.book_price

    def change_book(self, book_id, number):
        """
        直接修改书籍数量的方法
        :param book_id: 获取书籍id
        :param number: 获取书籍数量
        :return:
        """
        book = self.get_book(book_id)
        if book:
            book.book_number = number
            book.total_price = book.book_number * book.book_price

    def del_book(self, book_id):
        """
        删除书籍的方法
        :param book_id: 获取书籍id
        :return: True:代表删除成功
        """
        book = self.get_book(book_id)
        if book:
            self.book_items.remove(book)
            return True

    def add_shopping_cart(self, book_id, number):
        """
        将购物车中的商品添加到用户的购物车中
        :param book_id: 获取书籍id
        :param user_id: 获取用户id
        :return:
        """
        book = Book(book_id, number)
        self.book_items.append(book)
