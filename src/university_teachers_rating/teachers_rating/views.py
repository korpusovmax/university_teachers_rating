from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
import psycopg2


# local backend functions
def send_rate():
    # TODO: отправка отзыва на проверку
    # возможные входные данные - текст отзыва, оценка/5,
    # айди аккаунта отправителя
    pass

def get_avg_rating():
    # TODO: получение средней оценки препода
    # оценка должна окруляться до десятых, а если число круглое не выводить .0
    pass

# TODO: лайк
# TODO: дизлайк

# Rest API
class CardsView(APIView):
    def get(self, request):
        conn = psycopg2.connect(
            host="localhost",
            port="54321",
            database="Professors_views",
            user="postgres",
            password="7850576"
        )

        cur = conn.cursor()

        #with open('../prof_views.sql', 'r') as file:
        #    sql = file.read()
        #    print(sql)
        cur.execute('SELECT fio FROM professors_data')

        # res = [{
        #         'name': 'Konovalov'
        #     }, {
        #         'name': 'двойная-фамилия имя отчество'
        #     }, {
        #         'name': 'Кривой Дмитрий Александрович'
        #     }, {
        #         'name': 'Васеков Олень Попович'
        #     }]
        res = [{'name': row[0]} for row in cur.fetchall()[:6]]

        cur.close()
        conn.close()
        data = {'cards': res}
        # return Response({'cards': res})
        return render(request, 'card.html', context=data)

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