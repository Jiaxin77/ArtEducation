# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.


class Students(models.Model):
    id = models.AutoField(primary_key=True, verbose_name="学生ID")
    name = models.CharField(max_length=1000,verbose_name="学生姓名")
    studentId = models.CharField(max_length=1000,verbose_name="学号")
    phonenumber = models.CharField(max_length=1000,null=True, verbose_name="手机号")
    password = models.CharField(max_length=1000,verbose_name="密码")

class Teacher(models.Model):
    id = models.AutoField(primary_key=True,verbose_name="教师ID")
    name = models.CharField(max_length=1000,verbose_name="教师姓名")
    teacherId = models.CharField(max_length=1000,verbose_name="教职工号")
    phonenumber = models.CharField(max_length=1000, null=True, verbose_name="手机号")
    password = models.CharField(max_length=1000, verbose_name="密码")


#记录登录时间和浏览器
class StudentLoginLog(models.Model):
    id = models.AutoField(primary_key=True,verbose_name="记录ID")
    user = models.ForeignKey('userManage.Students',on_delete=models.CASCADE,verbose_name="用户")
    loginTime = models.DateTimeField(auto_now_add=True,verbose_name="登录时间")
    browser = models.CharField(max_length=1000,null=True,verbose_name="所用浏览器")
