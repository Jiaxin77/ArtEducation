from django.conf import settings
from django.conf.urls.static import static
from django.urls import path
from . import views

app_name = 'scoreManage'

urlpatterns = [
    path('postScore', views.postScore, name='postScore'),
    path('showScore', views.showScore, name='showScore'),
]