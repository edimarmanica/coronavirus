#Classes do django
from django.contrib import admin, messages

#Classe do projeto
from pedidos.models import Pedido, Produto, CategoriaProduto, PedidoProduto, Endereco, StatusPedido, StatusProduto 

# Register your models here.
class CategoriaProdutoAdmin(admin.ModelAdmin):
    list_display = ('descricao', )   
    search_fields = ['descricao', ]
    
class StatusPedidoAdmin(admin.ModelAdmin):
    list_display = ('descricao', )   
    search_fields = ['descricao', ]
    
class StatusProdutoAdmin(admin.ModelAdmin):
    list_display = ('descricao', )   
    search_fields = ['descricao', ]
    
class ProdutoAdmin(admin.ModelAdmin):
    list_display = ('descricao', 'situacao', 'categoria')
    list_filter = ( 'situacao', 'categoria', )   
    search_fields = ['descricao', ]  
    
class EnderecoTabularInline(admin.TabularInline):
    model = Endereco
    extra = 1

    def get_extra (self, request, obj=None, **kwargs):
        """Dynamically sets the number of extra forms. 0 if the related object
        already exists or the extra configuration otherwise."""
        if obj:
            # Don't add any extra forms if the related object already exists.
            return 0
        return self.extra
    
class PedidoProdutoTabularInline(admin.TabularInline):
    model = PedidoProduto
    extra = 3

    def get_extra (self, request, obj=None, **kwargs):
        """Dynamically sets the number of extra forms. 0 if the related object
        already exists or the extra configuration otherwise."""
        if obj:
            # Don't add any extra forms if the related object already exists.
            return 0
        return self.extra
    
class PedidoAdmin(admin.ModelAdmin):
    fields = ('empresa', 'cliente', 'status', 'data', 'horario_entrega', 'observacao_cliente', 
              'observacao_funcionario')
    list_display = ('data', 'empresa', 'cliente', 'status')
    list_filter = ('empresa', 'cliente', 'status' )   
    search_fields = ['cliente', 'empresa',]

    inlines = [EnderecoTabularInline, PedidoProdutoTabularInline]
    
admin.site.register(CategoriaProduto, CategoriaProdutoAdmin)
admin.site.register(StatusProduto, StatusProdutoAdmin)
admin.site.register(Produto, ProdutoAdmin)
admin.site.register(Pedido, PedidoAdmin)
admin.site.register(StatusPedido, StatusPedidoAdmin)
