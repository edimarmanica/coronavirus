#Classes do django
from django import forms

#Classes do projeto
from pessoas.models import Funcionario

class FuncionarioForm(forms.ModelForm):
    class Meta:
        model = Funcionario
        #fields = ('username', 'password',)
        fields = ('empresa', 'nome', 'username', 'password', 'is_active', 'is_staff', 'groups')
        widgets = {
            'password': forms.PasswordInput(),
        }
    