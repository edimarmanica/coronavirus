#classes do django
from django.db import models
from django.contrib.auth.models import User

#classes do projeto
from outros.models import Cidade

#choices
CHOICES_SEXO = (
  (0, "Masculino"),
  (1, "Feminino"),
  (2, "Outro")
)

# Create your models here.
class Empresa(models.Model):
    nome_fantasia = models.CharField(max_length=30, verbose_name="Nome Fantasia")
    cidade = models.ForeignKey(Cidade, on_delete=models.PROTECT, related_name="cidade")
    imagem = models.ImageField(upload_to='empresas')
    limite_produto = models.IntegerField(verbose_name="Número máximo de produtos", default=30)
    
    
    def __str__(self):
       return self.nome_fantasia + ' - ' + self.cidade.nome
   
    class Meta:
        ordering = ["nome_fantasia", ] 
        verbose_name="Empresa" 
        verbose_name_plural="Empresas" 

class Cliente(models.Model):
    nome = models.CharField(max_length=50, verbose_name="Nome")
    telefone = models.BigIntegerField(verbose_name="Telefone", unique=True)
    sexo = models.IntegerField(choices=CHOICES_SEXO, verbose_name="Sexo")
    
    def __str__(self):
       return self.nome
   
    class Meta:
        ordering = ["nome", ] 
        verbose_name="Cliente" 
        verbose_name_plural="Clientes" 

class Funcionario(User):
    nome = models.CharField(max_length=50, verbose_name="Nome")
    empresa = models.ForeignKey(Empresa, on_delete=models.PROTECT, related_name="empresa")
    
    User._meta.get_field('is_staff').default = True
    
    def __str__(self):
       return self.nome
   
    class Meta:
        ordering = ["nome", ] 
        verbose_name="Funcionário" 
        verbose_name_plural="Funcionários"        
