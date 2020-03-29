# Generated by Django 2.2.11 on 2020-03-29 21:14

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('pessoas', '0001_initial'),
        ('outros', '0001_initial'),
        ('pedidos', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='pedido',
            name='cliente',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='cliente', to='pessoas.Cliente'),
        ),
        migrations.AddField(
            model_name='pedido',
            name='empresa',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='empresa_pedido', to='pessoas.Empresa'),
        ),
        migrations.AddField(
            model_name='pedido',
            name='funcionario',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, related_name='funcionario', to='pessoas.Funcionario', verbose_name='Funcionário'),
        ),
        migrations.AddField(
            model_name='pedido',
            name='status',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='status', to='pedidos.StatusPedido', verbose_name='Situação'),
        ),
        migrations.AddField(
            model_name='endereco',
            name='cidade',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='cidade_endereco', to='outros.Cidade'),
        ),
        migrations.AddField(
            model_name='endereco',
            name='pedido',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='pedido', to='pedidos.Pedido'),
        ),
        migrations.AlterUniqueTogether(
            name='pedidoproduto',
            unique_together={('pedido', 'produto')},
        ),
    ]
