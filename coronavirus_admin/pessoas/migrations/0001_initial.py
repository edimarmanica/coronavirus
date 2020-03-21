# Generated by Django 2.2.11 on 2020-03-21 12:53

from django.conf import settings
import django.contrib.auth.models
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0011_update_proxy_permissions'),
    ]

    operations = [
        migrations.CreateModel(
            name='Cliente',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome', models.CharField(max_length=50, verbose_name='Nome')),
                ('telefone', models.IntegerField(unique=True, verbose_name='Telefone')),
            ],
            options={
                'verbose_name_plural': 'Clientes',
                'verbose_name': 'Cliente',
                'ordering': ['nome'],
            },
        ),
        migrations.CreateModel(
            name='Empresa',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome_fantasia', models.CharField(max_length=30, verbose_name='Nome Fantasia')),
                ('imagem', models.ImageField(upload_to='empresas')),
                ('limite_produto', models.IntegerField(default=30, verbose_name='Número máximo de produtos')),
            ],
            options={
                'verbose_name_plural': 'Empresas',
                'verbose_name': 'Empresa',
                'ordering': ['nome_fantasia'],
            },
        ),
        migrations.CreateModel(
            name='Funcionario',
            fields=[
                ('user_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to=settings.AUTH_USER_MODEL)),
                ('nome', models.CharField(max_length=50, verbose_name='Nome')),
                ('empresa', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='empresa', to='pessoas.Empresa')),
            ],
            options={
                'verbose_name_plural': 'Funcionários',
                'verbose_name': 'Funcionário',
                'ordering': ['nome'],
            },
            bases=('auth.user',),
            managers=[
                ('objects', django.contrib.auth.models.UserManager()),
            ],
        ),
    ]
