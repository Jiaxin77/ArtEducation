# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import json

from django.contrib.messages import SUCCESS
from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.


#新建课程
from courseManage.models import Course


def addCourse(request):
    print(request.body)
    req = json.loads(request.body)
    courseName = req['courseName']
    courseDes = req['courseDes']
    Course.objects.create(name=courseName,introduction=courseDes)
    msg = "添加成功"
    mydict = {'result': SUCCESS, 'msg': msg}
    print(msg)
    return HttpResponse(json.dumps(mydict), content_type="application/json")
