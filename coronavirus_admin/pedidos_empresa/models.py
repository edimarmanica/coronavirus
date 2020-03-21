#Classes do django
from django.db import models

#Classes do projeto
from pedidos.models import Produto 

# Create your models here.
class ProdutoEmpresa(Produto):
    class Meta:
        proxy = True
        ordering = ["descricao", ] 
        verbose_name="Produto da empresa" 
        verbose_name_plural="Produtos da empresa" 
