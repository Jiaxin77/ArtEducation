import json

from django.contrib.messages import SUCCESS
from django.http import HttpResponse

from courseManage.models import Course
from homeworkManage.models import Homework
from homeworkManage.serializer import HomeworkSerializer
from userManage.models import Students
from django.utils import timezone


def postHomework(request):
    """
    学生交作业 ##重复的话 覆盖之前的
    :param request: （课程ID）学生id、作业内容
    :return:
    """

    courseid = 1 #目前写定，之后增加课程后会获取
    studentid = request.POST.get('studentid')
    files = request.FILES
    homeworkContent = files['homework']

    student = Students.objects.get(id=studentid)
    course = Course.objects.get(id=courseid)
    save_time = timezone.now()

    null_flag = True # 判断之前是否提交过
    if Homework.objects.filter(student=student): #存在此学生的作业
        homeworks = Homework.objects.filter(student=student)
        for homework in homeworks:
            if homework.course == course: #是这个课程
                null_flag = False
                homework.content = homeworkContent #保存作业内容
                homework.uploadtime = save_time
                homework.save()
    if null_flag == True: #没有提交过
        Homework.objects.create(course=course,student=student,content=homeworkContent,uploadtime=save_time)
    msg = "提交成功"
    mydict = {'result': SUCCESS, 'msg': msg}
    print(msg)
    return HttpResponse(json.dumps(mydict), content_type="application/json")


def showStudent(request):
    """
    GET
    教师查看学生作业们
    :param request: 教师id、（课程id）
    :return: 获取已提交学生列表（按学号排序）
    """
    teacherId = request.GET.get('teacherid')
    courseId = 1 #此处写定，之后会从前端获取
    course = Course.objects.get(id=courseId)
    homework_info = Homework.objects.filter(course=course).order_by("student__studentId")
    homework_ser = HomeworkSerializer(homework_info,many=True)
    msg = "获取成功"
    mydict = {'result': SUCCESS, 'msg': msg,'data':homework_ser.data}
    print(msg)
    return HttpResponse(json.dumps(mydict), content_type="application/json")

def showHomework(request):
    """
    GET
    获取某一作业的内容
    :param request: 作业id
    :return: 作业内容、作业id、作业提交时间
    """
    homeworkId = request.GET.get('homeworkid')
    homework = Homework.objects.get(id=homeworkId)
    homework_ser = HomeworkSerializer(homework)
    msg = "获取成功"
    mydict = {'result': SUCCESS, 'msg': msg, 'data': homework_ser.data}
    print(msg)
    return HttpResponse(json.dumps(mydict), content_type="application/json")







