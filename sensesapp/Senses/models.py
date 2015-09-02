from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User

STATUS = (('Male', 'Male'), ('Female', 'Female'))
FINANCIAL = (('Male', 'Male'), ('Female', 'Female'))

class District(models.Model):
    district_name = models.CharField(max_length=50,unique=True)

class Taluk(models.Model):
    district = models.ForeignKey(District)
    taluk_name = models.CharField(max_length=30)

class Masjid(models.Model):
    taluk = models.ForeignKey(Taluk)
    name = models.CharField(max_length=30)
    musallas = models.CharField(max_length=20)
    location = models.CharField(max_length=30)

class Masjid_members(models.Model):
    masjid = models.ForeignKey(Masjid)
    member_name = models.CharField(max_length=30)
    age = models.CharField(max_length=30)
    mobile = models.CharField(max_length=20)
    address = models.CharField(max_length=50)
    designation = models.CharField(max_length=20)

class Family(models.Model):
    ration_card_id =  models.CharField(max_length=20)
    address = models.CharField(max_length=50)
    city = models.CharField(max_length=20)
    state = models.CharField(max_length=20)
    mobile = models.CharField(max_length=20)
    mother_tongue = models.CharField(max_length=20)
    house_type = models.CharField(max_length=50, choices=STATUS)
    toilet = models.BooleanField(default=True)
    financial_status = models.CharField(max_length=50, choices=FINANCIAL)

class Scheme(models.Model):
    scheme_type = models.CharField(max_length=20)
    name = models.CharField(max_length=20)
    description = models.CharField(max_length=30,null=True)# Create your views here.
    
class Member(models.Model):
    govt_id = models.CharField(max_length=20)
    name = models.CharField(max_length=20)
    gender = models.CharField(max_length=10)
    age = models.CharField(max_length=10)
    Relation = models.CharField(max_length=20)
    marital_status = models.CharField(max_length=20)
    voter_status = models.BooleanField(default=False)
    family = models.ForeignKey(Family)
    job_status = models.CharField(max_length=20)
    curr_location = models.CharField(max_length=20)
    to_join_madarasa = models.BooleanField(max_length=20) 
    schemes = models.ManyToManyField(Scheme)



# Create your models here.
