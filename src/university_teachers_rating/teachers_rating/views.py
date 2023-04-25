from django.shortcuts import render

# Create your views here.

def index(request):
    cards = [{
        'name': 'Konovalov'
    }, {
        'name': 'длиннаааааааяфамилия имя отчество'
    }, {
        'name': 'Кривой Дмитрий Александрович'
    }, {
        'name': 'Васеков Олень Попович'
    }]

    data = {'cards': cards}
    return render(request, 'index.html', context=data)