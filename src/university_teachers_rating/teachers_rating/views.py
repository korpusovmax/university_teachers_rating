from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
import psycopg2


N = 0


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
        global N
        conn = psycopg2.connect(host="localhost", port="54321", database="Professors_views", user="postgres",
                                password="7850576")
        cur = conn.cursor()
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

        # database = DatabaseOpen()
        # req = database.request('SELECT fio FROM professors_data')

        res = [{'name': row[0]} for row in cur.fetchall()[N:N + 4]]
        N += 4
        data = {'cards': res}
        # return Response({'cards': res})
        return render(request, 'card.html', context=data)


# Create your views here.

def index(request):
    global N
    # cards = [{
    #    'name': 'Konovalov'
    # }, {
    #    'name': 'длиннаааааааяфамилия имя отчество'
    # }, {
    #    'name': 'Кривой Дмитрий Александрович'
    # }, {
    #    'name': 'Васеков Олень Попович'
    # }]

    conn = psycopg2.connect(host="localhost", port="54321", database="Professors_views", user="postgres",
                            password="7850576")
    cur = conn.cursor()
    cur.execute('SELECT fio FROM professors_data')

    cards = [{'name': row[0]} for row in cur.fetchall()[N:N + 6]]
    N += 6
    data = {'cards': cards}
    return render(request, 'index.html', context=data)

def ratings(request, professor_id):
    print('opened page with rating of professor with id:', professor_id)
    professor = {
        'name': 'Кривой Дмитрий Александрович',
        'subject_name': 'Нет данных',
        'faculty_id': 'Факультет информационных технологий',
        'cafedra_id': 'Нет данных'
    }
    ratings_list = [
        {
            'rate': 4,
            'text': 'Тут примерный текст отзыва о преподе. Кстати, так как это первый отзыв в списке - он отобразится как лучший отзыв'
        },
        {
            'rate': 2,
            'text': 'Тут примерный текст плохого отзыва о преподе.'
        },
        {
            'rate': 1,
            'text': 'Тут примерный текст отвратительного отзыва о преподе. анон плиз:3'
        }
    ]
    data = {'ratings': ratings_list, 'professor': professor}
    return render(request, 'ratings.html', context=data)