from rest_framework import  serializers

from userManage.models import Students,Teacher,StudentLoginLog


class StudentsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Students
        exclude = ('password',)


class TeachersSerializer(serializers.ModelSerializer):
    class Meta:
        model = Teacher
        exclude = ('password',)
