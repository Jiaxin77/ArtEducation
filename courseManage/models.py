# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.
class Course(models.Model):
    id = models.AutoField(primary_key=True,verbose_name="课程ID")
    name = models.CharField(max_length=1000,verbose_name="课程名称")
    introduction = models.CharField(max_length=1000, null=True, verbose_name="课程简介")
