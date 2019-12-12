from django.conf import settings
from django.conf.urls.static import static
from django.urls import path
from . import views

app_name = 'homeworkManage'

urlpatterns = [
    path('postHomework', views.postHomework, name='postHomework'),
    path('showStudent', views.showStudent,name='showStudent'),
    path('showHomework', views.showHomework, name='showHomework')

]