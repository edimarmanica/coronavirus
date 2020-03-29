#Classes do django
from django.db import models

#Classes do projeto
from pedidos.models import Pedido 

# Create your models here.
class PedidoEmpresa(Pedido):
    class Meta:
        proxy = True
        ordering = ["data", ] 
        verbose_name="Pedido da empresa" 
        verbose_name_plural="Pedidos da empresa" 
