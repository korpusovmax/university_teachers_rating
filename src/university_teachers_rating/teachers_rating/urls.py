from django.urls import path
from . import views

urlpatterns = [
	path('', views.index),
	path('rating/<professor_id>', views.ratings),
	path('api/cards', views.CardsView.as_view(), name='cards')
]