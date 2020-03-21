from django.db import models

# Create your models here.
class Cidade(models.Model):
    nome = models.CharField(max_length=50, verbose_name="Nome")
    
    def __str__(self):
       return self.nome
   
    class Meta:
        ordering = ["nome", ] 
        verbose_name="Cidade" 
        verbose_name_plural="Cidades" 