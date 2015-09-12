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
        data = defaultdict(list)
        for i in Taluk.objects.all():
            data[i.district.district_name].append(i.taluk_name)
        # taluk = map(lambda x:{'district'}    Taluk.objects.all())
        return HttpResponse(content=json.dumps({'data':data}), content_type='Application/json')

def SchemeData(request):
    print 'request'
    if request.method == 'POST':
        data = json.loads(request.body)
        try:
            scheme = Scheme.objects.get(scheme_type=data['scheme'])
            if SubScheme.objects.filter(scheme=scheme,name=data['sub'],field=data['field'],conditions=data['condition'],value=data['value']):
                return HttpResponse(content=json.dumps({'data':'Scheme and Sub Scheme Exist!'}), content_type='Application/json')
            elif SubScheme.objects.filter(scheme=scheme,name=data['sub']):
                sub_scheme = SubScheme.objects.filter(scheme=scheme,name=data['sub']).update(field=data['field'],conditions=data['condition'],value=data['value'])
                return HttpResponse(content=json.dumps({'data':'Updated'}), content_type='Application/json')
            else:
                print 'save',scheme
                subScheme = SubScheme.objects.create(scheme=scheme,name=data['sub'],field=data['field'],conditions=data['condition'],value=data['value'])
                return HttpResponse(content=json.dumps({'data':'success'}), content_type='Application/json')
        except:
            scheme = Scheme.objects.create(scheme_type=data['scheme'])
            sub_scheme = SubScheme.objects.create(scheme=scheme,name=data['sub'],field=data['field'],conditions=data['condition'],value=data['value'])
        return HttpResponse(content=json.dumps({'data':'success'}), content_type='Application/json')
    else:
        data = defaultdict(list)
        for i in SubScheme.objects.all():
            data[i.scheme.scheme_type].append({'sub':i.name,'field':i.field,'conditions':i.conditions,'value':i.value})
        # taluk = map(lambda x:{'district'}    Taluk.objects.all())
        return HttpResponse(content=json.dumps({'data':data}), content_type='Application/json')

def add_masjid(request):
    if request.method == 'POST':        
        data = json.loads(request.body)
        taluk = Taluk.objects.get(district=District.objects.get(district_name=data['district']),taluk_name=data['taluk'])
        if Masjid.objects.filter(mohalla_id=data['mohalla_id']):
            masjid = Masjid.objects.filter(mohalla_id=data['mohalla_id']).update(taluk=taluk,name=data['masjid_name'],musallas=data['musallas'],location=data['address'])
            return HttpResponse(content=json.dumps({'data':'updated!'}),content_type='Application/json')
        else:
            masjid = Masjid.objects.create(mohalla_id=data['mohalla_id'],taluk=taluk,name=data['masjid_name'],musallas=data['musallas'],location=data['address'])
            return HttpResponse(content=json.dumps({'data':'success!'}),content_type='Application/json')
    else:
        get_members = map(lambda x:{'name':x.name,'mohalla_id':x.mohalla_id,'taluk':x.taluk.taluk_name,'district':x.taluk.district.district_name,'musallas':x.musallas,'location':x.location},Masjid.objects.all())
        return HttpResponse(content=json.dumps({'data':get_members}),content_type='Application/json')

def masjid_member(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        # taluk = Taluk.objects.get(district=District.objects.get(district_name=data['data']['district']),taluk_name=data['data']['taluk'])
        masjid_val = Masjid.objects.get(mohalla_id=data['data']['masjid_id'])
        if Masjid_members.objects.filter(masjid=masjid_val,member_name=data['member_name'],designation=data['designation']):
            masjid = Masjid_members.objects.filter(masjid=masjid_val,member_name=data['member_name'],designation=data['designation']).update(age=data['age'],mobile=data['mobile'],address=data['address'])
            response = 'updated'
        else:
            masjid = Masjid_members.objects.create(masjid=masjid_val,member_name=data['member_name'],designation=data['designation'],age=data['age'],mobile=data['mobile'],address=data['address'])
            response = 'success'
        return HttpResponse(content=json.dumps({'data':response}),content_type='Application/json')
    else:
        data = request.GET
        # taluk = Taluk.objects.get(taluk_name=data['taluk'],district=District.objects.get(district_name=data['district']))
        if Masjid.objects.filter(mohalla_id=data['masjid_id']):
            masjid = Masjid.objects.get(mohalla_id=data['masjid_id'])
            get_members = map(lambda x:{'name':x.member_name,'age':x.age,'mobile':x.mobile,'address':x.address,'designation':x.designation},Masjid_members.objects.filter(masjid=masjid))
        return HttpResponse(content=json.dumps({'data':get_members}),content_type='Application/json')    

def familyData(request):
    if request.method == 'POST':
        data = json.loads(request.body)['value']
        print 'data',data
        taluk = Taluk.objects.get(taluk_name=data['taluk'],district=District.objects.get(district_name=data['district']))
        masjid = Masjid.objects.get(name=data['masjid'],taluk=taluk)
        toilet = True if data['toilet'] == 'Yes' else False
        donor = True if data['donor'] == 'Yes' else False
        volunteer = True if data['volunteer'] == 'Yes' else False
        insurance = True if data['health_insurance'] == 'Yes' else False
        try:            
            if data['familyid'] != '':
                family = Family.objects.filter(family_id=data['familyid']).update(muhalla=masjid,ration_card=data['ration_card'],address=data['address'],mobile=data['mobile_no'],house_type=data['house'],toilet=toilet,financial_status=data['financial'],donor=donor,volunteer=volunteer,health_insurance=insurance,family_needs=data['family_needs'])
                # family_data = Family.objects.get(id=family)
                # family_data.family_id = '%s / %s%s / %s' %(taluk.district.district_code,'%02d'%taluk.id,'%02d'%masjid.id,family_data.id)
                # family_data.save()
                response = 'Family Data Updated Successfully!'
            else:
                family = Family.objects.create(family_id=data['familyid'],muhalla=masjid,ration_card=data['ration_card'],address=data['address'],mobile=data['mobile_no'],house_type=data['house'],toilet=toilet,financial_status=data['financial'],donor=donor,volunteer=volunteer,health_insurance=insurance,family_needs=data['family_needs'])
                # family.family_id = '%s / %s%s / %s' %(taluk.district.district_code,'%02d'%taluk.id,'%02d'%masjid.id,family.id)
                family.family_id = '%s / %s / %s' %(taluk.district.district_code,masjid.mohalla_id,family.id)
                family.save()
                response = 'Family Data Saved Successfully!'
            return HttpResponse(content=json.dumps({'data':response}),content_type='Application/json')
        except:
            print repr(format_exc())            
    else:
        family = map(lambda x:{'family_id':x.family_id,'muhalla':x.muhalla.name,'taluk':x.muhalla.taluk.taluk_name,'district_name':x.muhalla.taluk.district.district_name,'ration_card':x.ration_card,'address':x.address,'mobile':x.mobile,'house_type':x.house_type,'donor':x.donor,'volunteer':x.volunteer,'health_insurance':x.health_insurance,'family_needs':x.family_needs,'toilet':x.toilet,'financial_status':x.financial_status},Family.objects.all())
        return HttpResponse(content=json.dumps({'data':family}),content_type='Application/json')
        
def FamilyMemberData(request):
    if request.method == 'POST':
        data = json.loads(request.body)['data']
        familyid = json.loads(request.body)['familyid']
        family = Family.objects.get(family_id=familyid)
        voter = True if data['voter'] == 'Yes' else False
        print 'data',familyid
        if Member.objects.filter(mem_id=data['mem_id']):
            member = Member.objects.filter(mem_id=data['mem_id']).update(family=family,name=data['name'],gender=data['gender'],age=data['age'],Relation=data['relationship'],qualification=data['qualification'],marital_status=data['marital_status'],voter_status=voter,curr_location=data['location'],occupation=data['occupation'])
        else:
            member = Member.objects.create(mem_id=data['mem_id'],family=family,name=data['name'],gender=data['gender'],age=data['age'],Relation=data['relationship'],qualification=data['qualification'],marital_status=data['marital_status'],voter_status=voter,curr_location=data['location'],occupation=data['occupation'])
            member.mem_id= '%s / %s' %(familyid,member.id)
            member.save()         
        return HttpResponse(content=json.dumps({'data':'success'}),content_type='Application/json')
    else:
        member = map(lambda x:{'mem_id':x.mem_id,'family':x.family.family_id,'name':x.name,'gender':x.gender,'age':x.age,'relationship':x.Relation,'qualification':x.qualification,'marital_status':x.marital_status,'voter_status':x.voter_status,'curr_location':x.curr_location,'occupation':x.occupation},Member.objects.filter(family=Family.objects.get(family_id=request.GET['family_id'])))
        print 'member',member
        return HttpResponse(content=json.dumps(member),content_type='Application/json')
        
