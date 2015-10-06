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
from datetime import datetime, time
from traceback import format_exc
from itertools import groupby
from operator import itemgetter
from django.db.models import Q

def login_check(request):
    if User.objects.filter(first_name="Admin"):
        return render(request, 'login.html')
    else:
        return render(request, 'signup.html')

def logout_view(request):
    logout(request)
    request.session.flush()
    return HttpResponseRedirect('/login/')

def login_page(request):
    # check_browser = browser_check(request.user_agent.browser)
    # if check_browser: 
    a = json.loads(request.body)['data']
    user = authenticate(username=a['username'], password=a['password'])
    if user:
        login(request,user)
        user_val=User.objects.get(username=a['username'])
        print 'admin',user_val.first_name
        if user_val.first_name == "Admin":
            print 'admin'
            return HttpResponse(content=json.dumps({'data':'admin_dash'}), content_type='Application/json')
        elif SensesMembers.objects.filter(user=user_val):
            get_mem_data = SensesMembers.objects.get(user=user_val)
            if get_mem_data.member_type == 'Mohalla User':
                return HttpResponse(content=json.dumps({'data':'mohalla_user'}), content_type='Application/json')
            elif get_mem_data.member_type == 'End Users & Donors':
                return HttpResponse(content=json.dumps({'data':'end_user'}), content_type='Application/json')
        else:
            return HttpResponse(content=json.dumps({'data':'invalid'}), content_type='Application/json')
        # return render(request, 'apping.html')
        # return HttpResponse(content=json.dumps({'data':'success'}), content_type='Application/json')
    else:
        return HttpResponse(content=json.dumps({'data':'failed'}), content_type='Application/json')

def signup(request):
    data = json.loads(request.body)['data']
    user = User.objects.create(username=data['username'],first_name="Admin")
    user.set_password(data['password'])
    user.save()    
    return HttpResponse(content=json.dumps({'data':'success'}), content_type='Application/json')

@login_required(login_url='/login/')
def apping(request):    
    return render(request, 'apping.html')        

@login_required(login_url='/login/')
def mohallauser(request):    
    return render(request, 'mohuser.html')

@login_required(login_url='/login/')
def enduser(request):    
    return render(request, 'enduser.html')    

# @login_required    
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
                # print '?????',repr(format_exc())
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
        # taluk = map(lambda x:{'district'}    Taluk.objects.all())
        return HttpResponse(content=json.dumps({'data':data,'district':district}), content_type='Application/json')

# @login_required
def SchemeData(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        print 'data',data
        try:
            if Scheme.objects.filter(scheme_type=data['scheme']):
                scheme = Scheme.objects.get(scheme_type=data['scheme'])
            else:
                scheme = Scheme.objects.create(scheme_type=data['scheme'])
            # if Condition.objects.filter(field=data['field'],conditions=data['condition'],value=data['value']):
            #     condition = Condition.objects.get(field=data['field'],conditions=data['condition'],value=data['value'])
            # else:
            #     condition = Condition.objects.create(field=data['field'],conditions=data['condition'],value=data['value'])                
            if SubScheme.objects.filter(scheme=scheme,name=data['sub']):
                return HttpResponse(content=json.dumps({'data':'Given SubScheme Exist under this Scheme!'}), content_type='Application/json')
            elif SubScheme.objects.filter(subscheme_id=data['scheme_id']):
                sub_scheme = SubScheme.objects.filter(subscheme_id=data['scheme_id']).update(scheme=scheme,name=data['sub'],description=data['description'])
                # sub_scheme.conditions .update(field=data['field'],conditions=data['condition'],value=data['value'])
                return HttpResponse(content=json.dumps({'data':'Updated'}), content_type='Application/json')
            else:
                subScheme = SubScheme.objects.create(scheme=scheme,subscheme_id=data['scheme_id'],name=data['sub'],description=data['description'])
                    # ,field=data['field'],conditions=data['condition'],value=data['value'])
                return HttpResponse(content=json.dumps({'data':'success'}), content_type='Application/json')
        except:
            scheme = Scheme.objects.create(scheme_type=data['scheme'])
            sub_scheme = SubScheme.objects.create(scheme=scheme,name=data['sub'],description=data['description'],subscheme_id=data['scheme_id'])
        return HttpResponse(content=json.dumps({'data':'success'}), content_type='Application/json')
    else:
        data = defaultdict(list)
        for i in SubScheme.objects.all():
            data[i.scheme.scheme_type].append({'sub':i.name,'scheme_id':i.subscheme_id,'description':i.description})
            # data[i.scheme.scheme_type].append({'sub':i.name,'field':i.field,'conditions':i.conditions,'value':i.value})
        # taluk = map(lambda x:{'district'}    Taluk.objects.all())
        return HttpResponse(content=json.dumps({'data':data}), content_type='Application/json')

# @login_required
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

# @login_required
def add_masjid(request):
    if request.method == 'POST':        
        data = json.loads(request.body)
        if data['status'] == 'new':            
            taluk = Taluk.objects.get(district=District.objects.get(district_name=data['district']),taluk_name=data['taluk'])
            if Masjid.objects.filter(mohalla_id=data['mohalla_id']):
                masjid = Masjid.objects.filter(mohalla_id=data['mohalla_id']).update(taluk=taluk,name=data['masjid_name'],musallas=data['musallas'],location=data['address'])
                return HttpResponse(content=json.dumps({'data':'updated!'}),content_type='Application/json')
            else:
                masjid = Masjid.objects.create(mohalla_id=data['mohalla_id'],taluk=taluk,name=data['masjid_name'],musallas=data['musallas'],location=data['address'])
                return HttpResponse(content=json.dumps({'data':'success!'}),content_type='Application/json')
        elif data['status'] == 'delete':
            masjid = Masjid.objects.filter(mohalla_id=data['mohalla_id']).delete()
            return HttpResponse(content=json.dumps({'data':'success!'}),content_type='Application/json')
    else:
        get_members = map(lambda x:{'name':x.name,'mohalla_id':x.mohalla_id,'taluk':x.taluk.taluk_name,'district':x.taluk.district.district_name,'musallas':x.musallas,'location':x.location},Masjid.objects.all())
        return HttpResponse(content=json.dumps({'data':get_members}),content_type='Application/json')

def get_mahallauser_data(request):
    mohallaData = SensesMembers.objects.get(user=request.user)
    muhalla = {'uname':request.user.username,'mohalla_id':mohallaData.masjid.mohalla_id,'musallas':mohallaData.masjid.musallas,'address':mohallaData.masjid.location,'mohalla':mohallaData.masjid.name,'taluk':mohallaData.masjid.taluk.taluk_name,'district':mohallaData.masjid.taluk.district.district_name}
    return HttpResponse(content=json.dumps({'muhalla':muhalla}),content_type='Application/json')
# @login_required
def masjid_member(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        # taluk = Taluk.objects.get(district=District.objects.get(district_name=data['data']['district']),taluk_name=data['data']['taluk'])
        if data['status'] == 'new':
            masjid_val = Masjid.objects.get(mohalla_id=data['data']['mohalla_id'])
            if Masjid_members.objects.filter(masjid=masjid_val,member_name=data['member_name'],designation=data['designation']):
                masjid = Masjid_members.objects.filter(masjid=masjid_val,member_name=data['member_name'],designation=data['designation']).update(age=data['age'],mobile=data['mobile'],address=data['address'])
                response = 'updated'
            else:
                masjid = Masjid_members.objects.create(masjid=masjid_val,member_name=data['member_name'],designation=data['designation'],age=data['age'],mobile=data['mobile'],address=data['address'])
                response = 'success'
            return HttpResponse(content=json.dumps({'data':response}),content_type='Application/json')    
        elif data['status'] == 'edit':
            print 'edit'
            masjid = Masjid_members.objects.filter(masjid=Masjid.objects.get(mohalla_id=data['mohalla_id']),member_name=data['name'],designation=data['designation']).update(age=data['age'],mobile=data['mobile'],address=data['address'],member_name=data['name'],designation=data['designation'])
            return HttpResponse(content=json.dumps({'data':'updated'}),content_type='Application/json')
        elif data['status'] == 'delete':
            masjid = Masjid_members.objects.filter(masjid=Masjid.objects.get(mohalla_id=data['mohalla_id']),member_name=data['data']['name'],designation=data['data']['designation']).delete()                
            return HttpResponse(content=json.dumps({'data':'Deleted'}),content_type='Application/json')
    else:
        data = request.GET
        # taluk = Taluk.objects.get(taluk_name=data['taluk'],district=District.objects.get(district_name=data['district']))
        if Masjid.objects.filter(mohalla_id=data['masjid_id']):
            masjid = Masjid.objects.get(mohalla_id=data['masjid_id'])
            get_members = map(lambda x:{'name':x.member_name,'age':x.age,'mobile':x.mobile,'address':x.address,'designation':x.designation},Masjid_members.objects.filter(masjid=masjid))
        return HttpResponse(content=json.dumps({'data':get_members}),content_type='Application/json')    

# @login_required
def familyData(request):
    if request.method == 'POST':
        data = json.loads(request.body)['value']
        taluk = Taluk.objects.get(taluk_name=data['taluk'],district=District.objects.get(district_name=data['district']))
        masjid = Masjid.objects.get(mohalla_id=data['mohalla_id'])
        toilet = True if data['toilet'] == 'Yes' else False
        # donor = True if data['donor'] == 'Yes' else False
        # volunteer = True if data['volunteer'] == 'Yes' else False
        insurance = True if data['health_insurance'] == 'Yes' else False
        try:            
            if data['familyid'] != '':
                family = Family.objects.filter(family_id=data['familyid']).update(muhalla=masjid,language=data['language'],ration_card=data['ration_card'],address=data['address'],mobile=data['mobile_no'],house_type=data['house'],toilet=toilet,financial_status=data['financial'],health_insurance=insurance,family_needs=data['family_needs'])
                # family_data = Family.objects.get(id=family)
                # family_data.family_id = '%s / %s%s / %s' %(taluk.district.district_code,'%02d'%taluk.id,'%02d'%masjid.id,family_data.id)
                # family_data.save()
                response = 'Family Data Updated Successfully!'
            else:
                family = Family.objects.create(family_id=data['familyid'],muhalla=masjid,language=data['language'],ration_card=data['ration_card'],address=data['address'],mobile=data['mobile_no'],house_type=data['house'],toilet=toilet,financial_status=data['financial'],health_insurance=insurance,family_needs=data['family_needs'])
                # family.family_id = '%s / %s%s / %s' %(taluk.district.district_code,'%02d'%taluk.id,'%02d'%masjid.id,family.id)
                family.family_id = '%s / %s / %s' %(taluk.district.district_code,masjid.mohalla_id,family.id)
                family.save()
                response = 'Family Data Saved Successfully!'
            return HttpResponse(content=json.dumps({'data':response}),content_type='Application/json')
        except:
            print repr(format_exc())            
    else:
        family = map(lambda x:{'family_id':x.family_id,'muhalla':x.muhalla.name,'language':x.language,'taluk':x.muhalla.taluk.taluk_name,'district_name':x.muhalla.taluk.district.district_name,'ration_card':x.ration_card,'address':x.address,'mobile':x.mobile,'house_type':x.house_type,'donor':x.donor,'volunteer':x.volunteer,'health_insurance':x.health_insurance,'family_needs':x.family_needs,'toilet':x.toilet,'financial_status':x.financial_status},Family.objects.all())
        return HttpResponse(content=json.dumps({'data':family}),content_type='Application/json')

# @login_required
def fetchReportData(request):
    if request.method == 'GET':
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
        # Government Voter ID Needers
        get_memData = map(lambda x:{'familyid':x.family.family_id,'makthab':x.Makthab,'makthab_status':x.madarasa_details,'address':x.family.address,'financial_status':x.family.financial_status,'mobile':x.family.mobile,'family_head':x.name,'mem_id':x.mem_id,'gender':x.gender,'age':x.age,'marital_status':x.marital_status,'voter':x.voter_status},Member.objects.filter(muhalla=Masjid.objects.get(mohalla_id=request.GET['muhalla_id'])))
        married = sum(1 if(x['marital_status']=='Married' or x['marital_status']=='Widow' or x['marital_status']=='Devorced') else 0 for x in get_memData)
        tot_men = sum(1 if(x['gender']=='MALE') else 0 for x in get_memData)
        tot_women = sum(1 if(x['gender']=='FEMALE') else 0 for x in get_memData)
        voter = sum(1 if(x['voter']==True) else 0 for x in get_memData)
        men_age_60 = sum(1 if(x['gender']=='MALE' and eval(x['age'])>=60) else 0 for x in get_memData)
        women_age_60 = sum(1 if(x['gender']=='FEMALE' and eval(x['age'])>=60) else 0 for x in get_memData)
        men_age_22to59 = sum(1 if(x['gender']=='MALE' and 22<=eval(x['age'])<=59) else 0 for x in get_memData)
        women_age_22to59 = sum(1 if(x['gender']=='FEMALE' and 22<=eval(x['age'])<=59) else 0 for x in get_memData)
        men_age_11to21 = sum(1 if(x['gender']=='MALE' and 11<=eval(x['age'])<=21) else 0 for x in get_memData)
        women_age_11to21 = sum(1 if(x['gender']=='FEMALE' and 11<=eval(x['age'])<=21) else 0 for x in get_memData)
        child_upto11 = sum(1 if(eval(x['age'])<=10) else 0 for x in get_memData)
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
        print 'get_family',get_memData
        rep_data = {'Taluk':muhalla.taluk.taluk_name,'Taluk Count':1,'Total Family ':len(get_family),'Total Population':len(get_memData),'Total Male':tot_men,'Total Female':tot_women,'Married':married,'Male age 60+':men_age_60,'Female age 60+':women_age_60,'Male age between 22-59':men_age_22to59,'Female age between 22-59':women_age_22to59,'Male age between 11-21':men_age_11to21,'Female age between 11-21':women_age_11to21,'Child upto 11 age ':child_upto11,'A - Well Settled':cat_A,'B - Full Filled':cat_B,'C - Middle Class':cat_C,'D - Poor':cat_D,'E - Very Poor':cat_E,'Widow':widowed,'Divorced':divorced,'Mother Tongue':{'Tamil':lang_tamil,'Urdu':lang_urdu,'Others':lang_others}}
        return HttpResponse(content=json.dumps({'get_family':get_family,'get_memdata':get_memData,'reports':rep_data,'get_mem_scheme':get_mem_scheme,'get_mem_medical':get_mem_medical,'get_mem_service':get_mem_service}),content_type='Application/json')


# @login_required
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

# @login_required
def getServiceData(request):
    print 'request',request.GET['mem_id']
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

# @login_required
def FamilyMemberData(request):
    if request.method == 'POST':
        data = json.loads(request.body)['data']
        familyid = json.loads(request.body)['familyid']
        family = Family.objects.get(family_id=familyid)
        voter = True if data['voter'] == 'Yes' else False
        # family_head = True if data['family_head'] == 'Yes' else False
        if data['name'] == '':
            return HttpResponse(content=json.dumps({'data':'Please Enter Member Name!'}),content_type='Application/json')
        else:                
            if Member.objects.filter(mem_id=data['mem_id']):
                memval = Member.objects.filter(mem_id=data['mem_id']).update(family=family,muhalla=family.muhalla,name=data['name'],gender=data['gender'],age=data['age'],Relation=data['relationship'],qualification=data['qualification'],marital_status=data['marital_status'],voter_status=voter,curr_location=data['location'],occupation=data['occupation'])
                member = memval[0]
            else:
                member = Member.objects.create(mem_id=data['mem_id'],family=family,muhalla=family.muhalla,name=data['name'],gender=data['gender'],age=data['age'],Relation=data['relationship'],qualification=data['qualification'],marital_status=data['marital_status'],voter_status=voter,curr_location=data['location'],occupation=data['occupation'])
                member.mem_id= '%s / %s' %(familyid,member.id)
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
            fam_head = Member.objects.filter(family=family,mem_id=memval[0].mem_id).update(family_head=True)                     
        member = map(lambda x:{'mem_id':x.mem_id,'family':x.family.family_id,'name':x.name,'gender':x.gender,'age':x.age,'relationship':x.Relation,'qualification':x.qualification,'marital_status':x.marital_status,'voter_status':x.voter_status,'family_head':x.family_head,'curr_location':x.curr_location,'occupation':x.occupation},Member.objects.filter(family=Family.objects.get(family_id=request.GET['family_id'])))
        return HttpResponse(content=json.dumps(member),content_type='Application/json')

# @login_required        
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
            # .update(mother_tongue=data['language'],disability=physical,donor=donor,volunteer=volunteer,mobile=data['mobile'])
            donor = 'Yes' if member.donor == True else 'No'
            makthab = 'Yes' if member.Makthab == True else 'No'
            disability = 'Yes' if member.disability == True else 'No'
            quran_reading = 'Yes' if member.quran_reading == True else 'No'
            volunteer = 'Yes' if member.volunteer == True else 'No'
            alive = 'Yes' if member.alive == True else 'No' 
            return HttpResponse(content=json.dumps({'alive':alive,'quran_reading':quran_reading,'namaz':member.namaz,'makthab':makthab,'makthab_detail':member.madarasa_details,'language':member.mother_tongue,'disability':disability,'volunteer':volunteer,'mobile':member.mobile,'donor':donor,'age':member.age,'gender':member.gender}),content_type='Application/json')

# @login_required
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
        if Disease.objects.filter(disease_name=data['disease']):
            disease = Disease.objects.filter(disease_name=data['disease']).update(description=data['description'])
            return HttpResponse(content=json.dumps({'response':'Description updated!'}),content_type='Application/json')
        else:
            disease = Disease.objects.create(disease_name=data['disease'],sym_type=data['sym_type'],description=data['description'])
            return HttpResponse(content=json.dumps({'response':'Disease added Successfully!'}),content_type='Application/json')
    else:
        try:
            symptom_type = request.GET['type']
            # get_data = defaultdict(list)
            # for k in Disease.objects.filter(sym_type=symptom_type):
                # get_data[k.sym_type].append({'description':k.description,'name':k.disease_name})
            get_data = map(lambda x:{'type':x.sym_type,'name':x.disease_name,'description':x.description},Disease.objects.filter(sym_type=symptom_type))
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
            else:
                user = User.objects.create(username=data['username'])
                user.set_password(data['password'])
                user.save()
                if SensesMembers.objects.filter(user=user,member_type=data['member_type'],masjid=get_mohalla):
                    response =  'Given Data Exist!'
                else:
                    user_add = SensesMembers.objects.create(user=user,member_type=data['member_type'],masjid=get_mohalla)
                    response = 'Member Created Successfully!'
        elif data['status'] == 'edit':
            print 'data',data
            user = User.objects.get(username=data['username'])
            user.set_password(data['re_password'])
            user.save()
            # sense_member = SensesMembers.objects.filter(user=user,masjid=get_mohalla).update(member_type=data['member_type'])
            response = 'Password Updated Successfully!'
        elif data['status'] == 'delete':
            user = User.objects.filter(username=data['username'])
            sense_member = SensesMembers.objects.filter(user=user,masjid=get_mohalla,member_type=data['member_type']).delete()
            response = 'Deleted Successfully!'           
        return HttpResponse(content=json.dumps({'data':response}),content_type='Application/json')
    else:
        muhalla = Masjid.objects.get(mohalla_id=request.GET['muhalla_id'])
        sense_member = map(lambda x:{'username':x.user.username,'Member_type':x.member_type},SensesMembers.objects.filter(masjid=muhalla))
        return HttpResponse(content=json.dumps({'data':sense_member}),content_type='Application/json')
        
        