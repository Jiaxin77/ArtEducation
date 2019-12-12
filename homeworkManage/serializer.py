from rest_framework import  serializers

from homeworkManage.models import Homework
from userManage.serializer import StudentsSerializer


class HomeworkSerializer(serializers.ModelSerializer):
    student = StudentsSerializer(read_only=True)
    class Meta:
        model = Homework
        fields = "__all__"