#Classes do django
from django.contrib import admin

#Classes do projeto
from pedidos_empresa.models import ProdutoEmpresa
from pessoas.models import Funcionario
from pedidos.admin import ProdutoAdmin

# Register your models here.
# Funcionário da empresa acessa apenas os produtos da empresa
class ProdutoEmpresaAdmin(ProdutoAdmin):
    fields = ('descricao', 'categoria', 'valor', 'ativo', 'imagem') 
     
    def get_queryset(self, request):
        funcionario = Funcionario.objects.get(pk=request.user.pk)
        return self.model.objects.filter(empresa = funcionario.empresa)
     
    def save_model(self, request, obj, form, change):
        funcionario = Funcionario.objects.get(pk=request.user.pk)
        obj.empresa = funcionario.empresa
        super(ProdutoEmpresaAdmin, self).save_model(request, obj, form, change)
        
admin.site.register(ProdutoEmpresa, ProdutoEmpresaAdmin)
