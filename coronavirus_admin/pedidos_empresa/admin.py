#Classes do django
from django.contrib import admin

#Classes do projeto
from pedidos_empresa.models import PedidoEmpresa
from pessoas.models import Funcionario
from pedidos.admin import PedidoAdmin

# Register your models here.
# Funcionário da empresa acessa apenas os pedidos da empresa
class PedidoEmpresaAdmin(PedidoAdmin):
    fields = ('cliente', 'status', 'data', 'horario_entrega', 'observacao_cliente', 
              'observacao_funcionario')   
    list_display = ('data', 'cliente', 'status')
    list_filter = ('cliente', 'status' )   
    search_fields = ['cliente']

    #inlines = [EnderecoTabularInline, PedidoProdutoTabularInline]
     
    def get_queryset(self, request):
        funcionario = Funcionario.objects.get(pk=request.user.pk)
        return self.model.objects.filter(empresa = funcionario.empresa)
     
    def save_model(self, request, obj, form, change):
        funcionario = Funcionario.objects.get(pk=request.user.pk)
        obj.empresa = funcionario.empresa
        super(PedidoEmpresaAdmin, self).save_model(request, obj, form, change)
        
admin.site.register(PedidoEmpresa, PedidoEmpresaAdmin)
