#Classes do django
from django.contrib import admin

#classes do projeto
from pessoas.models import Empresa, Cliente, Funcionario
from pessoas.forms import FuncionarioForm

# Register your models here.
class EmpresaAdmin(admin.ModelAdmin):
    list_display = ('nome_fantasia', 'cidade', 'limite_produto')
    list_filter = ('cidade', )   
    search_fields = ['nome_fantasia', ]

class FuncionarioAdmin(admin.ModelAdmin):
    form = FuncionarioForm #usado para adicionar o campo senha corretamente 
    list_display = ('nome', 'empresa') 
    list_filter = ('empresa', )  
    search_fields = ['nome', ]    

class ClienteAdmin(admin.ModelAdmin):
    list_display = ('nome', 'telefone', 'sexo') 
    search_fields = ['nome', ]

    
admin.site.register(Empresa, EmpresaAdmin)
admin.site.register(Funcionario, FuncionarioAdmin)
admin.site.register(Cliente, ClienteAdmin)
    
