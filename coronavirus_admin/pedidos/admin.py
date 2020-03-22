#Classes do django
from django.contrib import admin, messages

#Classe do projeto
from pedidos.models import Pedido, Produto, CategoriaProduto, PedidoProduto, Endereco, StatusPedido 

# Register your models here.
class CategoriaProdutoAdmin(admin.ModelAdmin):
    list_display = ('descricao', )   
    search_fields = ['descricao', ]
    
class StatusPedidoAdmin(admin.ModelAdmin):
    list_display = ('descricao', )   
    search_fields = ['descricao', ]
    
class ProdutoAdmin(admin.ModelAdmin):
    list_display = ('descricao', 'empresa', 'ativo', 'valor')
    list_filter = ('empresa', 'ativo')   
    search_fields = ['descricao', ]
    
    def save_model(self, request, obj, form, change):
        #se o produto está ativo, tem que verificar se não ultrapassa o número máximo de produtos ativos por empresa
        if obj.ativo:
            nr_produtos_ativos = Produto.objects.filter(empresa=obj.empresa, ativo=True).count()
            
            if change:#se é update só precisa verificar se o produto era inativo antes 
                if not(Produto.objects.get(pk=obj.pk).ativo): #se o produto era inativo
                    if obj.empresa.limite_produto <= nr_produtos_ativos:
                        messages.set_level(request, messages.ERROR)
                        messages.error(request, 'O limite de produtos ativos para a sua empresa foi atingido. O produto não foi alterado!')
                        return
            else: #se é insert, tem que verificar
                if obj.empresa.limite_produto <= nr_produtos_ativos:
                    messages.set_level(request, messages.ERROR)
                    messages.error(request, 'O limite de produtos ativos para a sua empresa foi atingido. O produto não foi inserido!')
                    return
        super(ProdutoAdmin, self).save_model(request, obj, form, change)
    
    
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
    list_display = ('data', 'empresa', 'cliente', 'valor_total', 'status')
    list_filter = ('empresa', 'cliente', 'status' )   
    search_fields = ['cliente', 'empresa',]

    inlines = [EnderecoTabularInline, PedidoProdutoTabularInline]
    
admin.site.register(CategoriaProduto, CategoriaProdutoAdmin)
admin.site.register(Produto, ProdutoAdmin)
admin.site.register(Pedido, PedidoAdmin)
admin.site.register(StatusPedido, StatusPedidoAdmin)
