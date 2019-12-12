import json

from django.contrib.messages import SUCCESS
from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.
from homeworkManage.models import Homework
from homeworkManage.serializer import HomeworkSerializer
from userManage.models import Teacher, Students


def postScore(request):
    """
    POST
    教师提交分数
    :param request: 作业id、教师id、分数、评语
    :return: 提交成功/失败
    """
    print(request.body)
    req = json.loads(request.body)
    homeworkId = req['homeworkid']
    teacherId = req['teacherid']
    score = req['score']
    advice = req['advice']
    homework = Homework.objects.get(id = homeworkId)
    teacher = Teacher.objects.get(id=teacherId)
    homework.score = score
    homework.advice = advice
    homework.teacher = teacher
    homework.save()
    msg = "提交成功"
    mydict = {'result': SUCCESS, 'msg': msg}
    print(msg)
    return HttpResponse(json.dumps(mydict), content_type="application/json")

def showScore(request):
    """
    学生查看作业分数
    GET
    :param request: 学生id
    :return: 学生所有作业分数
    """
    studentId = request.GET.get('studentid')
    student = Students.objects.get(id=studentId)
    homeworks = Homework.objects.filter(student=student)
    homeworks_ser = HomeworkSerializer(homeworks,many=True)
    msg = "获取成功"
    mydict = {'result': SUCCESS, 'msg': msg, 'data':homeworks_ser.data}
    print(msg)
    return HttpResponse(json.dumps(mydict), content_type="application/json")