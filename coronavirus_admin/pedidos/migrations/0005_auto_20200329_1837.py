# Generated by Django 2.2.11 on 2020-03-29 21:37

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('pedidos', '0004_auto_20200329_1819'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='pedidoproduto',
            name='valor_total',
        ),
        migrations.RemoveField(
            model_name='pedidoproduto',
            name='valor_unitario',
        ),
    ]