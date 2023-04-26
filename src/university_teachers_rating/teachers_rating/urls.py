from django.urls import path
from . import views

urlpatterns = [
	path('', views.index),
	path('api/cards', views.CardsView.as_view())
]