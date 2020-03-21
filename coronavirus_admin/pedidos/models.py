#Classes do django
from django.db import models

#Classes do projeto
from pessoas.models import Funcionario, Empresa, Cliente
from outros.models import Cidade 

#choices
CHOICES_STATUS = (
  (0, "Aguardando atendimento"),
  (1, "Em atendimento"),
  (2, "Aguardando entrega"),
  (3, "Entregue"),
  (4, "Cancelado"),
)

# Create your models here.
class CategoriaProduto(models.Model):
    descricao = models.CharField(max_length=30, verbose_name="Descrição")
    
    def __str__(self):
       return self.descricao
   
    class Meta:
        ordering = ["descricao", ] 
        verbose_name="Categoria de Produtos" 
        verbose_name_plural="Categorias de Produtos" 
        
        
class Produto(models.Model):
    empresa = models.ForeignKey(Empresa, on_delete=models.PROTECT, related_name="empresa_produto")
    descricao = models.CharField(max_length=100, verbose_name="Descrição")
    categoria = models.ForeignKey(CategoriaProduto, on_delete=models.PROTECT, related_name="categoria_produto")
    valor = models.FloatField()
    imagem = models.ImageField(upload_to='produtos', blank=True, null=True)
    
    def __str__(self):
       return self.descricao
   
    class Meta:
        ordering = ["descricao", ] 
        verbose_name="Produto" 
        verbose_name_plural="Produtos"        


class Pedido(models.Model):
    empresa = models.ForeignKey(Empresa, on_delete=models.PROTECT, related_name="empresa_pedido")
    cliente = models.ForeignKey(Cliente, on_delete=models.PROTECT, related_name="cliente")
    funcionario = models.ForeignKey(Funcionario, on_delete=models.PROTECT, related_name="funcionario", blank=True, null=True)
    status = models.IntegerField(choices=CHOICES_STATUS, verbose_name="Situação", default=0)
    data = models.DateTimeField(verbose_name="Data/Hora do Pedido")
    valor_total = models.FloatField()
    horario_entrega = models.CharField(max_length=30, verbose_name="Horário de entrega", help_text="Descreva os horários disponíveis para você receber os produtos.")
    observacao_cliente = models.TextField(verbose_name="Observação do Cliente", blank=True, null=True)
    observacao_funcionario = models.TextField(verbose_name="Observação do Funcionário", blank=True, null=True)
        
    def __str__(self):
       return str(self.data) + " : " + self.cliente.nome
   
    class Meta:
        ordering = ["-data", ] 
        verbose_name="Pedido" 
        verbose_name_plural="Pedidos"        


class Endereco(models.Model):
    pedido = models.ForeignKey(Pedido, on_delete=models.PROTECT, related_name="pedido")
    cidade = models.ForeignKey(Cidade, on_delete=models.PROTECT, related_name="cidade_endereco")
    endereco = models.CharField(max_length=50, verbose_name="Endereço", help_text="Por exemplo, Rua Júlio Rosa")
    numero = models.IntegerField(verbose_name="Número", help_text="Se não houver número, digite 0")
    complemento = models.CharField(max_length=50, help_text="Por exemplo, apto 402", blank=True, null=True)
    descricao = models.CharField(max_length=50, verbose_name="Descrição") 
    
class PedidoProduto(models.Model):
    pedido = models.ForeignKey(Pedido, related_query_name='pp_pedido', on_delete=models.PROTECT)
    produto = models.ForeignKey(Produto, related_query_name='pp_produto', on_delete=models.PROTECT)
    quantidade = models.IntegerField()
    valor_unitario = models.FloatField()
    valor_total = models.FloatField()
                
    def __str__(self):
        return self.produto.descricao

    class Meta:
        ordering = ["produto"]
        unique_together = (('pedido', 'produto'),)
        verbose_name = "Produtos do pedido"
        verbose_name_plural = "Produtos dos pedidos"