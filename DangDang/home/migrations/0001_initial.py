# Generated by Django 2.0.6 on 2020-03-03 12:42

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='TAddress',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('consignee', models.CharField(blank=True, max_length=255, null=True)),
                ('address', models.CharField(blank=True, max_length=255, null=True)),
                ('postcode', models.CharField(blank=True, max_length=255, null=True)),
                ('phone_number', models.CharField(blank=True, max_length=255, null=True)),
                ('telephone', models.CharField(blank=True, max_length=255, null=True)),
            ],
            options={
                'db_table': 't_address',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='TBookClassification',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('level', models.IntegerField(blank=True, null=True)),
                ('category_title', models.CharField(blank=True, max_length=255, null=True)),
            ],
            options={
                'db_table': 't_book_classification',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='TBooks',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('book_name', models.CharField(blank=True, max_length=255, null=True)),
                ('picture_one', models.CharField(blank=True, max_length=255, null=True)),
                ('author', models.CharField(blank=True, max_length=255, null=True)),
                ('publisher', models.CharField(blank=True, max_length=255, null=True)),
                ('publishing_time', models.DateTimeField(blank=True, null=True)),
                ('commentnum', models.IntegerField(blank=True, null=True)),
                ('dang_price', models.DecimalField(blank=True, decimal_places=2, max_digits=10, null=True)),
                ('price', models.DecimalField(blank=True, decimal_places=2, max_digits=10, null=True)),
                ('edition', models.IntegerField(blank=True, null=True)),
                ('pages', models.IntegerField(blank=True, null=True)),
                ('words', models.IntegerField(blank=True, null=True)),
                ('printing_time', models.DateTimeField(blank=True, null=True)),
                ('book_size', models.CharField(blank=True, max_length=255, null=True)),
                ('paper_type', models.CharField(blank=True, max_length=255, null=True)),
                ('impression', models.IntegerField(blank=True, db_column='Impression', null=True)),
                ('packaging_type', models.CharField(blank=True, max_length=255, null=True)),
                ('is_set', models.IntegerField(blank=True, null=True)),
                ('isbn', models.CharField(blank=True, db_column='ISBN', max_length=255, null=True)),
                ('advertise', models.CharField(blank=True, max_length=255, null=True)),
                ('recommend', models.TextField(blank=True, null=True)),
                ('content_recommendation', models.TextField(blank=True, null=True)),
                ('about_author', models.TextField(blank=True, null=True)),
                ('catalogue', models.TextField(blank=True, null=True)),
                ('media_reviews', models.TextField(blank=True, null=True)),
                ('read_online', models.TextField(blank=True, null=True)),
                ('picture_two', models.CharField(blank=True, max_length=255, null=True)),
                ('picture_three', models.CharField(blank=True, max_length=255, null=True)),
                ('picture_four', models.CharField(blank=True, max_length=255, null=True)),
                ('picture_five', models.CharField(blank=True, max_length=255, null=True)),
                ('add_time', models.DateTimeField(blank=True, null=True)),
                ('sales', models.IntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 't_books',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='TOrder',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('order_number', models.CharField(blank=True, max_length=255, null=True)),
                ('generated_time', models.DateTimeField(blank=True, null=True)),
                ('total_price', models.DecimalField(blank=True, decimal_places=2, max_digits=10, null=True)),
                ('status', models.IntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 't_order',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='TOrderDetail',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('price', models.DecimalField(blank=True, decimal_places=2, max_digits=10, null=True)),
                ('books_number', models.IntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 't_order_detail',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='TShoppingCart',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('quantity', models.IntegerField(blank=True, null=True)),
                ('status', models.IntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 't_shopping_cart',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='TUser',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('username', models.CharField(blank=True, max_length=255, null=True)),
                ('phone_number', models.CharField(blank=True, max_length=255, null=True)),
                ('password', models.CharField(blank=True, max_length=255, null=True)),
                ('salt', models.CharField(blank=True, max_length=255, null=True)),
                ('status', models.IntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 't_user',
                'managed': False,
            },
        ),
    ]
