from django.conf import settings
from django.conf.urls.static import static
from django.urls import path
from . import views


app_name = 'courseManage'

urlpatterns = [
    path('addCourse', views.addCourse, name='addCourse'),
]