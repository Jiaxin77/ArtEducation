import json

from courseManage.models import Course
from homeworkManage.models import Homework
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
    null_flag = True # 判断之前是否提交过
    if Homework.objects.filter(student=student): #存在此学生的作业
        homeworks = Homework.objects.filter(student=student)
        for homework in homeworks:
            if homework.course == course: #是这个课程
                null_flag = False
                homework.content = homeworkContent #保存作业内容
                save_time = timezone.now()
                homework.uploadtime = save_time
                homework.save()






