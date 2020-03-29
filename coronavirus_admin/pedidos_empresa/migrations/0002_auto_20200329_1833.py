# Generated by Django 2.2.11 on 2020-03-29 21:33

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('pedidos', '0004_auto_20200329_1819'),
        ('pedidos_empresa', '0001_initial'),
    ]

    operations = [
        migrations.DeleteModel(
            name='ProdutoEmpresa',
        ),
        migrations.CreateModel(
            name='PedidoEmpresa',
            fields=[
            ],
            options={
                'verbose_name': 'Pedido da empresa',
                'proxy': True,
                'verbose_name_plural': 'Pedidos da empresa',
                'constraints': [],
                'indexes': [],
                'ordering': ['data'],
            },
            bases=('pedidos.pedido',),
        ),
    ]