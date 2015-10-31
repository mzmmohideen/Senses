from django.shortcuts import render_to_response, HttpResponse, render
from senses.models import *
from django.contrib.auth.models import User
from django.core.context_processors import csrf
from django.contrib.auth import authenticate, login
from django.views.decorators.csrf import *
from django.http import HttpResponseRedirect
import json,csv
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout
from collections import defaultdict
from django.core.exceptions import ObjectDoesNotExist
from datetime import datetime, time, timedelta
from traceback import format_exc
from itertools import groupby
from operator import itemgetter
from django.db.models import Q

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
        print 'data',data
        try:
            if Scheme.objects.filter(scheme_type=data['scheme']):
                scheme = Scheme.objects.get(scheme_type=data['scheme'])
            else:
                scheme = Scheme.objects.create(scheme_type=data['scheme'])
            if SubScheme.objects.filter(scheme=scheme,name=data['sub']):
                return HttpResponse(content=json.dumps({'data':'Given SubScheme Exist under this Scheme!'}), content_type='Application/json')
            elif SubScheme.objects.filter(subscheme_id=data['scheme_id']):
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
            district_val = District.objects.get(district_name=data['district'])
            taluk = Taluk.objects.get(district=district_val,taluk_name=data['taluk'])
            print 'data',data['mohalla_id']
            if data['mohalla_id']:                
                if Masjid.objects.filter(mohalla_id=data['mohalla_id'],taluk=taluk):
                    masjid = Masjid.objects.filter(mohalla_id=data['mohalla_id'],taluk=taluk).update(name=data['masjid_name'],musallas=data['musallas'],location=data['address'])
                    return HttpResponse(content=json.dumps({'data':'updated!'}),content_type='Application/json')
                # elif Masjid.objects.filter(mohalla_id=data['masjid_name'],taluk=taluk):
                #     return HttpResponse(content=json.dumps({'data':'Mohalla Name Exist!'}),content_type='Application/json')
            else:
                # else:
                muhalla_dis = len(Masjid.objects.filter(district=district_val))
                muhalla_dis_val = '%04d'%(muhalla_dis+1) if muhalla_dis<9999 else (muhalla_dis+1)
                mohalla_id = '%s / %s'%(district_val.district_code,muhalla_dis_val)
                if Masjid.objects.filter(mohalla_id=mohalla_id):
                    masjid = Masjid.objects.filter(mohalla_id=mohalla_id,taluk=taluk).update(name=data['masjid_name'],musallas=data['musallas'],location=data['address'])
                    return HttpResponse(content=json.dumps({'data':'updated!'}),content_type='Application/json')
                else:
                    masjid = Masjid.objects.create(mohalla_id=mohalla_id,taluk=taluk,name=data['masjid_name'],musallas=data['musallas'],location=data['address'])
                    return HttpResponse(content=json.dumps({'data':'Mohalla Created Successfully!'}),content_type='Application/json')
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
                moh_user = str(masjid_val.mohalla_id.replace(' ','').replace('/','_'))
                if not User.objects.filter(username=moh_user):
                    if SensesMembers.objects.filter(member_type='Mohalla User',masjid=masjid_val):
                        response =  'Mohalla User Exist!'
                    elif User.objects.filter(email=data['email']):
                        response = 'Email ID Exist!'
                    else:
                        create_moh_user = User.objects.create(username=moh_user,email=data['email'])
                        create_moh_user.set_password = '%s%s'%(moh_user,'123')
                        create_moh_user.save()
                        user_add = SensesMembers.objects.create(user=create_moh_user,member_type='Mohalla User',masjid=masjid_val)
                        response = 'Mohalla User Created Successfully!'
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
                familyid = '%s / %s' %(masjid.mohalla_id,get_fam_id+1)
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
        family = map(lambda x:{'family_id':x.family_id,'date':convert_to_IST(x.report_date).strftime('%Y-%m-%d'),'muhalla':x.muhalla.name,'language':x.language,'taluk':x.muhalla.taluk.taluk_name,'district_name':x.muhalla.taluk.district.district_name,'ration_card':x.ration_card,'address':x.address,'mobile':x.mobile,'house_type':x.house_type,'house_cat':x.house_cat,'donor':x.donor,'volunteer':x.volunteer,'health_insurance':x.health_insurance,'family_needs':x.family_needs,'toilet':x.toilet,'financial_status':x.financial_status},Family.objects.all())
        return HttpResponse(content=json.dumps({'data':family}),content_type='Application/json')

def fetchReportData(request):
    if request.method == 'POST':
        data = json.loads(request.body)['data']
        print 'data',data
        get_mem_medical = []
        get_mem_scheme = []
        get_mem_service = []
        member_data = Member.objects.all()
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
        get_memData = map(lambda x:{'familyid':x.family.family_id,'makthab':x.Makthab,'makthab_status':x.madarasa_details,'address':x.family.address,'financial_status':x.family.financial_status,'mobile':x.family.mobile,'family_head':x.name,'mem_id':x.mem_id,'gender':x.gender,'age':x.age,'marital_status':x.marital_status,'voter':x.voter_status},Member.objects.all())
        return HttpResponse(content=json.dumps({'member_details':member_details,'get_mem_service':get_mem_service,'get_mem_medical':get_mem_medical,'get_mem_scheme':get_mem_scheme,'get_memData':get_memData}),content_type='Application/json')
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
            return HttpResponse(content=json.dumps({'data':'Service ID Exist!'}),content_type='Application/json')
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
        if disease_val['name'] != '':
            disease = Disease.objects.get(disease_name=disease_val['name']) if Disease.objects.filter(disease_name=disease_val['name']) else Disease.objects.create(sym_type=disease_val['sym_type'],disease_name=disease_val['name'])
            medical_needs = Medical.objects.filter(member=member_obj).update(medicine_needs=disease_val['medicine'],cost=disease_val['cost']) if Medical.objects.filter(member=member_obj,disease=disease) else Medical.objects.create(member=member_obj,disease=disease,medicine_needs=disease_val['medicine'],cost=disease_val['cost'])
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
            medical_details = map(lambda x:{'sym_type':x.disease.sym_type,'disease':x.disease.disease_name,'medicine_needs':x.medicine_needs,'cost':x.cost},Medical.objects.filter(member=member_obj))
        else:
            medical_details = []
        return HttpResponse(content=json.dumps({'medical':medical_details,'surgery':surgery_detail,'chronic':chronic_detail}),content_type='Application/json')            

# @login_required
def DiseaseData(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        if Disease.objects.filter(disease_name=data['disease_id']):
            return HttpResponse(content=json.dumps({'response':'Disease ID Exist!'}),content_type='Application/json')
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
        sense_member = map(lambda x:{'username':x.user.username,'email':x.user.email,'Member_type':x.member_type},SensesMembers.objects.filter(masjid=muhalla))
        return HttpResponse(content=json.dumps({'data':sense_member}),content_type='Application/json')

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

def fetch_data_api(request):
    if request.method == 'GET':
        schemes_data = []
        service_data = []
        for i in SubScheme.objects.all():
            scheme_data = map(lambda x:{'scheme_name':x.scheme.name,'district':x.member.muhalla.taluk.district.district_name},Member_scheme.objects.filter(scheme=i,status=True,solution='Not Yet'))
            tot_scheme_data = map(lambda x:{'scheme_name':x.scheme.name,'district':x.member.muhalla.taluk.district.district_name},Member_scheme.objects.filter(scheme=i,status=True))
            count_dict = {}
            tot_count_dict = {}
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
            schemes_data.append({'scheme_name':i.name,'total_count':tot_count_dict,'unsolved_district_count':count_dict,'total_scheme_count':len(tot_scheme_data)})

        for i in Service.objects.all():
            serv_data = map(lambda x:{'scheme_name':x.scheme.name,'district':x.member.muhalla.taluk.district.district_name},Member_scheme.objects.filter(scheme=i,status=True,solution='Not Yet'))
            tot_scheme_data = map(lambda x:{'scheme_name':x.scheme.name,'district':x.member.muhalla.taluk.district.district_name},Member_scheme.objects.filter(scheme=i,status=True))
            count_dict = {}
            tot_count_dict = {}
            tot_scheme_dict = {}
            item_list = [dic['district'] for dic in serv_data]
            for j in item_list:
                count_dict[j] = count_dict.setdefault(j,0) + 1
            tot_item_list = [tot['district'] for tot in tot_scheme_data]
            for k in tot_item_list:
                tot_count_dict[k] = tot_count_dict.setdefault(k,0) + 1    
            service_data.append({'scheme_name':i.name,'total_count':tot_count_dict,'unsolved_district_count':count_dict,'total_scheme_count':len(tot_scheme_data)})    
    return HttpResponse(content=json.dumps({'schemes_data':schemes_data}),content_type='Application/json')