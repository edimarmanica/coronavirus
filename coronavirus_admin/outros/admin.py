#classes do django
from django.contrib import admin

#classes do projeto
from outros.models import Cidade

# Register your models here.
class CidadeAdmin(admin.ModelAdmin):
    list_display = ('nome', ) 
    search_fields = ['nome', ]
    
admin.site.register(Cidade, CidadeAdmin)

