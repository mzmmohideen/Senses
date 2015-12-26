from django.shortcuts import render_to_response, HttpResponse, render
from senses.models import *
from django.contrib.auth.models import User
from django.core.context_processors import csrf
from django.contrib.auth import authenticate, login
from django.views.decorators.csrf import *
from django.http import HttpResponseRedirect
import json,csv
import xlrd
import os, sys, operator
import pdfkit,pdfcrowd
import collections
from django.template.loader import render_to_string
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout
from collections import defaultdict
from django.core.exceptions import ObjectDoesNotExist
from datetime import datetime, time, timedelta
from traceback import format_exc
from itertools import groupby
from operator import itemgetter
from django.db.models import Q
from py_script.import_csv_data import importcsvdata
from py_script.data_to_pdf import *

from reportlab.platypus import *
from reportlab.platypus.tables import Table

def login_check(request):
    if request.user.is_authenticated():
        if request.user.first_name == "Admin":
            return HttpResponseRedirect('/home/')
        elif SensesMembers.objects.filter(user=request.user):
            get_mem_data = SensesMembers.objects.get(user=request.user)
            if get_mem_data.member_type == 'Mohalla User':
                return HttpResponseRedirect('/mohallauser/')
            elif get_mem_data.member_type == 'End Users & Donors':
                return HttpResponseRedirect('/enduser/')                
    else:
        if User.objects.filter(first_name="Admin"):
            return render(request, 'login.html')
        else:
            return render(request, 'signup.html')

def logout_view(request):
    logout(request)
    request.session.flush()
    return HttpResponseRedirect('/login/')

def login_page(request):
    a = json.loads(request.body)['data']
    user = authenticate(username=a['username'], password=a['password'])
    if user:
        login(request,user)
        user_val=User.objects.get(username=a['username'])
        if user_val.first_name == "Admin":
            return HttpResponse(content=json.dumps({'data':'admin_dash'}), content_type='Application/json')
        elif SensesMembers.objects.filter(user=user_val):
            get_mem_data = SensesMembers.objects.get(user=user_val)
            if get_mem_data.member_type == 'Mohalla User':
                return HttpResponse(content=json.dumps({'data':'mohalla_user'}), content_type='Application/json')
            elif get_mem_data.member_type == 'End Users & Donors':
                return HttpResponse(content=json.dumps({'data':'end_user'}), content_type='Application/json')
        else:
            return HttpResponse(content=json.dumps({'data':'invalid'}), content_type='Application/json')
    else:
        return HttpResponse(content=json.dumps({'data':'failed'}), content_type='Application/json')

def signup(request):
    data = json.loads(request.body)['data']
    user = User.objects.create(username=data['username'],first_name="Admin")
    user.set_password(data['password'])
    user.save()    
    return HttpResponse(content=json.dumps({'data':'success'}), content_type='Application/json')

def user_signup(request):
    if request.user.is_authenticated():
        if request.user.first_name == "Admin":
            return HttpResponseRedirect('/home/')
        elif SensesMembers.objects.filter(user=request.user):
            get_mem_data = SensesMembers.objects.get(user=request.user)
            if get_mem_data.member_type == 'Mohalla User':
                return HttpResponseRedirect('/mohallauser/')
            elif get_mem_data.member_type == 'End Users & Donors':
                return HttpResponseRedirect('/enduser/')
    else:
        return render(request, 'user_signup.html')

@login_required(login_url='/login/')
def apping(request):    
    return render(request, 'apping.html')        

@login_required(login_url='/login/')
def mohallauser(request):    
    return render(request, 'mohuser.html')

@login_required(login_url='/login/')
def enduser(request):    
    return render(request, 'enduser.html')    

def addLocation(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        if data['status'] == 'new':
            try:
                district = District.objects.get(district_name=data['district'],district_code=data['district_code'])
                if Taluk.objects.filter(district=district,taluk_name=data['taluk']):
                    return HttpResponse(content=json.dumps({'data':'District and Taluk Exist!'}), content_type='Application/json')
                else:
                    taluk = Taluk.objects.create(district=district,taluk_name=data['taluk'])
                    return HttpResponse(content=json.dumps({'data':'success'}), content_type='Application/json')
            except:
                district = District.objects.create(district_name=data['district'],district_code=data['district_code'])
                taluk = Taluk.objects.create(district=district,taluk_name=data['taluk'])
        elif data['status'] == 'edit':
            district = District.objects.get(district_name=data['district'])
            taluk = Taluk.objects.get(district=district,taluk_name=data['taluk'])
            taluk.taluk_name = data['edit_taluk']
            taluk.save()                
        elif data['status'] == 'delete':
            district = District.objects.get(district_name=data['district'])
            taluk = Taluk.objects.get(district=district,taluk_name=data['taluk'])
            taluk.delete()                    
        return HttpResponse(content=json.dumps({'data':'success'}), content_type='Application/json')
    else:
        data = defaultdict(list)
        district = defaultdict(list)
        for k in District.objects.all():
            district[k.district_name].append(k.district_code)
        for i in Taluk.objects.all():
            data[i.district.district_name].append(i.taluk_name)
        return HttpResponse(content=json.dumps({'data':data,'district':district}), content_type='Application/json')

def SchemeData(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        try:
            if Scheme.objects.filter(scheme_type=data['scheme']):
                scheme = Scheme.objects.get(scheme_type=data['scheme'])
            else:
                scheme = Scheme.objects.create(scheme_type=data['scheme'])
            if SubScheme.objects.filter(scheme=scheme,name=data['sub']):
                return HttpResponse(content=json.dumps({'data':'Given SubScheme Exist under this Scheme!'}), content_type='Application/json')
            elif SubScheme.objects.filter(subscheme_id=data['scheme_id']):
                if SubScheme.objects.filter(scheme=scheme,name=data['sub']):
                    return HttpResponse(content=json.dumps({'data':'SubScheme Exist!'}), content_type='Application/json')
                else:
                    sub_scheme = SubScheme.objects.filter(subscheme_id=data['scheme_id']).update(scheme=scheme,name=data['sub'],description=data['description'])
                    return HttpResponse(content=json.dumps({'data':'Updated'}), content_type='Application/json')
            else:
                subScheme = SubScheme.objects.create(scheme=scheme,subscheme_id=data['scheme_id'],name=data['sub'],description=data['description'])
                return HttpResponse(content=json.dumps({'data':'success'}), content_type='Application/json')
        except:
            scheme = Scheme.objects.create(scheme_type=data['scheme'])
            sub_scheme = SubScheme.objects.create(scheme=scheme,name=data['sub'],description=data['description'],subscheme_id=data['scheme_id'])
        return HttpResponse(content=json.dumps({'data':'success'}), content_type='Application/json')
    else:
        try:
            data = request.GET['del_schem']
            service = SubScheme.objects.filter(name=data).delete()
            return HttpResponse(content=json.dumps({'data':'Deleted Successfully!'}),content_type='Application/json')
        except:
            data = defaultdict(list)
            for i in SubScheme.objects.all():
                data[i.scheme.scheme_type].append({'sub':i.name,'scheme_id':i.subscheme_id,'description':i.description})
            return HttpResponse(content=json.dumps({'data':data}), content_type='Application/json')

def getSchemeData(request):
    data = defaultdict(list)
    for i in SubScheme.objects.all():
        if Member_scheme.objects.filter(member=Member.objects.get(mem_id=request.GET['mem_id']),scheme=SubScheme.objects.get(subscheme_id=i.subscheme_id)):
            checked_val = Member_scheme.objects.get(member=Member.objects.get(mem_id=request.GET['mem_id']),scheme=SubScheme.objects.get(subscheme_id=i.subscheme_id))
            checked = checked_val.status
            solution = checked_val.solution
        else:
            checked = False
            solution = ''
        status = 'Yes' if checked == True else 'No'
        data[i.scheme.scheme_type].append({'sub':i.name,'scheme_id':i.subscheme_id,'status':status,'solution':solution})
    return HttpResponse(content=json.dumps({'data':data}), content_type='Application/json')

def add_masjid(request):
    if request.method == 'POST':        
        data = json.loads(request.body)
        if data['status'] == 'new':
            print 'data',data['district']
            district_val = District.objects.get(district_name=data['district'])
            print 'district',district_val
            taluk = Taluk.objects.get(district=district_val,taluk_name=data['taluk'])
            print 'data',data['mohalla_id']
            if data['mohalla_id']:                
                if Masjid.objects.filter(mohalla_id=data['mohalla_id'],taluk=taluk):
                    masjid = Masjid.objects.filter(mohalla_id=data['mohalla_id'],taluk=taluk).update(name=data['masjid_name'],district=district_val,musallas=data['musallas'],location=data['address'])
                    return HttpResponse(content=json.dumps({'data':'updated!'}),content_type='Application/json')
                # elif Masjid.objects.filter(mohalla_id=data['masjid_name'],taluk=taluk):
                #     return HttpResponse(content=json.dumps({'data':'Mohalla Name Exist!'}),content_type='Application/json')
            else:
                # else:
                muhalla_dis = len(Masjid.objects.filter(district=district_val))
                muhalla_dis_val = '%04d'%(muhalla_dis+1) if muhalla_dis<9999 else (muhalla_dis+1)
                mohalla_id = '%s / %s'%(district_val.district_code,muhalla_dis_val)
                if Masjid.objects.filter(mohalla_id=mohalla_id):
                    masjid = Masjid.objects.filter(mohalla_id=mohalla_id,taluk=taluk).update(name=data['masjid_name'],musallas=data['musallas'],location=data['address'],district=district_val)
                    return HttpResponse(content=json.dumps({'data':'updated!','mohalla_id':mohalla_id}),content_type='Application/json')
                else:
                    masjid = Masjid.objects.create(mohalla_id=mohalla_id,taluk=taluk,district=district_val,name=data['masjid_name'],musallas=data['musallas'],location=data['address'])
                    return HttpResponse(content=json.dumps({'data':'Mohalla Created Successfully!','mohalla_id':mohalla_id}),content_type='Application/json')
        elif data['status'] == 'delete':
            masjid = Masjid.objects.filter(mohalla_id=data['mohalla_id']).delete()
            return HttpResponse(content=json.dumps({'data':'Deleted Successfully!'}),content_type='Application/json')
    else:
        get_members = map(lambda x:{'name':x.name,'mohalla_id':x.mohalla_id,'taluk':x.taluk.taluk_name,'district':x.taluk.district.district_name,'musallas':x.musallas,'location':x.location},Masjid.objects.all())
        return HttpResponse(content=json.dumps({'data':get_members}),content_type='Application/json')

def get_mahallauser_data(request):
    mohallaData = SensesMembers.objects.get(user=request.user)
    muhalla = {'uname':request.user.username,'mohalla_id':mohallaData.masjid.mohalla_id,'musallas':mohallaData.masjid.musallas,'address':mohallaData.masjid.location,'mohalla':mohallaData.masjid.name,'taluk':mohallaData.masjid.taluk.taluk_name,'district':mohallaData.masjid.taluk.district.district_name}
    return HttpResponse(content=json.dumps({'muhalla':muhalla}),content_type='Application/json')

def family_member(request):
    if request.method == 'GET':
        member_id = request.GET['member_id']
        try:
            fetch_mem_data = Member.objects.get(mem_id=member_id)
            return HttpResponse(content=json.dumps({'familyid':fetch_mem_data.family.family_id,'makthab':fetch_mem_data.Makthab,'makthab_status':fetch_mem_data.madarasa_details,'address':fetch_mem_data.family.address,'financial_status':fetch_mem_data.family.financial_status,'mobile':fetch_mem_data.family.mobile,'name':fetch_mem_data.name,'mem_id':fetch_mem_data.mem_id,'gender':fetch_mem_data.gender,'age':fetch_mem_data.age,'marital_status':fetch_mem_data.marital_status,'voter':fetch_mem_data.voter_status}),content_type='Application/json')
        except:
            return HttpResponse(content=json.dumps({'familyid':'','makthab':'','makthab_status':'','address':'','financial_status':'','mobile':'','name':'','mem_id':'','gender':'','age':'','marital_status':'','voter':''}),content_type='Application/json')

def masjid_member(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        print 'data',data
        if data['status'] == 'new':
            masjid_val = Masjid.objects.get(mohalla_id=data['data']['mohalla_id'])
            coordinator = True if data['coordinator'] == 'Yes' else False
            if coordinator:
                print 'coordinator',coordinator
                moh_user = str(masjid_val.mohalla_id.replace(' ','').replace('/',''))
                if not User.objects.filter(username=moh_user):
                    print '1'
                    if SensesMembers.objects.filter(member_type='Mohalla User',masjid=masjid_val):
                        print '2'
                        return HttpResponse(content=json.dumps({'data':'Mohalla User Exist!'}),content_type='Application/json')    
                    elif User.objects.filter(email=data['email']):
                        print '3'
                        return HttpResponse(content=json.dumps({'data':'Email ID Exist!'}),content_type='Application/json')
                    else:
                        print 'working',data['coordinator']
                        password = '%s123'%moh_user
                        create_moh_user = User.objects.create(username=moh_user,email=data['email'],last_name=password)
                        create_moh_user.set_password(password)
                        create_moh_user.save()
                        user_add = SensesMembers.objects.create(user=create_moh_user,member_type='Mohalla User',masjid=masjid_val)
                        # response = 'Mohalla User Created Successfully!'
            whatsapp = True if data['whatsapp'] == 'Yes' else False
            if Masjid_members.objects.filter(masjid=masjid_val,member_name=data['member_name'],designation=data['designation']):
                masjid = Masjid_members.objects.filter(masjid=masjid_val,member_name=data['member_name'],designation=data['designation']).update(age=data['age'],mobile=data['mobile'],email=data['email'],is_coordinator=coordinator,is_availonwhatsapp=whatsapp,address=data['address'])
                response = 'updated'
            else:
                masjid = Masjid_members.objects.create(masjid=masjid_val,member_name=data['member_name'],designation=data['designation'],age=data['age'],mobile=data['mobile'],email=data['email'],is_coordinator=coordinator,is_availonwhatsapp=whatsapp,address=data['address'])
                response = 'success'
            return HttpResponse(content=json.dumps({'data':response}),content_type='Application/json')    
        elif data['status'] == 'edit':
            masjid = Masjid_members.objects.filter(masjid=Masjid.objects.get(mohalla_id=data['mohalla_id']),member_name=data['name'],designation=data['designation']).update(age=data['age'],mobile=data['mobile'],address=data['address'],member_name=data['name'],designation=data['designation'])
            return HttpResponse(content=json.dumps({'data':'updated'}),content_type='Application/json')
        elif data['status'] == 'delete':
            masjid = Masjid_members.objects.filter(masjid=Masjid.objects.get(mohalla_id=data['mohalla_id']),member_name=data['data']['name'],designation=data['data']['designation']).delete()                
            return HttpResponse(content=json.dumps({'data':'Deleted'}),content_type='Application/json')
    else:
        data = request.GET
        if Masjid.objects.filter(mohalla_id=data['masjid_id']):
            masjid = Masjid.objects.get(mohalla_id=data['masjid_id'])
            get_members = map(lambda x:{'name':x.member_name,'age':x.age,'email':x.email,'coordinator':x.is_coordinator,'whatsapp':x.is_availonwhatsapp,'mobile':x.mobile,'address':x.address,'designation':x.designation},Masjid_members.objects.filter(masjid=masjid))
        return HttpResponse(content=json.dumps({'data':get_members}),content_type='Application/json')    

def convert_to_IST(timestamp, convert=None):
    ist_time = timestamp+timedelta(minutes=330)
    if convert:
        ist_time = ist_time.strftime(convert)
    return ist_time

def familyData(request):
    if request.method == 'POST':
        if json.loads(request.body)['status'] == 'feed':
            data = json.loads(request.body)['value']
            data_date = datetime.strptime(data['report_date'], "%a, %d %b %Y %H:%M:%S %Z")
            taluk = Taluk.objects.get(taluk_name=data['taluk'],district=District.objects.get(district_name=data['district']))
            masjid = Masjid.objects.get(mohalla_id=data['mohalla_id'])
            toilet = True if data['toilet'] == 'Yes' else False
            insurance = True if data['health_insurance'] == 'Yes' else False
            if json.loads(request.body)['func'] == 'new':
                get_fam_id = len(Family.objects.filter(muhalla=masjid))
                fam_id_val = '%03d'%(get_fam_id+1)
                familyid = '%s / %s' %(masjid.mohalla_id,fam_id_val)
                if Family.objects.filter(family_id=familyid):
                    return HttpResponse(content=json.dumps({'data':'Family Number Exist!'}),content_type='Application/json')
                else:
                    family = Family.objects.create(family_id=familyid,muhalla=masjid,report_date=data_date,language=data['language'],ration_card=data['ration_card'],address=data['address'],mobile=data['mobile_no'],house_type=data['house'],house_cat=data['house_type'],toilet=toilet,financial_status=data['financial'],health_insurance=insurance,family_needs=data['family_needs'])
                    family_val = {'family_id':family.family_id,'date':convert_to_IST(family.report_date).strftime('%Y-%m-%d'),'muhalla':family.muhalla.name,'language':family.language,'taluk':family.muhalla.taluk.taluk_name,'district_name':family.muhalla.taluk.district.district_name,'ration_card':family.ration_card,'address':family.address,'mobile':family.mobile,'house_type':family.house_type,'donor':family.donor,'volunteer':family.volunteer,'health_insurance':family.health_insurance,'family_needs':family.family_needs,'toilet':family.toilet,'financial_status':family.financial_status}
                    response = 'Family Data Saved Successfully!'
            elif json.loads(request.body)['func'] == 'update':        
                family = Family.objects.filter(family_id=data['familyid']).update(muhalla=masjid,report_date=data_date,language=data['language'],ration_card=data['ration_card'],address=data['address'],mobile=data['mobile_no'],house_type=data['house'],house_cat=data['house_type'],toilet=toilet,financial_status=data['financial'],health_insurance=insurance,family_needs=data['family_needs'])
                try:
                    family_data = Family.objects.get(family_id=data['familyid'])
                    family_val = {'family_id':family_data.family_id,'date':convert_to_IST(family_data.report_date).strftime('%Y-%m-%d'),'muhalla':family_data.muhalla.name,'language':family_data.language,'taluk':family_data.muhalla.taluk.taluk_name,'district_name':family_data.muhalla.taluk.district.district_name,'ration_card':family_data.ration_card,'address':family_data.address,'mobile':family_data.mobile,'house_type':family_data.house_type,'house_cat':family_data.house_cat,'donor':family_data.donor,'volunteer':family_data.volunteer,'health_insurance':family_data.health_insurance,'family_needs':family_data.family_needs,'toilet':family_data.toilet,'financial_status':family_data.financial_status}
                except:
                    family_val = []                        
                response = 'Family Data Updated Successfully!'
            return HttpResponse(content=json.dumps({'data':response,'family':family_val}),content_type='Application/json')
            # try:            
            #     if data['familyid'] != '':
            #         family = Family.objects.filter(family_id=data['familyid']).update(muhalla=masjid,report_date=data_date,language=data['language'],ration_card=data['ration_card'],address=data['address'],mobile=data['mobile_no'],house_type=data['house'],toilet=toilet,financial_status=data['financial'],health_insurance=insurance,family_needs=data['family_needs'])
            #         try:
            #             family_data = Family.objects.get(family_id=data['familyid'])
            #             family_val = {'family_id':family_data.family_id,'date':convert_to_IST(family_data.report_date).strftime('%Y-%m-%d'),'muhalla':family_data.muhalla.name,'language':family_data.language,'taluk':family_data.muhalla.taluk.taluk_name,'district_name':family_data.muhalla.taluk.district.district_name,'ration_card':family_data.ration_card,'address':family_data.address,'mobile':family_data.mobile,'house_type':family_data.house_type,'donor':family_data.donor,'volunteer':family_data.volunteer,'health_insurance':family_data.health_insurance,'family_needs':family_data.family_needs,'toilet':family_data.toilet,'financial_status':family_data.financial_status}
            #         except:
            #             family_val = []                        
            #         response = 'Family Data Updated Successfully!'
            #     else:
            #         family = Family.objects.create(family_id=data['familyid'],muhalla=masjid,report_date=data_date,language=data['language'],ration_card=data['ration_card'],address=data['address'],mobile=data['mobile_no'],house_type=data['house'],toilet=toilet,financial_status=data['financial'],health_insurance=insurance,family_needs=data['family_needs'])
            #         family.family_id = '%s / %s / %s' %(taluk.district.district_code,masjid.mohalla_id,data['familyid'])
            #         family.save()
            #         family_val = {'family_id':family.family_id,'date':convert_to_IST(family.report_date).strftime('%Y-%m-%d'),'muhalla':family.muhalla.name,'language':family.language,'taluk':family.muhalla.taluk.taluk_name,'district_name':family.muhalla.taluk.district.district_name,'ration_card':family.ration_card,'address':family.address,'mobile':family.mobile,'house_type':family.house_type,'donor':family.donor,'volunteer':family.volunteer,'health_insurance':family.health_insurance,'family_needs':family.family_needs,'toilet':family.toilet,'financial_status':family.financial_status}
            #         response = 'Family Data Saved Successfully!'
            #     return HttpResponse(content=json.dumps({'data':response,'family':family_val}),content_type='Application/json')
            # except:
            #     print repr(format_exc())
        elif json.loads(request.body)['status'] == 'delete':
            data = json.loads(request.body)
            family = Family.objects.filter(family_id=data['familyid']).delete()
            return HttpResponse(content=json.dumps({'data':'Family Data Deleted Successfully!'}),content_type='Application/json')
    else:
        print 'mohalla',request.GET['muhalla_id']
        get_mohalla_id = Masjid.objects.get(mohalla_id=request.GET['muhalla_id'])
        family = sorted(map(lambda x:{'family_id':x.family_id,'date':convert_to_IST(x.report_date).strftime('%Y-%m-%d'),'muhalla':x.muhalla.name,'language':x.language,'taluk':x.muhalla.taluk.taluk_name,'district_name':x.muhalla.taluk.district.district_name,'ration_card':x.ration_card,'address':x.address,'mobile':x.mobile,'house_type':x.house_type,'house_cat':x.house_cat,'donor':x.donor,'volunteer':x.volunteer,'health_insurance':x.health_insurance,'family_needs':x.family_needs,'toilet':x.toilet,'financial_status':x.financial_status},Family.objects.filter(muhalla=get_mohalla_id)),key=itemgetter('family_id'))
        return HttpResponse(content=json.dumps({'data':family}),content_type='Application/json')

def fetchReportData(request):
    if request.method == 'POST':
        data = json.loads(request.body)['data']
        sort_val = json.loads(request.body)['sort_val']
        if sort_val == 'familyid':
            sort_key = 'familyid'
        elif 'Family ID' in sort_val:
            sort_key = 'familyid'
        elif 'Name' in sort_val:
            if data['report_type'] == 'Medical Needs and Guidance Needers Details' or data['report_type'] == 'Help for Poor Peoples and Guidance Needers List' or data['report_type'] == 'Government Schemes and Guidance Needers Details' or data['report_type'] == 'Educational Help and Guidance Needers List' or data['report_type'] == 'Help for Discontinued and Guidance Needers List' or data['report_type'] == 'Training/Employment Help and Guidance Needers List' or data['report_type'] == 'Needs Types':
                sort_key = 'name'
            else:
                sort_key = 'family_head'
        elif 'Age' in sort_val:
            sort_key = 'age'
        elif 'Financial Status' in sort_val:
            sort_key = 'financial_status'
        else:
            sort_key = 'familyid'
        print 'data_date',sort_key,sort_val    
        sort_reverse = False if json.loads(request.body)['sort_type'] == True else True
        get_mem_medical = []
        get_mem_scheme = []
        get_mem_service = []
        member_data = Member.objects.all()
        if data['report_type'] == 'New filter' or data['report_type'] == '':
            if data['age_from']:
                member_data = Member.objects.filter(age__gte=data['age_from'])
            if  data['age_to']:
                member_data = member_data.filter(age__lte=data['age_to'])
            if data['gender']:
                member_data = member_data.filter(gender=data['gender'])
            if data['marital_status']:
                member_data = member_data.filter(marital_status=data['marital_status'])
            if data['district']:
                if data['district'] == 'all':
                    member_data = member_data
                else:
                    district_val = District.objects.get(district_name=data['district'])
                    member_data = member_data.filter(district=district_val)
                    if data['taluk']:
                        if data['taluk'] == 'all':
                            member_data = member_data
                        else:
                            taluk_val = Taluk.objects.get(taluk_name=data['taluk'])
                            member_data = member_data.filter(taluk=taluk_val)
                            if data['muhalla_id']:
                                if data['muhalla_id'] == 'all':
                                    member_data = member_data
                                else:
                                    muhalla_val = Masjid.objects.get(mohalla_id=data['muhalla_id'])
                                    member_data = member_data.filter(muhalla=muhalla_val)
                
            for i in member_data:
                for j in Medical.objects.filter(member=i):
                    get_mem_medical.append({'name':j.member.name,'qualification':j.member.qualification,'status':True,'solution':'','address':j.member.family.address,'age':j.member.age,'gender':j.member.gender,'financial':j.member.family.financial_status,'familyid':j.member.family.family_id,'mobile':j.member.family.mobile,'needs':j.disease.disease_name,'needer':'Need Medical Guidance'})
                for k in Member_scheme.objects.filter(member=i):
                    get_mem_scheme.append({'name':k.member.name,'qualification':k.member.qualification,'status':k.status,'solution':k.solution,'address':k.member.family.address,'age':k.member.age,'gender':k.member.gender,'financial':k.member.family.financial_status,'familyid':k.member.family.family_id,'mobile':k.member.family.mobile,'needs':k.scheme.name,'needer':'Need Government Scheme Guidance'})
                for m in Member_service.objects.filter(member=i):
                    get_mem_service.append({'name':m.member.name,'qualification':m.member.qualification,'status':m.status,'solution':m.solution,'address':m.member.family.address,'age':m.member.age,'gender':m.member.gender,'financial':m.member.family.financial_status,'familyid':m.member.family.family_id,'mobile':m.member.family.mobile,'needs':m.scheme.name,'needer':'Need Other/NGO Guidance'})    
            member_details = get_mem_medical + get_mem_scheme + get_mem_service
            get_memData = sorted(map(lambda x:{'familyid':x.family.family_id,'makthab':x.Makthab,'makthab_status':x.madarasa_details,'address':x.family.address,'financial_status':x.family.financial_status,'mobile':x.family.mobile,'family_head':x.name,'mem_id':x.mem_id,'gender':x.gender,'age':x.age,'marital_status':x.marital_status,'voter':x.voter_status},Member.objects.all()),key=itemgetter(sort_key),reverse=sort_reverse)
            return HttpResponse(content=json.dumps({'member_details':member_details,'get_mem_service':get_mem_service,'get_mem_medical':get_mem_medical,'get_mem_scheme':get_mem_scheme,'get_memData':get_memData}),content_type='Application/json')
        elif data['report_type'] == 'Total Family Details' or data['report_type'] == 'Own House & Rent House families' or data['report_type'] == 'Basic Help Needers List' or data['report_type'] == 'Families Eligible for Jakaath' or data['report_type'] == 'Families without toilets' :
            try:
                if data['muhalla_id']:
                    muhalla = Masjid.objects.get(mohalla_id=data['muhalla_id'])
                elif data['taluk']:
                    muhalla = Masjid.objects.filter(taluk=Taluk.objects.filter(taluk_name=data['taluk'])[0])[0]
                elif data['district']:
                    muhalla = Masjid.objects.filter(district=District.objects.get(district_name=data['district']))[0]                        
                else:
                    muhalla = Masjid.objects.all()[0]
            except:
                muhalla = Masjid.objects.all()[0]
            if data['report_type'] == 'Basic Help Needers List':
                family_value = Family.objects.filter(muhalla=muhalla,financial_status='E - Very Poor')
                finacial_value = 'E'
            elif data['report_type'] == 'Own House & Rent House families':
                try:
                    if data['financial']:
                        family_value = Family.objects.filter(muhalla=muhalla,financial_status=data['financial'])
                        finacial_value = data['financial'].split(' ')[0]
                    else:
                        family_value = Family.objects.filter(muhalla=muhalla)                    
                        finacial_value = 'ALL'
                    if data['house']:
                        family_value = family_value.filter(house_type=data['house'])                        
                except:
                    family_value = Family.objects.filter(muhalla=muhalla)
                    finacial_value = 'ALL'            
            else:
                try:
                    if data['financial']:
                        family_value = Family.objects.filter(muhalla=muhalla,financial_status=data['financial'])
                        finacial_value = data['financial'].split(' ')[0]
                    else:
                        family_value = Family.objects.filter(muhalla=muhalla)                    
                        finacial_value = 'ALL'
                except:
                    family_value = Family.objects.filter(muhalla=muhalla)   
                    finacial_value = 'ALL'            
            get_family = sorted(map(lambda x:{'familyid':x.family_id,'house_type':x.house_type,'address':x.address,'mobile':x.mobile,'family_head':Member.objects.filter(family=Family.objects.get(family_id=x.family_id),family_head=True)[0].name if Member.objects.filter(family=Family.objects.get(family_id=x.family_id),family_head=True) else None,'family_head_occ':Member.objects.filter(family=Family.objects.get(family_id=x.family_id),family_head=True)[0].occupation if Member.objects.filter(family=Family.objects.get(family_id=x.family_id),family_head=True) else None,'age':Member.objects.filter(family=Family.objects.get(family_id=x.family_id),family_head=True)[0].age if Member.objects.filter(family=Family.objects.get(family_id=x.family_id),family_head=True) else None,'gender':Member.objects.filter(family=Family.objects.get(family_id=x.family_id),family_head=True)[0].gender if Member.objects.filter(family=Family.objects.get(family_id=x.family_id),family_head=True) else None,'fam_member':Member.objects.filter(family=Family.objects.get(family_id=x.family_id)).count(),'financial_pdf':x.financial_status.split(' ')[0],'jakath_family': 'Yes' if x.financial_status.split(' ')[0] == 'E' or x.financial_status.split(' ')[0] == 'D' else 'No','financial_status':x.financial_status,'muhalla':x.muhalla.name,'ration_card':x.ration_card,'language':x.language},family_value),key=itemgetter(sort_key),reverse=sort_reverse)
            return HttpResponse(content=json.dumps({'report_type':data['report_type'],'get_family':get_family,'finacial_value':finacial_value}),content_type='Application/json')
        elif data['report_type'] == 'Medical Needs and Guidance Needers Details':
            get_mem_medical = []
            disease_list = json.loads(request.body)['diseaseid_list']
            try:
                if data['muhalla_id']:
                    muhalla = Masjid.objects.get(mohalla_id=data['muhalla_id'])
                elif data['taluk']:
                    muhalla = Masjid.objects.filter(taluk=Taluk.objects.filter(taluk_name=data['taluk'])[0])[0]
                elif data['district']:
                    muhalla = Masjid.objects.filter(district=District.objects.get(district_name=data['district']))[0]                        
            except:
                muhalla = Masjid.objects.all()[0]
            family_value = Family.objects.filter(muhalla=muhalla)
            try:
                if data['financial']:
                    family_value = family_value.filter(financial_status=data['financial'])
            except:
                family_value = family_value
            for fam in family_value:
                member_data_med = Member.objects.filter(family=fam)
                if data['age_from']:
                    member_data_med = member_data_med.filter(age__gte=data['age_from'])
                if  data['age_to']:
                    member_data_med = member_data_med.filter(age__lte=data['age_to'])
                if data['gender']:
                    member_data_med = member_data_med.filter(gender=data['gender'])
                if disease_list:
                    for dislist in disease_list:
                        get_disease = Disease.objects.get(disease_id=dislist['disease_id'])
                        for i in member_data_med:
                            for j in Medical.objects.filter(member=i,disease_id=get_disease):
                                get_mem_medical.append({'name':j.member.name,'address':j.member.family.address,'age':j.member.age,'gender':j.member.gender,'financial':j.member.family.financial_status,'financial_pdf':j.member.family.financial_status.split(' ')[0],'familyid':j.member.family.family_id,'mobile':j.member.family.mobile,'needs':j.disease.disease_name,'needer':'Need Medical Guidance'})
                else:
                    for i in member_data_med:
                        for j in Medical.objects.filter(member=i):
                            get_mem_medical.append({'name':j.member.name,'address':j.member.family.address,'age':j.member.age,'gender':j.member.gender,'financial':j.member.family.financial_status,'financial_pdf':j.member.family.financial_status.split(' ')[0],'familyid':j.member.family.family_id,'mobile':j.member.family.mobile,'needs':j.disease.disease_name,'needer':'Need Medical Guidance'})                    
            return HttpResponse(content=json.dumps({'report_type':data['report_type'],'get_mem_medical':sorted(get_mem_medical,key=itemgetter(sort_key),reverse=sort_reverse)}),content_type='Application/json')            
        elif data['report_type'] == 'Government Voter ID Needers':
            get_mem_voter = []
            try:
                if data['muhalla_id']:
                    muhalla = Masjid.objects.get(mohalla_id=data['muhalla_id'])
                elif data['taluk']:
                    muhalla = Masjid.objects.filter(taluk=Taluk.objects.filter(taluk_name=data['taluk'])[0])[0]
                elif data['district']:
                    muhalla = Masjid.objects.filter(district=District.objects.get(district_name=data['district']))[0]                        
            except:
                muhalla = Masjid.objects.all()[0]
            family_value = Family.objects.filter(muhalla=muhalla)
            for fam in family_value:
                get_mem_voter_dt = Member.objects.filter(family=fam,voter_status=False)
                if data['age_from']:
                    get_mem_voter_dt = get_mem_voter_dt.filter(age__gte=data['age_from'])
                if  data['age_to']:
                    get_mem_voter_dt = get_mem_voter_dt.filter(age__lte=data['age_to'])
                if data['gender']:
                    get_mem_voter_dt = get_mem_voter_dt.filter(gender=data['gender'])
                if data['marital_status']:
                    get_mem_voter_dt = get_mem_voter_dt.filter(marital_status=data['marital_status'])
                for i in get_mem_voter_dt:
                    get_mem_voter.append({'family_head':i.name,'qualification':i.qualification,'address':i.family.address,'age':i.age,'gender':i.gender,'financial_status':i.family.financial_status,'financial_pdf':i.family.financial_status.split(' ')[0],'familyid':i.family.family_id,'mobile':i.family.mobile})
            return HttpResponse(content=json.dumps({'report_type':data['report_type'],'get_mem_voter':sorted(get_mem_voter,key=itemgetter(sort_key),reverse=sort_reverse)}),content_type='Application/json')                
        elif data['report_type'] == 'Help for Poor Peoples and Guidance Needers List':
            get_mem_service = []
            service_list = json.loads(request.body)['serviceid_list']
            try:
                if data['muhalla_id']:
                    muhalla = Masjid.objects.get(mohalla_id=data['muhalla_id'])
                elif data['taluk']:
                    muhalla = Masjid.objects.filter(taluk=Taluk.objects.filter(taluk_name=data['taluk'])[0])[0]
                elif data['district']:
                    muhalla = Masjid.objects.filter(district=District.objects.get(district_name=data['district']))[0]                        
            except:
                muhalla = Masjid.objects.all()[0]
            family_value = Family.objects.filter(muhalla=muhalla)
            try:
                if data['financial']:
                    family_value = family_value.filter(financial_status=data['financial'])
                else:
                    family_value = family_value                    
            except:
                family_value = family_value
            for fam in family_value:
                member_data_service = Member.objects.filter(family=fam)
                if data['age_from']:
                    member_data_service = member_data_service.filter(age__gte=data['age_from'])
                if  data['age_to']:
                    member_data_service = member_data_service.filter(age__lte=data['age_to'])
                if data['gender']:
                    member_data_service = member_data_service.filter(gender=data['gender'])
                if data['marital_status']:
                    member_data_service = member_data_service.filter(marital_status=data['marital_status'])    
                if service_list:
                    for schlist in service_list:
                        print 'scheme',schlist
                        get_service = Service.objects.get(service_id=schlist['service_id'])
                        for i in member_data_service:
                            for j in Member_service.objects.filter(member=i,scheme=get_service):
                                get_mem_service.append({'name':j.member.name,'qualification':j.member.qualification,'status':j.status,'solution':j.solution,'address':j.member.family.address,'age':j.member.age,'gender':j.member.gender,'financial':j.member.family.financial_status,'financial_pdf':j.member.family.financial_status.split(' ')[0],'familyid':j.member.family.family_id,'mobile':j.member.family.mobile,'needs':j.scheme.name,'needer':'via UNWO'})
                else:
                    for i in member_data_service:
                            for j in Member_service.objects.filter(member=i):
                                get_mem_service.append({'name':j.member.name,'qualification':j.member.qualification,'status':j.status,'solution':j.solution,'address':j.member.family.address,'age':j.member.age,'gender':j.member.gender,'financial':j.member.family.financial_status,'financial_pdf':j.member.family.financial_status.split(' ')[0],'familyid':j.member.family.family_id,'mobile':j.member.family.mobile,'needs':j.scheme.name,'needer':'via UNWO'})
            return HttpResponse(content=json.dumps({'report_type':data['report_type'],'get_mem_service':sorted(get_mem_service,key=itemgetter(sort_key),reverse=sort_reverse)}),content_type='Application/json')                
        elif data['report_type'] == 'Government Schemes and Guidance Needers Details' or data['report_type'] == 'Educational Help and Guidance Needers List' or data['report_type'] == 'Help for Discontinued and Guidance Needers List' or data['report_type'] == 'Training/Employment Help and Guidance Needers List':
            get_mem_scheme = []
            scheme_list = json.loads(request.body)['schemeid_list']
            try:
                if data['muhalla_id']:
                    muhalla = Masjid.objects.get(mohalla_id=data['muhalla_id'])
                elif data['taluk']:
                    muhalla = Masjid.objects.filter(taluk=Taluk.objects.filter(taluk_name=data['taluk'])[0])[0]
                elif data['district']:
                    muhalla = Masjid.objects.filter(district=District.objects.get(district_name=data['district']))[0]                        
            except:
                muhalla = Masjid.objects.all()[0]
            family_value = Family.objects.filter(muhalla=muhalla)
            try:
                if data['financial']:
                    family_value = family_value.filter(financial_status=data['financial'])
                else:
                    family_value = family_value    
            except:
                family_value = family_value
            for fam in family_value:
                member_data_scheme = Member.objects.filter(family=fam)
                if data['age_from']:
                    member_data_scheme = member_data_scheme.filter(age__gte=data['age_from'])
                if  data['age_to']:
                    member_data_scheme = member_data_scheme.filter(age__lte=data['age_to'])
                if data['gender']:
                    member_data_scheme = member_data_scheme.filter(gender=data['gender'])
                if data['marital_status']:
                    member_data_scheme = member_data_scheme.filter(marital_status=data['marital_status'])    
                if scheme_list:
                    for schlist in scheme_list:
                        print 'scheme',schlist
                        get_scheme = SubScheme.objects.get(subscheme_id=schlist['scheme_id'])
                        for i in member_data_scheme:
                            for j in Member_scheme.objects.filter(member=i,scheme=get_scheme):
                                get_mem_scheme.append({'name':j.member.name,'qualification':j.member.qualification,'status':j.status,'solution':j.solution,'address':j.member.family.address,'age':j.member.age,'gender':j.member.gender,'financial':j.member.family.financial_status,'financial_pdf':j.member.family.financial_status.split(' ')[0],'familyid':j.member.family.family_id,'mobile':j.member.family.mobile,'needs':j.scheme.name,'needer':'Need Government Scheme Guidance'})
                else:
                    for i in member_data_scheme:
                        for j in Member_scheme.objects.filter(member=i):
                            get_mem_scheme.append({'name':j.member.name,'qualification':j.member.qualification,'status':j.status,'solution':j.solution,'address':j.member.family.address,'age':j.member.age,'gender':j.member.gender,'financial':j.member.family.financial_status,'financial_pdf':j.member.family.financial_status.split(' ')[0],'familyid':j.member.family.family_id,'mobile':j.member.family.mobile,'needs':j.scheme.name,'needer':'Need Government Scheme Guidance'})
            return HttpResponse(content=json.dumps({'report_type':data['report_type'],'get_mem_scheme':sorted(get_mem_scheme,key=itemgetter(sort_key),reverse=sort_reverse)}),content_type='Application/json')                
        elif data['report_type'] == 'Women chldrens Need to join Niswan Madarasa' or data['report_type']  == 'Persons Need to join Jumrah Madarasa' or data['report_type']  == 'Childrens Need to join Makthab Madarasa':
            try:
                if data['muhalla_id']:
                    muhalla = Masjid.objects.get(mohalla_id=data['muhalla_id'])
                elif data['taluk']:
                    muhalla = Masjid.objects.filter(taluk=Taluk.objects.filter(taluk_name=data['taluk'])[0])[0]
                elif data['district']:
                    muhalla = Masjid.objects.filter(district=District.objects.get(district_name=data['district']))[0]                        
            except:
                muhalla = Masjid.objects.all()[0]
            if data['report_type'] == 'Women chldrens Need to join Niswan Madarasa':
                get_memData = sorted(map(lambda x:{'familyid':x.family.family_id,'makthab':x.Makthab,'makthab_status':x.madarasa_details,'address':x.family.address,'financial_status':x.family.financial_status,'financial_pdf':x.family.financial_status.split(' ')[0],'mobile':x.family.mobile,'family_head':x.name,'mem_id':x.mem_id,'gender':x.gender,'age':x.age,'marital_status':x.marital_status,'voter':x.voter_status},Member.objects.filter(muhalla=muhalla,Makthab=True,madarasa_details='Girls For Makthab 4-15')),key=itemgetter(sort_key),reverse=sort_reverse)
            elif data['report_type'] == 'Childrens Need to join Makthab Madarasa':
                get_memData = sorted(map(lambda x:{'familyid':x.family.family_id,'makthab':x.Makthab,'makthab_status':x.madarasa_details,'address':x.family.address,'financial_status':x.family.financial_status,'financial_pdf':x.family.financial_status.split(' ')[0],'mobile':x.family.mobile,'family_head':x.name,'mem_id':x.mem_id,'gender':x.gender,'age':x.age,'marital_status':x.marital_status,'voter':x.voter_status},Member.objects.filter(muhalla=muhalla,Makthab=True,madarasa_details='Boys For Makthab 4-15')),key=itemgetter(sort_key),reverse=sort_reverse)
            elif data['report_type'] == 'Persons Need to join Jumrah Madarasa':
                get_memData = sorted(map(lambda x:{'familyid':x.family.family_id,'makthab':x.Makthab,'makthab_status':x.madarasa_details,'address':x.family.address,'financial_status':x.family.financial_status,'financial_pdf':x.family.financial_status.split(' ')[0],'mobile':x.family.mobile,'family_head':x.name,'mem_id':x.mem_id,'gender':x.gender,'age':x.age,'marital_status':x.marital_status,'voter':x.voter_status},Member.objects.filter(muhalla=muhalla,Makthab=True,madarasa_details='Jumrah Madarasa for Boys')),key=itemgetter(sort_key),reverse=sort_reverse)
            return HttpResponse(content=json.dumps({'report_type':data['report_type'],'get_memData':get_memData}),content_type='Application/json')
        elif data['report_type'] == 'Mohalla Report':
            print 'mohalla report_type'
            try:
                if data['muhalla_id']:
                    muhalla = Masjid.objects.get(mohalla_id=data['muhalla_id'])
                elif data['taluk']:
                    muhalla = Masjid.objects.filter(taluk=Taluk.objects.filter(taluk_name=data['taluk'])[0])[0]
                elif data['district']:
                    muhalla = Masjid.objects.filter(district=District.objects.get(district_name=data['district']))[0]                    
            except:
                muhalla = Masjid.objects.all()[0]            
            get_family = map(lambda x:{'familyid':x.family_id,'r_card':x.ration_card,'address':x.address,'mobile':x.mobile,'family_head':Member.objects.filter(family=Family.objects.get(family_id=x.family_id),family_head=True)[0].name if Member.objects.filter(family=Family.objects.get(family_id=x.family_id),family_head=True) else None,'family_head_occ':Member.objects.filter(family=Family.objects.get(family_id=x.family_id),family_head=True)[0].occupation if Member.objects.filter(family=Family.objects.get(family_id=x.family_id),family_head=True) else None,'age':Member.objects.filter(family=Family.objects.get(family_id=x.family_id),family_head=True)[0].age if Member.objects.filter(family=Family.objects.get(family_id=x.family_id),family_head=True) else None,'gender':Member.objects.filter(family=Family.objects.get(family_id=x.family_id),family_head=True)[0].gender if Member.objects.filter(family=Family.objects.get(family_id=x.family_id),family_head=True) else None,'fam_member':Member.objects.filter(family=Family.objects.get(family_id=x.family_id)).count(),'financial_status':x.financial_status,'muhalla':x.muhalla.name,'ration_card':x.ration_card,'language':x.language},Family.objects.filter(muhalla=muhalla))
            get_memData = map(lambda x:{'familyid':x.family.family_id,'makthab':x.Makthab,'makthab_status':x.madarasa_details,'address':x.family.address,'financial_status':x.family.financial_status,'mobile':x.family.mobile,'family_head':x.name,'mem_id':x.mem_id,'gender':x.gender,'age':x.age,'marital_status':x.marital_status,'voter':x.voter_status},Member.objects.filter(muhalla=muhalla))
            married = sum(1 if(x['marital_status']=='Married' or x['marital_status']=='Widow' or x['marital_status']=='Devorced') else 0 for x in get_memData)
            tot_men = sum(1 if(x['gender']=='MALE') else 0 for x in get_memData)
            tot_women = sum(1 if(x['gender']=='FEMALE') else 0 for x in get_memData)
            voter = sum(1 if(x['voter']==True) else 0 for x in get_memData)
            marriage_help = 0
            for i in Member.objects.filter(muhalla=muhalla):
                val = len(Member_scheme.objects.filter(member=i,scheme=SubScheme.objects.get(name='Marriage Help'),status=True,solution='Not Yet'))
                # marriage_help = sum(1 if x else 0 for x in Member_scheme.objects.filter(member=i,scheme=SubScheme.objects.get(name='Marriage Help'),status=True,solution='Not Yet'))
                marriage_help+=val    
            interest_loan = 0
            for i in Member.objects.filter(muhalla=muhalla):
                val = len(Member_service.objects.filter(member=i,scheme=Service.objects.get(name='Suffering Due To Interest Base Loan'),status=True,solution='Not Yet'))
                interest_loan+=val
            deserted_women_pension = 0    
            for i in Member.objects.filter(muhalla=muhalla):
                val = len(Member_scheme.objects.filter(member=i,scheme=SubScheme.objects.get(name='Deserted Women Pension'),status=True,solution='Not Yet'))
                deserted_women_pension+=val
            orphan = 0
            for i in Member.objects.filter(muhalla=muhalla):
                val = len(Member_scheme.objects.filter(member=i,scheme=SubScheme.objects.get(name='Destitute / Orphan Welfare'),status=True,solution='Not Yet'))
                orphan+=val   
            daily_prayer = len(Member.objects.filter(muhalla=muhalla,namaz='5 Times a day'))
            quran_reading = len(Member.objects.filter(muhalla=muhalla,quran_reading=True))
            only_jumah = len(Member.objects.filter(muhalla=muhalla,namaz='only Jumah',gender='MALE'))
            no_ration_card = sum(1 if(x['r_card']=='' or x['r_card']=='No' or x['r_card']=='-' or x['r_card']=='NA') else 0 for x in get_family)     
            non_voter = sum(1 if(x['voter']==False) else 0 for x in get_memData)
            men_age_60 = sum(1 if(x['gender']=='MALE' and eval(str(str(x['age'])))>=60) else 0 for x in get_memData)
            women_age_60 = sum(1 if(x['gender']=='FEMALE' and eval(str(x['age']))>=60) else 0 for x in get_memData)
            men_age_22to59 = sum(1 if(x['gender']=='MALE' and 22<=eval(str(x['age']))<=59) else 0 for x in get_memData)
            women_age_22to59 = sum(1 if(x['gender']=='FEMALE' and 22<=eval(str(x['age']))<=59) else 0 for x in get_memData)
            men_age_11to21 = sum(1 if(x['gender']=='MALE' and 11<=eval(str(x['age']))<=21) else 0 for x in get_memData)
            women_age_11to21 = sum(1 if(x['gender']=='FEMALE' and 11<=eval(str(x['age']))<=21) else 0 for x in get_memData)
            child_upto11 = sum(1 if(eval(str(x['age']))<=10) else 0 for x in get_memData)
            cat_A = sum(1 if(x['financial_status']=='A - Well Settled') else 0 for x in get_family)
            cat_B = sum(1 if(x['financial_status']=='B - Full Filled') else 0 for x in get_family)
            cat_C = sum(1 if(x['financial_status']=='C - Middle Class') else 0 for x in get_family)
            cat_D = sum(1 if(x['financial_status']=='D - Poor') else 0 for x in get_family)
            cat_E = sum(1 if(x['financial_status']=='E - Very Poor') else 0 for x in get_family)
            lang_tamil = sum(1 if(x['language']=='Tamil') else 0 for x in get_family)
            lang_urdu = sum(1 if(x['language']=='Urdu') else 0 for x in get_family)
            lang_others = sum(1 if(x['language']=='Others') else 0 for x in get_family)
            widowed = sum(1 if(x['marital_status']=='Widow' and x['gender']=='FEMALE') else 0 for x in get_memData)
            divorced = sum(1 if(x['marital_status']=='Devorced' and x['gender']=='FEMALE') else 0 for x in get_memData)
            rep_data = {'Taluk':muhalla.taluk.taluk_name,'Daily Prayer Observers':daily_prayer,'Observe Only Jumma Prayer (Male)':only_jumah,'Able to recite Quran':quran_reading,'Deserted Destitute Widows':deserted_women_pension,'Orphans':orphan,'Families without Ration Card':no_ration_card,'Taluk Count':1,'Total Family':len(get_family),'Families having Interest Loan':interest_loan,'Nikkah Assistance Required':marriage_help,'Total Population':len(get_memData),'Total Male':tot_men,'Total Female':tot_women,'Married':married,'Male age 60+':men_age_60,'Female age 60+':women_age_60,'Male age between 22-59':men_age_22to59,'Female age between 22-59':women_age_22to59,'Male age between 11-21':men_age_11to21,'Female age between 11-21':women_age_11to21,'Child upto 11 age ':child_upto11,'A - Well Settled':cat_A,'B - Full Filled':cat_B,'C - Middle Class':cat_C,'D - Poor':cat_D,'E - Very Poor':cat_E,'Widow':widowed,'Divorced':divorced,'Mother Tongue':{'Tamil':lang_tamil,'Urdu':lang_urdu,'Others':lang_others}}
            pdf_rep_data = {'Taluk':muhalla.taluk.taluk_name,'Daily_Prayer_Observers':daily_prayer,'Observe_Only_Jumma_Prayer':only_jumah,'Able_to_recite_Quran':quran_reading,'deserted_women_pension':deserted_women_pension,'Orphan':orphan,'no_ration_card':no_ration_card,'Taluk_Count':1,'Total_Family':len(get_family),'Families_having_Interest_Loan':interest_loan,'Nikkah_Assistance_Required':marriage_help,'non_voter':non_voter,'voter':voter,'Total_Population':len(get_memData),'Total_Male':tot_men,'Total_Female':tot_women,'Married':married,'Male_age_60':men_age_60,'Female_age_60':women_age_60,'Male_age_between_22to59':men_age_22to59,'Female_age_between_22to59':women_age_22to59,'Male_age_between_11to21':men_age_11to21,'Female_age_between_11to21':women_age_11to21,'Child_upto_11_age':child_upto11,'A_Well_Settled':cat_A,'B_Full_Filled':cat_B,'C_Middle_Class':cat_C,'D_Poor':cat_D,'E_Very_Poor':cat_E,'Widow':widowed,'Divorced':divorced,'Mother_Tongue':{'Tamil':lang_tamil,'Urdu':lang_urdu,'Others':lang_others}}
            return HttpResponse(content=json.dumps({'report_type':data['report_type'],'non_voter':non_voter,'voter':voter,'reports':rep_data,'pdf_report':pdf_rep_data}),content_type='Application/json')
        elif data['report_type'] == 'Needs Types':
            scheme_data = sorted(map(lambda x:{'name':x.name,'need_id':x.subscheme_id,'beneficiaries':len(Member_scheme.objects.filter(scheme=x,status=True,solution='Solved')),'total':len(Member_scheme.objects.filter(scheme=x,status=True))},SubScheme.objects.all()),key=itemgetter(sort_key),reverse=sort_reverse)
            service_data = sorted(map(lambda x:{'name':x.name,'need_id':x.service_id,'beneficiaries':len(Member_service.objects.filter(scheme=x,status=True,solution='Solved')),'total':len(Member_service.objects.filter(scheme=x,status=True))},Service.objects.all()),key=itemgetter(sort_key),reverse=sort_reverse)
            dis_data = sorted(map(lambda x:{'name':x.disease_name,'total':len(Medical.objects.filter(disease=x)),'beneficiaries':0,'need_id':x.disease_id},Disease.objects.all()),key=itemgetter(sort_key),reverse=sort_reverse)
            rep_data = scheme_data + service_data + dis_data
            return HttpResponse(content=json.dumps({'report_type':data['report_type'],'reports':rep_data}),content_type='Application/json')
        # return HttpResponse(content=json.dumps({'data':data,'member_details':member_details,'get_mem_service':get_mem_service,'get_mem_medical':get_mem_medical,'get_mem_scheme':get_mem_scheme,'get_memData':get_memData}),content_type='Application/json')
    
    elif request.method == 'GET':
        muhalla = Masjid.objects.get(mohalla_id=request.GET['muhalla_id'])
        get_family = map(lambda x:{'familyid':x.family_id,'address':x.address,'mobile':x.mobile,'family_head':Member.objects.filter(family=Family.objects.get(family_id=x.family_id),family_head=True)[0].name if Member.objects.filter(family=Family.objects.get(family_id=x.family_id),family_head=True) else None,'family_head_occ':Member.objects.filter(family=Family.objects.get(family_id=x.family_id),family_head=True)[0].occupation if Member.objects.filter(family=Family.objects.get(family_id=x.family_id),family_head=True) else None,'age':Member.objects.filter(family=Family.objects.get(family_id=x.family_id),family_head=True)[0].age if Member.objects.filter(family=Family.objects.get(family_id=x.family_id),family_head=True) else None,'gender':Member.objects.filter(family=Family.objects.get(family_id=x.family_id),family_head=True)[0].gender if Member.objects.filter(family=Family.objects.get(family_id=x.family_id),family_head=True) else None,'fam_member':Member.objects.filter(family=Family.objects.get(family_id=x.family_id)).count(),'financial_status':x.financial_status,'muhalla':x.muhalla.name,'ration_card':x.ration_card,'language':x.language},Family.objects.filter(muhalla=muhalla))
        get_mem_medical = []
        get_mem_scheme = []
        get_mem_service = []
        for i in Member.objects.filter(muhalla=Masjid.objects.get(mohalla_id=request.GET['muhalla_id'])):
            for j in Medical.objects.filter(member=i):
                get_mem_medical.append({'name':j.member.name,'address':j.member.family.address,'age':j.member.age,'gender':j.member.gender,'financial':j.member.family.financial_status,'familyid':j.member.family.family_id,'mobile':j.member.family.mobile,'needs':j.disease.disease_name,'needer':'Need Medical Guidance'})
            for k in Member_scheme.objects.filter(member=i):
                get_mem_scheme.append({'name':k.member.name,'qualification':k.member.qualification,'status':k.status,'solution':k.solution,'address':k.member.family.address,'age':k.member.age,'gender':k.member.gender,'financial':k.member.family.financial_status,'familyid':k.member.family.family_id,'mobile':k.member.family.mobile,'needs':k.scheme.name,'needer':'Need Government Scheme Guidance'})
            for m in Member_service.objects.filter(member=i):
                get_mem_service.append({'name':m.member.name,'qualification':m.member.qualification,'status':m.status,'solution':m.solution,'address':m.member.family.address,'age':m.member.age,'gender':m.member.gender,'financial':m.member.family.financial_status,'familyid':m.member.family.family_id,'mobile':m.member.family.mobile,'needs':m.scheme.name,'needer':'Need Other/NGO Guidance'})    
        get_memData = map(lambda x:{'familyid':x.family.family_id,'makthab':x.Makthab,'makthab_status':x.madarasa_details,'address':x.family.address,'financial_status':x.family.financial_status,'mobile':x.family.mobile,'family_head':x.name,'mem_id':x.mem_id,'gender':x.gender,'age':x.age,'marital_status':x.marital_status,'voter':x.voter_status},Member.objects.filter(muhalla=Masjid.objects.get(mohalla_id=request.GET['muhalla_id'])))
        married = sum(1 if(x['marital_status']=='Married' or x['marital_status']=='Widow' or x['marital_status']=='Devorced') else 0 for x in get_memData)
        tot_men = sum(1 if(x['gender']=='MALE') else 0 for x in get_memData)
        tot_women = sum(1 if(x['gender']=='FEMALE') else 0 for x in get_memData)
        voter = sum(1 if(x['voter']==True) else 0 for x in get_memData)
        men_age_60 = sum(1 if(x['gender']=='MALE' and eval(str(str(x['age'])))>=60) else 0 for x in get_memData)
        women_age_60 = sum(1 if(x['gender']=='FEMALE' and eval(str(x['age']))>=60) else 0 for x in get_memData)
        men_age_22to59 = sum(1 if(x['gender']=='MALE' and 22<=eval(str(x['age']))<=59) else 0 for x in get_memData)
        women_age_22to59 = sum(1 if(x['gender']=='FEMALE' and 22<=eval(str(x['age']))<=59) else 0 for x in get_memData)
        men_age_11to21 = sum(1 if(x['gender']=='MALE' and 11<=eval(str(x['age']))<=21) else 0 for x in get_memData)
        women_age_11to21 = sum(1 if(x['gender']=='FEMALE' and 11<=eval(str(x['age']))<=21) else 0 for x in get_memData)
        child_upto11 = sum(1 if(eval(str(x['age']))<=10) else 0 for x in get_memData)
        cat_A = sum(1 if(x['financial_status']=='A - Well Settled') else 0 for x in get_family)
        cat_B = sum(1 if(x['financial_status']=='B - Full Filled') else 0 for x in get_family)
        cat_C = sum(1 if(x['financial_status']=='C - Middle Class') else 0 for x in get_family)
        cat_D = sum(1 if(x['financial_status']=='D - Poor') else 0 for x in get_family)
        cat_E = sum(1 if(x['financial_status']=='E - Very Poor') else 0 for x in get_family)
        lang_tamil = sum(1 if(x['language']=='Tamil') else 0 for x in get_family)
        lang_urdu = sum(1 if(x['language']=='Urdu') else 0 for x in get_family)
        lang_others = sum(1 if(x['language']=='Others') else 0 for x in get_family)
        widowed = sum(1 if(x['marital_status']=='Widow' and x['gender']=='FEMALE') else 0 for x in get_memData)
        divorced = sum(1 if(x['marital_status']=='Devorced' and x['gender']=='FEMALE') else 0 for x in get_memData)
        rep_data = {'Taluk':muhalla.taluk.taluk_name,'Taluk Count':1,'Total Family ':len(get_family),'Total Population':len(get_memData),'Total Male':tot_men,'Total Female':tot_women,'Married':married,'Male age 60+':men_age_60,'Female age 60+':women_age_60,'Male age between 22-59':men_age_22to59,'Female age between 22-59':women_age_22to59,'Male age between 11-21':men_age_11to21,'Female age between 11-21':women_age_11to21,'Child upto 11 age ':child_upto11,'A - Well Settled':cat_A,'B - Full Filled':cat_B,'C - Middle Class':cat_C,'D - Poor':cat_D,'E - Very Poor':cat_E,'Widow':widowed,'Divorced':divorced,'Mother Tongue':{'Tamil':lang_tamil,'Urdu':lang_urdu,'Others':lang_others}}
        return HttpResponse(content=json.dumps({'get_family':get_family,'get_memdata':get_memData,'reports':rep_data,'get_mem_scheme':get_mem_scheme,'get_mem_medical':get_mem_medical,'get_mem_service':get_mem_service}),content_type='Application/json')

def ServiceData(request):
    if request.method == 'POST':
        data = json.loads(request.body)['data']
        if Service.objects.filter(service_id=data['service_id']):
            if Service.objects.filter(name=data['service']):
                return HttpResponse(content=json.dumps({'data':'Service Name Exist!'}),content_type='Application/json')
            else:
                service = Service.objects.filter(service_id=data['service_id']).update(name=data['service'])
                return HttpResponse(content=json.dumps({'data':'Service Name Updated!'}),content_type='Application/json')
        elif Service.objects.filter(name=data['service']):
            service = Service.objects.filter(name=data['service']).update(description=data['description'])
            return HttpResponse(content=json.dumps({'data':'Description Updated!'}),content_type='Application/json')
        else:
            service = Service.objects.create(name=data['service'],service_id=data['service_id'],description=data['description'])
            return HttpResponse(content=json.dumps({'data':'Service Created Successfully!'}),content_type='Application/json')
    else:
        try:
            data = request.GET['del_ser']
            service = Service.objects.filter(name=data).delete()
            return HttpResponse(content=json.dumps({'data':'Deleted Successfully!'}),content_type='Application/json')
        except:
            service = map(lambda x:{'service':x.name,'description':x.description,'service_id':x.service_id},Service.objects.all())
            return HttpResponse(content=json.dumps({'data':service}),content_type='Application/json')

def getServiceData(request):
    data = defaultdict(list)
    for i in Service.objects.all():
        if Member_service.objects.filter(member=Member.objects.get(mem_id=request.GET['mem_id']),scheme=Service.objects.get(name=i.name)):
            checked_val = Member_service.objects.get(member=Member.objects.get(mem_id=request.GET['mem_id']),scheme=Service.objects.get(name=i.name))
            checked = checked_val.status
            solution = checked_val.solution
        else:
            checked = False
            solution = ''
        status = 'Yes' if checked == True else 'No'
        data[i.name].append({'sub':i.name,'service_id':i.service_id,'status':status,'solution':solution})
    return HttpResponse(content=json.dumps({'data':data}), content_type='Application/json')

def FamilyMemberData(request):
    if request.method == 'POST':
        data = json.loads(request.body)['data']
        familyid = json.loads(request.body)['familyid']
        family = Family.objects.get(family_id=familyid)
        voter = True if data['voter'] == 'Yes' else False
        dob_date = datetime.strptime(json.loads(request.body)['dob_date'], "%a, %d %b %Y %H:%M:%S %Z")
        mem_age = json.loads(request.body)['age']
        try:
            if str(mem_age).split('.')[1][0] >= 5:
                age = eval(str(int(mem_age) + 1))
            elif mem_age == '':
                age = 0
            elif type(mem_age) == 'str':
                age = int(mem_age)    
        except:
            if mem_age == '':
                age = 0
            else:
                age = eval(str(mem_age))
                
        if data['name'] == '':
            return HttpResponse(content=json.dumps({'data':'Please Enter Member Name!'}),content_type='Application/json')
        else:                
            if Member.objects.filter(mem_id=data['mem_id']):
                memval = Member.objects.filter(mem_id=data['mem_id']).update(family=family,dateofbirth=dob_date,muhalla=family.muhalla,taluk=family.muhalla.taluk,district=family.muhalla.taluk.district,name=data['name'],gender=data['gender'],age=age,Relation=data['relationship'],qualification=data['qualification'],marital_status=data['marital_status'],voter_status=voter,curr_location=data['location'],occupation=data['occupation'])
                member = memval[0]
            else:
                member = Member.objects.create(mem_id=data['mem_id'],family=family,dateofbirth=dob_date,muhalla=family.muhalla,taluk=family.muhalla.taluk,district=family.muhalla.taluk.district,name=data['name'],gender=data['gender'],age=age,Relation=data['relationship'],qualification=data['qualification'],marital_status=data['marital_status'],voter_status=voter,curr_location=data['location'],occupation=data['occupation'])
                try:
                    fam_member_id = len(Member_scheme.objects.filter(family=family)) + 1
                    fam_mem_id = '%s / %s' %(familyid,str(fam_member_id))
                except:
                    fam_member_id = member.id
                    fam_mem_id = '%s / %s' %(familyid,str(fam_member_id))
                if fam_member_id == 1:
                    member.family_head = True
                else:
                    member.family_head = False                   
                member.mem_id = fam_mem_id
                member.save()  
        if Member.objects.filter(family=family):
            if data['family_head'] == 'Yes':
                fam_head1 = Member.objects.filter(family=family,mem_id=member.mem_id).update(family_head=True) 
                fam_head2 = Member.objects.filter(Q(family=family),~Q(mem_id=member.mem_id)).update(family_head=False) 
            else:
                fam_head1 = Member.objects.filter(family=family,mem_id=member.mem_id).update(family_head=False)
                if Member.objects.filter(family=family,family_head=True):
                    pass
                else:
                    fam_head = Member.objects.filter(family=family,mem_id=member.mem_id).update(family_head=True)                     
        return HttpResponse(content=json.dumps({'data':'success'}),content_type='Application/json')
    else:
        family = Family.objects.get(family_id=request.GET['family_id'])
        if not Member.objects.filter(family=family,family_head=True):
            memval = Member.objects.filter(family=family)
            if memval:
                fam_head = Member.objects.filter(family=family,mem_id=memval[0].mem_id).update(family_head=True)
            else:
                pass                
        member = map(lambda x:{'mem_id':x.mem_id,'dateofbirth':convert_to_IST(x.dateofbirth).strftime('%Y-%m-%d'),'family':x.family.family_id,'name':x.name,'gender':x.gender,'age':x.age,'relationship':x.Relation,'qualification':x.qualification,'marital_status':x.marital_status,'voter_status':x.voter_status,'family_head':x.family_head,'curr_location':x.curr_location,'occupation':x.occupation},Member.objects.filter(family=Family.objects.get(family_id=request.GET['family_id'])))
        return HttpResponse(content=json.dumps(member),content_type='Application/json')

def UpdateFamilyMember(request):
    if request.method == 'POST':
        data = json.loads(request.body)['data']
        dob_date = datetime.strptime(json.loads(request.body)['dob_date'], "%a, %d %b %Y %H:%M:%S %Z")
        mem_age = json.loads(request.body)['age']
        try:
            if int(str(mem_age).split('.')[1][0]) >= 5:
                print 'vall',str(mem_age).split('.')[1][0]
                age = str(int(mem_age) + 1)
            else:
                age = str(int(mem_age))
        except:
            age = str(mem_age)
        voter = True if data['voter_status'] == 'Yes' else False
        familyHead = True if data['family_head'] == 'Yes' else False
        if Member.objects.filter(mem_id=data['mem_id']):
            if json.loads(request.body)['status'] == 'update':
                memval = Member.objects.filter(mem_id=data['mem_id']).update(name=data['name'],dateofbirth=dob_date,gender=data['gender'],age=age,Relation=data['relationship'],qualification=data['qualification'],marital_status=data['marital_status'],family_head=familyHead,voter_status=voter,curr_location=data['curr_location'],occupation=data['occupation'])
                response = 'Member Details Updated Successfully!'
            elif json.loads(request.body)['status'] == 'delete':
                memval = Member.objects.filter(mem_id=data['mem_id']).delete()
                response = 'Member Deleted Successfully!'                
        else:
            response = 'Something Went Wrong!'
    return HttpResponse(content=json.dumps({'data':response}),content_type='Application/json')            
      
def UpdateFamily_member(request):
    if request.method == 'POST':
        data = json.loads(request.body)['data']
        mem_id = json.loads(request.body)['mem_id']
        donor = True if data['donor'] == 'Yes' else False
        volunteer = True if data['volunteer'] == 'Yes' else False
        makthab = True if data['makthab'] == 'Yes' else False
        physical = True if data['physical'] == 'Yes' else False
        quran_reading = True if data['quran_reading'] == 'Yes' else False
        alive = True if data['alive'] == 'Yes' else False 
        if Member.objects.filter(mem_id=mem_id):
            member = Member.objects.filter(mem_id=mem_id).update(mother_tongue=data['language'],Makthab=makthab,madarasa_details=data['makthab_detail'],disability=physical,donor=donor,volunteer=volunteer,mobile=data['mobile'],alive=alive,quran_reading=quran_reading,namaz=data['namaz'])
            return HttpResponse(content=json.dumps('success'),content_type='Application/json')
        else:
            return HttpResponse(content=json.dumps('notfound'),content_type='Application/json')
    else:
        mem_id = request.GET['mem_id']
        if Member.objects.filter(mem_id=mem_id):
            member = Member.objects.get(mem_id=mem_id)
            donor = 'Yes' if member.donor == True else 'No'
            makthab = 'Yes' if member.Makthab == True else 'No'
            disability = 'Yes' if member.disability == True else 'No'
            quran_reading = 'Yes' if member.quran_reading == True else 'No'
            volunteer = 'Yes' if member.volunteer == True else 'No'
            alive = 'Yes' if member.alive == True else 'No' 
            return HttpResponse(content=json.dumps({'alive':alive,'quran_reading':quran_reading,'namaz':member.namaz,'makthab':makthab,'makthab_detail':member.madarasa_details,'language':member.mother_tongue,'disability':disability,'volunteer':volunteer,'mobile':member.mobile,'donor':donor,'age':member.age,'gender':member.gender}),content_type='Application/json')

def updateMemScheme(request):
    if request.method == 'POST':
        schemeData = json.loads(request.body)['schemeData']
        Servicedata = json.loads(request.body)['Servicedata']
        disease_val = json.loads(request.body)['disease_val']
        disease_id_list = json.loads(request.body)['disease_id_list']
        surgery_val = json.loads(request.body)['surgery_val']
        chronic_val = json.loads(request.body)['chronic_val']
        member_id = json.loads(request.body)['mem_id']
        member_obj = Member.objects.get(mem_id=member_id)
        for key in schemeData.keys():
            for i in schemeData[key]:
                scheme = SubScheme.objects.get(subscheme_id=i['scheme_id'])
                status = True if i['status'] == 'Yes' else False
                solution = i['solution'] if status else 'Not Yet'
                if Member_scheme.objects.filter(member=member_obj,scheme=scheme,status=status):
                    update_mem = Member_scheme.objects.filter(member=member_obj,scheme=scheme,status=status).update(solution=solution)
                elif Member_scheme.objects.filter(member=member_obj,scheme=scheme):
                    member = Member_scheme.objects.filter(member=member_obj,scheme=scheme).update(status=status,solution=solution)           
                else:
                    member = Member_scheme.objects.create(member=member_obj,scheme=scheme,status=status,solution=solution)
        for k in Servicedata.keys():
            service = Service.objects.get(service_id=Servicedata[k][0]['service_id'])
            status = True if Servicedata[k][0]['status'] == 'Yes' else False
            solution = Servicedata[k][0]['solution'] if status else 'Not Yet'
            # mem_data_update = Member_service.objects.filter(member=member_obj,scheme=service,status=status).update(solution=solution) if Member_service.objects.filter(member=member_obj,scheme=service,status=status) Member_service.objects.filter(member=member_obj,scheme=service).update(status=status,solution=solution) elif Member_service.objects.filter(member=member_obj,scheme=service) else Member_service.objects.create(member=member_obj,scheme=service,status=status,solution=solution)
            if Member_service.objects.filter(member=member_obj,scheme=service,status=status):
                Member_service.objects.filter(member=member_obj,scheme=service,status=status).update(solution=solution)
            elif Member_service.objects.filter(member=member_obj,scheme=service):
                member = Member_service.objects.filter(member=member_obj,scheme=service).update(status=status,solution=solution)
            else:
                member = Member_service.objects.create(member=member_obj,scheme=service,status=status,solution=solution)           
        if len(disease_id_list) > 0:
            for dis in disease_id_list:
                disease = Disease.objects.get(disease_id=dis['disease_id']) if Disease.objects.filter(disease_id=dis['disease_id']) else Disease.objects.create(sym_type='DISEASE',disease_name=dis['name'])
                medical_needs = Medical.objects.filter(member=member_obj,disease=disease).update(cost=disease_val['cost']) if Medical.objects.filter(member=member_obj,disease=disease) else Medical.objects.create(member=member_obj,disease=disease,cost=disease_val['cost'])
        if surgery_val['surgery_val'] == 'Yes':
            disease = Disease.objects.get(disease_name=surgery_val['name']) if Disease.objects.filter(disease_name=surgery_val['name']) else Disease.objects.create(sym_type=surgery_val['sym_type'],disease_name=surgery_val['name'])
            surgery_help = Surgery.objects.filter(member=member_obj).update(hospital_name=surgery_val['hospital_name'],cost=surgery_val['operation_cost'],cash_inHand=surgery_val['cash_hand'],details=surgery_val['details']) if Surgery.objects.filter(member=member_obj,disease=disease) else Surgery.objects.create(member=member_obj,disease=disease,hospital_name=surgery_val['hospital_name'],cost=surgery_val['operation_cost'],cash_inHand=surgery_val['cash_hand'],details=surgery_val['details'])
        if chronic_val['chronic_val'] == 'Yes':
            disease = Disease.objects.get(disease_name=chronic_val['name']) if Disease.objects.filter(disease_name=chronic_val['name']) else Disease.objects.create(sym_type=chronic_val['sym_type'],disease_name=chronic_val['name'])
            chronic_detail = ChronicDisease.objects.filter(member=member_obj).update(doctor_name=chronic_val['doctor'],cost=chronic_val['tot_cost'],status=True,details=chronic_val['details']) if Surgery.objects.filter(member=member_obj,disease=disease) else ChronicDisease.objects.create(member=member_obj,disease_name=disease,doctor_name=chronic_val['doctor'],cost=chronic_val['tot_cost'],status=True,details=chronic_val['details'])
        return HttpResponse(content=json.dumps({'response':'success'}),content_type='Application/json')
    else:
        member_id = request.GET['mem_id']
        member_obj = Member.objects.get(mem_id=member_id)
        if ChronicDisease.objects.filter(member=member_obj):
            chronic_detail = map(lambda x:{'sym_type':x.disease_name.sym_type,'disease':x.disease_name.disease_name,'doctor':x.doctor_name,'cost':x.cost,'status':x.status,'details':x.details},ChronicDisease.objects.filter(member=member_obj))
        else:
            chronic_detail = []
        if Surgery.objects.filter(member=member_obj):
            surgery_detail = map(lambda x:{'sym_type':x.disease.sym_type,'disease':x.disease.disease_name,'hospital_name':x.hospital_name,'cost':x.cost,'cash_hand':x.cash_inHand,'details':x.details},Surgery.objects.filter(member=member_obj))
        else:
            surgery_detail = []
        if Medical.objects.filter(member=member_obj):
            medical_details = map(lambda x:{'sym_type':x.disease.sym_type,'disease_id':x.disease.disease_id,'name':x.disease.disease_name,'medicine_needs':x.medicine_needs,'cost':x.cost},Medical.objects.filter(member=member_obj))
        else:
            medical_details = []
        return HttpResponse(content=json.dumps({'medical':medical_details,'surgery':surgery_detail,'chronic':chronic_detail}),content_type='Application/json')            

# @login_required
def DiseaseData(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        if Disease.objects.filter(disease_id=data['disease_id']):
            if Disease.objects.filter(disease_name=data['disease']):
                disease = Disease.objects.filter(disease_name=data['disease']).update(description=data['description'])
                return HttpResponse(content=json.dumps({'response':'Description Updated!'}),content_type='Application/json')
            else:
                disease = Disease.objects.filter(disease_id=data['disease_id']).update(description=data['description'],disease_name=data['disease'])
                return HttpResponse(content=json.dumps({'response':'Disease Name Updated!'}),content_type='Application/json')
        elif Disease.objects.filter(disease_name=data['disease']):
            disease = Disease.objects.filter(disease_name=data['disease']).update(description=data['description'],disease_id=data['disease_id'])
            return HttpResponse(content=json.dumps({'response':'Description updated!'}),content_type='Application/json')
        else:
            disease = Disease.objects.create(disease_name=data['disease'],disease_id=data['disease_id'],sym_type=data['sym_type'],description=data['description'])
            return HttpResponse(content=json.dumps({'response':'Disease added Successfully!'}),content_type='Application/json')
    else:
        try:
            symptom_type = request.GET['type']
            # get_data = defaultdict(list)
            # for k in Disease.objects.filter(sym_type=symptom_type):
                # get_data[k.sym_type].append({'description':k.description,'name':k.disease_name})
            get_data = map(lambda x:{'type':x.sym_type,'disease_id':x.disease_id,'name':x.disease_name,'description':x.description},Disease.objects.filter(sym_type=symptom_type))
            return HttpResponse(content=json.dumps({'response':get_data}),content_type='Application/json')
        except:
            disease = Disease.objects.filter(disease_name=request.GET['disease']).delete()
            return HttpResponse(content=json.dumps({'response':'Disease Deleted Successfully!'}),content_type='Application/json')

def new_member(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        get_mohalla = Masjid.objects.get(mohalla_id=data['mohalla_id'])
        if data['status'] == 'new':
            if User.objects.filter(username=data['username']):
                response = 'Username Exist!'
            elif User.objects.filter(email=data['email']):
                response = 'Email ID Exist!'    
            else:
                if SensesMembers.objects.filter(user=user,member_type=data['member_type'],masjid=get_mohalla):
                    response =  'Given Data Exist!'
                elif SensesMembers.objects.filter(member_type='Mohalla User',masjid=get_mohalla):
                    response =  'Mohalla User Exist!'
                else:
                    user = User.objects.create(username=data['username'],email=data['email'])
                    user.set_password(data['password'])
                    user.save()
                    user_add = SensesMembers.objects.create(user=user,member_type=data['member_type'],masjid=get_mohalla)
                    response = 'Member Created Successfully!'
        elif data['status'] == 'edit':
            user = User.objects.get(username=data['username'])
            if User.objects.filter(email=data['email']):
                response = 'Email ID Exist!'
            else:
                user.email = data['email']
                user.save()
                response = 'Updated Successfully!'
            if data['re_password'] == '':
                pass
            else:
                user.set_password(data['re_password'])
                user.save()
                response = 'Updated Successfully!'
            # sense_member = SensesMembers.objects.filter(user=user,masjid=get_mohalla).update(member_type=data['member_type'])
        elif data['status'] == 'delete':
            user = User.objects.filter(username=data['username']).delete()
            # sense_member = SensesMembers.objects.filter(user=user,masjid=get_mohalla,member_type=data['member_type']).delete()
            response = 'Deleted Successfully!'           
        return HttpResponse(content=json.dumps({'data':response}),content_type='Application/json')
    else:
        muhalla = Masjid.objects.get(mohalla_id=request.GET['muhalla_id'])
        print 'muhalla',muhalla.id,request.GET['muhalla_id']
        if SensesMembers.objects.filter(masjid=muhalla):
            try:
                sen_mem = SensesMembers.objects.get(masjid=muhalla)
            except:
                sen_mem = SensesMembers.objects.filter(masjid=muhalla)[0]            
            # sense_member = map(lambda x:{'username':x.user.username,'email':x.user.email,'Member_type':x.member_type},SensesMembers.objects.filter(masjid=muhalla))
            return HttpResponse(content=json.dumps({'username':sen_mem.user.username,'email':sen_mem.user.email,'Member_type':sen_mem.member_type}),content_type='Application/json')
            # return HttpResponse(content=json.dumps({'data':sense_member}),content_type='Application/json')
        else:
            return HttpResponse(content=json.dumps({'data':'No Data Found!'}),content_type='Application/json')
            

def change_password(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        if data['status'] == 'edit':
            user = authenticate(username=data['username'], password=data['password'])
            if user:
                get_user = User.objects.get(username=data['username'])
                get_user.set_password(data['change_pwd'])
                get_user.save()
                response = 'Password Changed Successfully!'
            else:
                response = 'Old Password is incorrect!'
        elif data['status'] == 'forgot':
            if User.objects.filter(username=data['username'],email=data['email']):
                get_user = User.objects.get(username=data['username'],email=data['email'])
                get_user.set_password(data['password'])
                get_user.save()
                response = 'Password Changed Successfully!'
            else:
                response = 'Username & Email Not Matching!'               
        return HttpResponse(content=json.dumps({'data':response}),content_type='Application/json')

def dashboard_api(request):
    if request.method == 'GET':
        muhalla = len(Masjid.objects.all())
        count_dict = {}
        fam_dict = {}
        item_list = [dic.district.district_name for dic in Masjid.objects.all()]
        for i in item_list:
            count_dict[i] = count_dict.setdefault(i,0) + 1
        fam_member = len(Member.objects.all())
        tot_family = len(Family.objects.all())
        fam_list = [dic.muhalla.district.district_name for dic in Family.objects.all()]
        for j in fam_list:
            fam_dict[j] = fam_dict.setdefault(j,0) + 1
        volunteer_interest = len(Member.objects.filter(volunteer=True))
        donor_interest = len(Member.objects.filter(donor=True))
        return HttpResponse(content=json.dumps({'muhalla':muhalla,'fam_count':fam_dict,'muhalla_total':count_dict,'fam_member':fam_member,'tot_family':tot_family,'volunteer_interest':volunteer_interest,'donor_interest':donor_interest}),content_type='Application/json')

#convert xls to csv
# def csv_from_excel(xlsfile):
#     print 'xlsfile'
#     csv_name = '%s.csv'%str(xlsfile).split('.')[0]
#     print 'csv_name',xlsfile.file
#     # f = open(xlsfile,"rb")
#     # f.read()
#     # print 'f',f
#     wb = xlrd.open_workbook(filename=None,file_contents=xlsfile.read())
#     # f.close()
#     print 'wb',wb
#     sh = wb.sheet_by_name('Sheet1')
#     print sh.row_values(1),'rows'
#     # exit()
#     csv_file = open(csv_name, 'wb')
#     wr = csv.writer(csv_file, quoting=csv.QUOTE_ALL)
#     for rownum in xrange(sh.nrows):
#         wr.writerow(sh.row_values(1))
#     csv_file.close()
#     f = open(csv_file, 'r')
#     f.read()
#     f.close()
#     return f
#end    

def upload_bulk_data(request):
    get_csv = request.FILES['csv_file']
    csv_import = importcsvdata(get_csv)
    if csv_import == None:
        response = 'Data Imported Successfully!'
    else:
        response = str(csv_import)        
    return HttpResponse(content=json.dumps({'data':response}),content_type='Application/json')

def report_to_pdf(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        print 'report',data['report']
        file_path = os.path.dirname(os.path.dirname(__file__))
        if data['report']['report_name'] == 'Mohalla Report':
            pdf_filename = 'mohalla_report.pdf'
            html_filename = '%s/templates/mohalla_report.html'%file_path
        elif data['report']['report_name'] == 'Total Family Details':
            pdf_filename = 'family_report.pdf'
            html_filename = '%s/templates/family_details.html'%file_path
        elif data['report']['report_name'] == 'Families without toilets':
            pdf_filename = 'fam_wo_toilet.pdf'
            html_filename = '%s/templates/fam_wo_toilet.html'%file_path    
        elif data['report']['report_name'] == 'Own House & Rent House families':
            pdf_filename = 'own_rent_house_report.pdf'
            html_filename = '%s/templates/own_rent_house.html'%file_path    
        elif data['report']['report_name'] == 'Families Eligible for Jakaath':
            pdf_filename = 'fam_eligible_jakath.pdf'
            html_filename = '%s/templates/fam_eligible_jakath.html'%file_path    
        elif data['report']['report_name'] == 'Medical Needs and Guidance Needers Details':
            pdf_filename = 'medical_needers.pdf'
            html_filename = '%s/templates/medical_needers.html'%file_path     
        elif data['report']['report_name'] == 'Government Schemes and Guidance Needers Details':
            pdf_filename = 'govt_scheme_needers.pdf'
            html_filename = '%s/templates/govt_scheme_needers.html'%file_path
        elif data['report']['report_name'] == 'Government Voter ID Needers':
            pdf_filename = 'voter_id_needers.pdf'
            html_filename = '%s/templates/voter_id_needers.html'%file_path
        elif data['report']['report_name'] == 'Educational Help and Guidance Needers List':
            pdf_filename = 'edu_guide_needers.pdf'
            html_filename = '%s/templates/edu_guide_needers.html'%file_path
        elif data['report']['report_name'] == 'Help for Discontinued and Guidance Needers List':
            pdf_filename = 'help_for_discontinued.pdf'
            html_filename = '%s/templates/help_for_discontinued.html'%file_path
        elif data['report']['report_name'] == 'Basic Help Needers List':
            pdf_filename = 'basic_help_needers.pdf'
            html_filename = '%s/templates/basic_help_needers.html'%file_path  
        elif data['report']['report_name'] == 'Help for Poor Peoples and Guidance Needers List':
            pdf_filename = 'help_for_poor_people.pdf'
            html_filename = '%s/templates/help_for_poor_people.html'%file_path   
        elif data['report']['report_name'] == 'Training/Employment Help and Guidance Needers List':
            pdf_filename = 'training_employment.pdf'
            html_filename = '%s/templates/training_employment.html'%file_path
        elif data['report']['report_name'] == 'Childrens Need to join Makthab Madarasa':
            pdf_filename = 'maktab_madarasa.pdf'
            html_filename = '%s/templates/maktab_madarasa.html'%file_path
        elif data['report']['report_name'] == 'Women chldrens Need to join Niswan Madarasa':
            pdf_filename = 'niswan_madarasa.pdf'
            html_filename = '%s/templates/niswan_madarasa.html'%file_path
        elif data['report']['report_name'] == 'Persons Need to join Jumrah Madarasa':
            pdf_filename = 'jumra_madarasa.pdf'
            html_filename = '%s/templates/jumra_madarasa.html'%file_path
        elif data['report']['report_name'] == 'Needs Types':
            pdf_filename = 'needs_types.pdf'
            html_filename = '%s/templates/needs_types.html'%file_path    
        else:
            pdf_filename = 'reports_gen.pdf'
            html_filename = '%s/templates/report_to_pdf.html'%file_path
        pdf_filepath = '%s/static/pdf/%s'%(file_path,pdf_filename)
        options = {
            'page-size': 'Letter',
            'margin-top': '0.1in',
            'margin-right': '0.75in',
            'margin-bottom': '0.1in',
            'margin-left': '0.75in',
        }
        f = open('myfile.html','w')    
        html_content = render_to_string(html_filename,{'header':data['header'],'data':data['data'],'report':data['report'],'total':len(data['data']),'finacial_value':data['finacial_value']})
        f.write(html_content)
        f.close()
        print 'data',data['header']
        print_pdf(data,pdf_filename,pdf_filepath)
        # response = pdfkit.from_string(html_content, pdf_filepath,options=options)
        return HttpResponse(content=json.dumps({'data':data,'pdfname':pdf_filename}),content_type='Application/json')
    else:
        file_path = os.path.dirname(os.path.dirname(__file__))
        pdf_filename = 'reports_gen.pdf'
        html_filename = '%s/templates/report_to_pdf.html'%file_path
        html_content = render_to_string(html_filename,{'name':'name'})
        response = pdfkit.from_string(html_content, pdf_filename)
        open_pdf = '%s/%s'%(file_path,pdf_filename)
        f = open(open_pdf,'r')
        response = f.read()
        f.close()
        return HttpResponse(response,content_type='Application/pdf')

def matrix_taluk_api(request):
    if request.method == 'GET':
        district = request.GET['district']
        count_dict = {}
        if request.GET['service_id'] != 'none':
            service = Service.objects.get(service_id=request.GET['service_id'])
            data = map(lambda x:{'service_name':x.scheme.name,'service_id':x.scheme.service_id,'taluk':x.member.muhalla.taluk.taluk_name,'district':x.member.muhalla.taluk.district.district_name},Member_service.objects.filter(scheme=service,status=True,solution='Not Yet'))
            get_district = filter(None,map(lambda y:{'service_name':y['service_name'],'service_id':y['service_id'],'taluk':y['taluk'],'district':y['district']} if y['district']==district else None,data))
            item_list = [dic['taluk'] for dic in get_district]
            compaign_name = service.name
            compaign_id = request.GET['service_id']
            for j in item_list:
                count_dict[j] = count_dict.setdefault(j,0) + 1
            data = json.dumps({'data':count_dict,'district':district,'campaign':compaign_name,'compaign_id':compaign_id})      
        elif request.GET['scheme_id'] != 'none':
            scheme = SubScheme.objects.get(subscheme_id=request.GET['scheme_id'])           
            data = map(lambda x:{'scheme_id':x.scheme.subscheme_id,'scheme_name':x.scheme.name,'taluk':x.member.muhalla.taluk.taluk_name,'district':x.member.muhalla.taluk.district.district_name},Member_scheme.objects.filter(scheme=scheme,status=True,solution='Not Yet')) 
            get_district = filter(None,map(lambda y:{'scheme_id':y['scheme_id'],'scheme_name':y['scheme_name'],'taluk':y['taluk'],'district':y['district']} if y['district']==district else None,data))
            item_list = [dic['taluk'] for dic in get_district]
            compaign_name = scheme.name
            compaign_id = request.GET['scheme_id']
            for j in item_list:
                count_dict[j] = count_dict.setdefault(j,0) + 1
            data = json.dumps({'data':count_dict,'district':district,'campaign':compaign_name,'compaign_id':compaign_id})
        elif request.GET['disease_id'] != 'none':
            disease = Disease.objects.get(disease_id=request.GET['disease_id'])           
            data = map(lambda x:{'disease_id':x.disease.disease_id,'disease_name':x.disease.disease_name,'taluk':x.member.muhalla.taluk.taluk_name,'district':x.member.muhalla.taluk.district.district_name},Medical.objects.filter(disease=disease))
            get_district = filter(None,map(lambda y:{'disease_name':y['disease_name'],'taluk':y['taluk'],'district':y['district']} if y['district']==district else None,data))
            item_list = [dic['taluk'] for dic in data]
            compaign_id = request.GET['disease_id']
            compaign_name = disease.disease_name
            for j in item_list:
                count_dict[j] = count_dict.setdefault(j,0) + 1     
            data = json.dumps({'data':count_dict,'district':district,'campaign':compaign_name,'compaign_id':compaign_id})
        else:
            data = []
        print 'data',data    
        try:
            if request.GET['callback']:
                callback_val = request.GET['callback']
                data = '%s(%s);' % (callback_val,data)
        except:
            print 'report',repr(format_exc())    
        # except:
            # print 'repr',repr(format_exc())
        print 'data',data    
        return HttpResponse(data,content_type='Application/json')    

def fetch_data_api(request):
    if request.method == 'GET':
        schemes_data = []
        service_data = []
        disease_data = []
        for i in SubScheme.objects.all():
            scheme_data = map(lambda x:{'scheme_name':x.scheme.name,'scheme_id':x.scheme.subscheme_id,'district':x.member.muhalla.taluk.district.district_name},Member_scheme.objects.filter(scheme=i,status=True,solution='Not Yet'))
            tot_scheme_data = map(lambda x:{'scheme_name':x.scheme.name,'scheme_id':x.scheme.subscheme_id,'district':x.member.muhalla.taluk.district.district_name},Member_scheme.objects.filter(scheme=i,status=True))
            count_dict = {'Ariyalur':0,'Chennai':0,'Coimbatore':0,'Cuddalore':0,'Dharmapuri':0,'Dindigul':0,'Erode':0,'Kanchipuram':0,'Kanyakumari':0,'Karur':0,'Krishnagiri':0,'Madurai':0,'Nagapattinam':0,'Namakkal':0,'The Nilgiris':0,'Perambalur':0,'Pudukkottai':0,'Ramanathapuram':0,'Salem':0,'Sivaganga':0,'Thanjavur':0,'Theni':0,'Thoothukudi':0,'Tiruchirappalli':0,'Tirunelveli':0,'Tiruppur':0,'Tiruvallur':0,'Tiruvannamalai':0,'Tiruvarur':0,'Vellore':0,'Viluppuram':0,'Virudhunagar':0}
            tot_count_dict = {'Ariyalur':0,'Chennai':0,'Coimbatore':0,'Cuddalore':0,'Dharmapuri':0,'Dindigul':0,'Erode':0,'Kanchipuram':0,'Kanyakumari':0,'Karur':0,'Krishnagiri':0,'Madurai':0,'Nagapattinam':0,'Namakkal':0,'The Nilgiris':0,'Perambalur':0,'Pudukkottai':0,'Ramanathapuram':0,'Salem':0,'Sivaganga':0,'Thanjavur':0,'Theni':0,'Thoothukudi':0,'Tiruchirappalli':0,'Tirunelveli':0,'Tiruppur':0,'Tiruvallur':0,'Tiruvannamalai':0,'Tiruvarur':0,'Vellore':0,'Viluppuram':0,'Virudhunagar':0}
            tot_scheme_dict = {}
            item_list = [dic['district'] for dic in scheme_data]
            for j in item_list:
                count_dict[j] = count_dict.setdefault(j,0) + 1
            tot_item_list = [tot['district'] for tot in tot_scheme_data]
            for k in tot_item_list:
                tot_count_dict[k] = tot_count_dict.setdefault(k,0) + 1    
            # tot_scheme_list = [tot['scheme_name'] for tot in tot_scheme_data]
            # for l in tot_scheme_list:
            #     tot_scheme_dict[l] = tot_scheme_dict.setdefault(l,0) + 1    
            # schemes_data[i.name].append({'total_count':tot_count_dict,'unsolved_district_count':count_dict,'total_scheme_count':len(tot_scheme_data)})
            count_dict['The_Nilgiris'] = count_dict.pop('The Nilgiris')
            tot_count_dict['The_Nilgiris'] = tot_count_dict.pop('The Nilgiris')
            count_data = collections.OrderedDict(sorted(count_dict.items()))
            schemes_data.append({'scheme_name':i.name,'scheme_id':i.subscheme_id,'total_count':tot_count_dict,'unsolved_district_count':count_data,'total_scheme_count':len(tot_scheme_data),'total_unsolved_scheme_count':len(scheme_data)})

        for i in Service.objects.all():
            serv_data = map(lambda x:{'scheme_name':x.scheme.name,'service_id':x.scheme.service_id,'district':x.member.muhalla.taluk.district.district_name},Member_service.objects.filter(scheme=i,status=True,solution='Not Yet'))
            tot_scheme_data = map(lambda x:{'scheme_name':x.scheme.name,'service_id':x.scheme.service_id,'district':x.member.muhalla.taluk.district.district_name},Member_service.objects.filter(scheme=i,status=True))
            count_dict = {'Ariyalur':0,'Chennai':0,'Coimbatore':0,'Cuddalore':0,'Dharmapuri':0,'Dindigul':0,'Erode':0,'Kanchipuram':0,'Kanyakumari':0,'Karur':0,'Krishnagiri':0,'Madurai':0,'Nagapattinam':0,'Namakkal':0,'The Nilgiris':0,'Perambalur':0,'Pudukkottai':0,'Ramanathapuram':0,'Salem':0,'Sivaganga':0,'Thanjavur':0,'Theni':0,'Thoothukudi':0,'Tiruchirappalli':0,'Tirunelveli':0,'Tiruppur':0,'Tiruvallur':0,'Tiruvannamalai':0,'Tiruvarur':0,'Vellore':0,'Viluppuram':0,'Virudhunagar':0}
            tot_count_dict = {'Ariyalur':0,'Chennai':0,'Coimbatore':0,'Cuddalore':0,'Dharmapuri':0,'Dindigul':0,'Erode':0,'Kanchipuram':0,'Kanyakumari':0,'Karur':0,'Krishnagiri':0,'Madurai':0,'Nagapattinam':0,'Namakkal':0,'The Nilgiris':0,'Perambalur':0,'Pudukkottai':0,'Ramanathapuram':0,'Salem':0,'Sivaganga':0,'Thanjavur':0,'Theni':0,'Thoothukudi':0,'Tiruchirappalli':0,'Tirunelveli':0,'Tiruppur':0,'Tiruvallur':0,'Tiruvannamalai':0,'Tiruvarur':0,'Vellore':0,'Viluppuram':0,'Virudhunagar':0}
            item_list = [dic['district'] for dic in serv_data]
            for j in item_list:
                count_dict[j] = count_dict.setdefault(j,0) + 1
            tot_item_list = [tot['district'] for tot in tot_scheme_data]
            for k in tot_item_list:
                tot_count_dict[k] = tot_count_dict.setdefault(k,0) + 1
            count_dict['The_Nilgiris'] = count_dict.pop('The Nilgiris')
            tot_count_dict['The_Nilgiris'] = tot_count_dict.pop('The Nilgiris')
            count_data = collections.OrderedDict(sorted(count_dict.items()))
            service_data.append({'scheme_name':i.name,'service_id':i.service_id,'total_count':tot_count_dict,'unsolved_district_count':count_data,'total_scheme_count':len(tot_scheme_data)})    
        for d in Disease.objects.all():
            dis_data = map(lambda x:{'disease_name':x.disease.disease_name,'disease_id':x.disease.disease_id,'district':x.member.muhalla.taluk.district.district_name},Medical.objects.filter(disease=d))
            count_dict = {'Ariyalur':0,'Chennai':0,'Coimbatore':0,'Cuddalore':0,'Dharmapuri':0,'Dindigul':0,'Erode':0,'Kanchipuram':0,'Kanyakumari':0,'Karur':0,'Krishnagiri':0,'Madurai':0,'Nagapattinam':0,'Namakkal':0,'The Nilgiris':0,'Perambalur':0,'Pudukkottai':0,'Ramanathapuram':0,'Salem':0,'Sivaganga':0,'Thanjavur':0,'Theni':0,'Thoothukudi':0,'Tiruchirappalli':0,'Tirunelveli':0,'Tiruppur':0,'Tiruvallur':0,'Tiruvannamalai':0,'Tiruvarur':0,'Vellore':0,'Viluppuram':0,'Virudhunagar':0}
            item_list = [dic['district'] for dic in dis_data]
            for j in item_list:
                count_dict[j] = count_dict.setdefault(j,0) + 1
            count_dict['The_Nilgiris'] = count_dict.pop('The Nilgiris')   
            count_data = collections.OrderedDict(sorted(count_dict.items()))
            disease_data.append({'disease_name':d.disease_name,'disease_id':d.disease_id,'disease_count':count_data,'total_count':len(dis_data)})    

        data = json.dumps({'schemes_data':schemes_data,'service_data':service_data,'disease_data':disease_data})
        try:
            if request.GET['callback']:
                callback_val = request.GET['callback']
                data = '%s(%s);' % (callback_val,data)
        except:
            print 'report',repr(format_exc())                               
    return HttpResponse(data,content_type='Application/json')

def sortReportData(request):
    # json.loads(request.body)['sort_val']
    sort_val = json.loads(request.body)['sort_val']
    report_type = json.loads(request.body)['report_type']
    if 'Family ID' in sort_val:
        sort_key = 'familyid'
    elif 'Name' in sort_val:
        if report_type == 'Medical Needs and Guidance Needers Details' or report_type == 'Help for Poor Peoples and Guidance Needers List' or report_type == 'Government Schemes and Guidance Needers Details' or report_type == 'Educational Help and Guidance Needers List' or report_type == 'Help for Discontinued and Guidance Needers List' or report_type == 'Training/Employment Help and Guidance Needers List' or report_type == 'Needs Types':
            sort_key = 'name'
        else:
            sort_key = 'family_head'
    elif 'Age' in sort_val:
        sort_key = 'age'
    elif 'Financial Status' in sort_val:
        sort_key = 'financial_status'
    else:
        sort_key = 'familyid'
    sort_reverse = json.loads(request.body)['sort_type']
    sort_reverse = False if sort_reverse == True else True
    sort_data = sorted(json.loads(request.body)['data'],key=itemgetter(sort_key),reverse=sort_reverse)
    return HttpResponse(json.dumps({'sort_data':sort_data}),content_type='Application/json')

def print_pdf(data,name,path):
    from reportlab.lib import *
    response = HttpResponse(mimetype='application/pdf')
    response['Content-Disposition'] = 'attachment; filename=somefilename.pdf'

    elements = []
    # data=[(1,2),(3,4)]
    print 'data',name
    # doc = SimpleDocTemplate(response, rightMargin=0, leftMargin=0, topMargin=0, bottomMargin=0)
    # data= [['Top\nLeft', '', '02', '03', '04'],
    #  ['', '', '12', '13', '14'],
    #  ['20', '21', '22', 'Bottom\nRight', ''],
    #  ['30', '31', '32', '', '']]
    fields = tuple(zip(data['data'][0].keys(),data['data'][0].keys()))
    data = data['data']
    doc = DataToPdf(fields, data)
    doc.export(name)
    # doc.export('LogFiles.pdf')
    # table=Table(data,style=[
    #  ('GRID',(0,0),(-1,-1),0.5,colors.grey),
    #  ('BACKGROUND',(0,0),(1,1),colors.palegreen),
    #  ('SPAN',(0,0),(1,1)),
    #  ('BACKGROUND',(-2,-2),(-1,-1), colors.pink),
    #  ('SPAN',(-2,-2),(-1,-1)),
    #  ])

    # table = Table(data, colWidths=270, rowHeights=79)
    # elements.append(table)
    # doc.build(elements)
    print 'doc',doc 
    return response
