# Generated by Django 2.2.11 on 2020-03-21 20:37

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('pedidos', '0005_auto_20200321_1734'),
    ]

    operations = [
        migrations.AlterField(
            model_name='pedido',
            name='status',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, related_name='status', to='pedidos.StatusPedido', verbose_name='Situação'),
            preserve_default=False,
        ),
    ]
