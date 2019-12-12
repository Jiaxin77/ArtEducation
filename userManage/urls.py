from django.conf import settings
from django.conf.urls.static import static
from django.urls import path
from . import views

app_name = 'userManage'

urlpatterns = [
    path('register', views.register, name='register'),
    path('login',views.login, name='login'),
    path('addTeacher',views.addTeacher,name='addTeacher')
]