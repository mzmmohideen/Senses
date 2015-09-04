from django.shortcuts import render_to_response, HttpResponse, render
from senses.models import *
from django.contrib.auth.models import User
from django.core.context_processors import csrf
from django.contrib.auth import authenticate, login
from django.views.decorators.csrf import *
import json,csv
from django.contrib.auth.decorators import login_required
from collections import defaultdict
from django.core.exceptions import ObjectDoesNotExist
from datetime import datetime, time
from traceback import format_exc
from itertools import groupby
from operator import itemgetter

@csrf_exempt
def login(request):
    if User.objects.filter(first_name="Admin"):
        return render(request, 'login.html')
    else:
        return render(request, 'signup.html')

# @login_required         
def apping(request):    
    return render(request, 'apping.html')        

@csrf_exempt
def login_page(request):
    a = json.loads(request.body)['data']
    user = authenticate(username=a['username'], password=a['password'])
    if user:
        # return render(request, 'apping.html')
        return HttpResponse(content=json.dumps({'data':'success'}), content_type='Application/json')
    else:
        return HttpResponse(content=json.dumps({'data':'failed'}), content_type='Application/json')

@csrf_exempt
def signup(request):
    data = json.loads(request.body)['data']
    user = User.objects.create(username=data['username'],first_name="Admin")
    user.set_password(data['password'])
    user.save()    
    return HttpResponse(content=json.dumps({'data':'success'}), content_type='Application/json')

def addLocation(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        try:
            district = District.objects.get(district_name=data['district'])
            if Taluk.objects.filter(district=district,taluk_name=data['taluk']):
                return HttpResponse(content=json.dumps({'data':'District and Taluk Exist!'}), content_type='Application/json')
            else:
                taluk = Taluk.objects.create(district=district,taluk_name=data['taluk'])
                return HttpResponse(content=json.dumps({'data':'success'}), content_type='Application/json')
        except:
            print '?????',repr(format_exc())
            district = District.objects.create(district_name=data['district'])
            taluk = Taluk.objects.create(district=district,taluk_name=data['taluk'])
        return HttpResponse(content=json.dumps({'data':'success'}), content_type='Application/json')
    else:
        print request.GET
        data = defaultdict(list)
        for i in Taluk.objects.all():
            data[i.district.district_name].append(i.taluk_name)
        # taluk = map(lambda x:{'district'}    Taluk.objects.all())
        print 'data',data
        return HttpResponse(content=json.dumps({'data':data}), content_type='Application/json')

def add_masjid(request):
    if request.method == 'POST':        
        data = json.loads(request.body)
        taluk = Taluk.objects.get(district=District.objects.get(district_name=data['district']),taluk_name=data['taluk'])
        if Masjid.objects.filter(taluk=taluk,name=data['masjid_name']):
            masjid = Masjid.objects.filter(taluk=taluk,name=data['masjid_name']).update(name=data['masjid'],musallas=data['musallas'],location=data['address'])
            return HttpResponse(content=json.dumps({'data':'updated!'}),content_type='Application/json')
        else:
            masjid = Masjid.objects.create(taluk=taluk,name=data['masjid_name'],musallas=data['musallas'],location=data['address'])
            return HttpResponse(content=json.dumps({'data':'success!'}),content_type='Application/json')
    else:
        get_members = map(lambda x:{'name':x.name,'taluk':x.taluk.taluk_name,'district':x.taluk.district.district_name,'musallas':x.musallas,'location':x.location},Masjid.objects.all())
        print 'get_members',get_members
        return HttpResponse(content=json.dumps({'data':get_members}),content_type='Application/json')

def masjid_member(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        taluk = Taluk.objects.get(district=District.objects.get(district_name=data['data']['district']),taluk_name=data['data']['taluk'])
        masjid_val = Masjid.objects.get(taluk=taluk,name=data['data']['masjid_name'])
        if Masjid_members.objects.filter(masjid=masjid_val,member_name=data['member_name'],designation=data['designation']):
            masjid = Masjid_members.objects.filter(masjid=masjid_val,member_name=data['member_name'],designation=data['designation']).update(age=data['age'],mobile=data['mobile'],address=data['address'])
            response = 'updated'
        else:
            masjid = Masjid_members.objects.create(masjid=masjid_val,member_name=data['member_name'],designation=data['designation'],age=data['age'],mobile=data['mobile'],address=data['address'])
            response = 'success'
        return HttpResponse(content=json.dumps({'data':response}),content_type='Application/json')
    else:
        data = request.GET
        taluk = Taluk.objects.get(taluk_name=data['taluk'],district=District.objects.get(district_name=data['district']))
        if Masjid.objects.filter(taluk=taluk,name=data['masjid']):
            masjid = Masjid.objects.get(taluk=taluk,name=data['masjid'])
            get_members = map(lambda x:{'name':x.member_name,'age':x.age,'mobile':x.mobile,'address':x.address,'designation':x.designation},Masjid_members.objects.filter(masjid=masjid))
            print 'get_members',get_members
        return HttpResponse(content=json.dumps({'data':get_members}),content_type='Application/json')    

def familyData(request):
    if request.method == 'POST':
        data = json.loads(request.body)['value']
        print 'data',data
        taluk = Taluk.objects.get(taluk_name=data['taluk'],district=District.objects.get(district_name=data['district']))
        print 'taluk',taluk
        masjid = Masjid.objects.get(name=data['masjid']['name'],taluk=taluk)
        print 'masjid',masjid
        if Family.objects.filter(family_id=data['familyid']):
            family = Family.objects.filter(family_id=data['familyid'])
        else:
            family = Family.objects.create(family_id=data['familyid'])
        return HttpResponse(content=json.dumps({'data':data}),content_type='Application/json')

