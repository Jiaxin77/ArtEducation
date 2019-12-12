
# Create your views here.
# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib.auth.hashers import make_password,check_password
from django.contrib.messages import ERROR, SUCCESS
from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.
import json


from userManage.models import Students, Teacher, StudentLoginLog

# 注册
from userManage.serializer import StudentsSerializer, TeachersSerializer


def register(request):
    """
    POST
    :param request: 姓名、手机号、学号、密码
    :return: 成功/失败
    """
    print(request.body)
    req = json.loads(request.body)
    username = req['username']
    password = req['password']
    phonenumber = req['phonenumber']
    studentid = req['studentid']

    if Students.objects.filter(studentId=studentid):
        msg = "用户已存在，请直接登录"
        mydict = {'result': ERROR, 'msg': msg}
        print("用户已存在")
        return HttpResponse(json.dumps(mydict), content_type="application/json")
    else:
        userPassword = make_password(password, None, 'pbkdf2_sha256')  # 密码加密
        Students.objects.create(name=username, password=userPassword, phonenumber=phonenumber,studentId=studentid)
        msg = "注册成功"
        mydict = {'result': SUCCESS, 'msg': msg}
        print(msg)
        return HttpResponse(json.dumps(mydict), content_type="application/json")

#登录
def login(request):
    """
    POST
    :param request: 学号、密码
    :return: 成功/失败，用户信息
    """
    print(request.body)
    req = json.loads(request.body)
    userid = req['userid'] # 学号或教工号
    password = req['password']
    user_type = req['user_type']  # student / teacher
    if user_type == 'student':
        thisStudent = Students.objects.filter(studentId=userid)
        if thisStudent.exists():
            for student in thisStudent:
                ret = check_password(password, student.password)
                if ret:
                    student_ser = StudentsSerializer(student)
                    msg = "登录成功"
                    StudentLoginLog.objects.create(user=student)
                    mydict = {'result': SUCCESS, 'msg': msg,'data':student_ser.data}

                    print(msg)
                    return HttpResponse(json.dumps(mydict), content_type="application/json")
                else:
                    msg = "密码错误，登录失败"
                    mydict = {'result': ERROR, 'msg': msg}
                    print(msg)
                    return HttpResponse(json.dumps(mydict), content_type="application/json")


        else:
            msg = "用户不存在，登录失败"
            mydict = {'result': ERROR, 'msg': msg}
            print(msg)
            return HttpResponse(json.dumps(mydict), content_type="application/json")
    elif user_type == 'teacher':
        thisTeacher = Teacher.objects.filter(teacherId=userid)
        if thisTeacher.exists():
            for teacher in thisTeacher:
                ret = check_password(password, teacher.password)
                if ret:
                    teacher_ser = TeachersSerializer(teacher)
                    msg = "登录成功"
                    mydict = {'result': SUCCESS, 'msg': msg,'data':teacher_ser.data}
                    print(msg)
                    return HttpResponse(json.dumps(mydict), content_type="application/json")
                else:
                    msg = "密码错误，登录失败"
                    mydict = {'result': ERROR, 'msg': msg}
                    print(msg)
                    return HttpResponse(json.dumps(mydict), content_type="application/json")

        else:
            msg = "用户不存在，登录失败"
            mydict = {'result': ERROR, 'msg': msg}
            print(msg)
            return HttpResponse(json.dumps(mydict), content_type="application/json")






def addTeacher(request):
    """
    POST
    :param request: 姓名、手机号、学号、密码
    :return: 成功/失败
    """
    print(request.body)
    req = json.loads(request.body)
    username = req['username']
    password = req['password']
    phonenumber = req['phonenumber']
    teacherId = req['teacherid']

    if Teacher.objects.filter(teacherId=teacherId):
        msg = "用户已存在，请直接登录"
        mydict = {'result': ERROR, 'msg': msg}
        print("用户已存在")
        return HttpResponse(json.dumps(mydict), content_type="application/json")
    else:
        userPassword = make_password(password, None, 'pbkdf2_sha256')  # 密码加密
        Teacher.objects.create(name=username, password=userPassword, phonenumber=phonenumber,teacherId=teacherId)
        msg = "注册成功"
        mydict = {'result': SUCCESS, 'msg': msg}
        print(msg)
        return HttpResponse(json.dumps(mydict), content_type="application/json")