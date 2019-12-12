# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.


def homework_file(instance, filename):
    return "homework/{course}/{student}/{file}".format(instance.id, course=instance.course.name,
                                                             student=instance.student.studentId,file=filename)
class Homework(models.Model):
    id = models.AutoField(primary_key=True,verbose_name="作业id")
    course = models.ForeignKey("courseManage.Course",on_delete=models.SET_NULL,null=True,verbose_name="课程")
    student = models.ForeignKey('userManage.Students', on_delete=models.SET_NULL,null=True,verbose_name="学生")
    content = models.ImageField(upload_to=homework_file,null=True,verbose_name="作业内容")
    uploadtime = models.DateTimeField(verbose_name="上传时间")
    score = models.FloatField(null=True,verbose_name="分数")
    advice = models.CharField(max_length=2000,null=True,verbose_name="评语")
    teacher = models.ForeignKey('userManage.Teacher',null=True,on_delete=models.SET_NULL,verbose_name="评分老师")
