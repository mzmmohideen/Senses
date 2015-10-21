import os, sys
sys.path.insert(0, os.path.dirname(os.path.dirname(__file__)))
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "sensesapp.settings")
from senses.models import *
import csv,json
from collections import defaultdict
from django.core.exceptions import ObjectDoesNotExist
from datetime import datetime, time, timedelta
from traceback import format_exc
from itertools import groupby
from operator import itemgetter
from dateutil.relativedelta import relativedelta
from dateutil import parser
from django.db.models import Q

# with open('../csv/member.csv','rb') as f:
# 	reader = csv.reader(f)
# 	print 'csv',reader

def importcsvdatas():
    s = os.path.dirname(__file__)
    print 's',os.path.dirname(__file__),s
    csv_data = open('%s/csv/Census-Erode-perunthurai-201-to-295.csv'%s,'rb')    
    new_val = defaultdict(list)
    data = list(csv.reader(csv_data))
    for i in data[1:]:
    	val = i[0].split('|')
    	print 'avai',val[63]
    	exit()
    	if val[16]:
    		print 'toilet',val[16]
    	else:
    		print 'no',data[1:].index(i)

def importcsvdata():
    s = os.path.dirname(__file__)
    print 's',os.path.dirname(__file__),s
    csv_data = open('%s/csv/Census-Erode-perunthurai-201-to-295.csv'%s,'rb')    
    new_val = defaultdict(list)
    data = list(csv.reader(csv_data))
    for i in data[1:]:
    	val = i[0].split('|')
    	if val[3]:
    		data_date = datetime.strptime("09-08-2014","%d-%m-%Y")
        else:
        	data_date = datetime.now()
        try:
        	taluk = Taluk.objects.get(taluk_name=data['taluk'],district=District.objects.get(district_name=val[1]))
        except:
        	if not val[2]:
        		taluk_name = 'Perundurai'
        	else:
        		taluk_name = val[2]
        	taluk = Taluk.objects.create(taluk_name=taluk_name,district=District.objects.get(district_name=val[1]))
        if val[6]:
        	masjid = Masjid.objects.get(mohalla_id=val[6])
        else:
        	mohalla_name = val[5] if val[5] else ''
        	masjid = Masjid.objects.create(mohalla_id=val[6],taluk=taluk,name=mohalla_name,musallas='',location='')
        if val[16]:
        	toilet = True if val[16] == 'Y' else False
        else:
        	toilet = False
        if val[63]:
        	insurance = True if val[63] == 'Yes' else False
        else:
        	insurance = False
        familyid = '%s / %s / %s' %(taluk.district.district_code,masjid.mohalla_id,val[4])
        language = val[12] if val[12] else ''
        ration_card = val[13] if val[13] else ''
        if val[7] or val[8] or val[9]:
        	door = val[7] if val[7] else ''
        	street = val[8] if val[8] else ''
        	nagar = val[9] if val[9] else ''
        	fam_address = '%s,%s,%s'%(door,street,nagar)
        else:
        	fam_address = ''
        if val[14]:
        	fam_house = 'Own' if val[14] == 'O' else 'Rent'
        else:
        	fam_house = 'Rent'
        if val[17]:
        	if val[17] == 'A':
        		financial_status = 'A - Well Settled'
        	elif val[17] == 'B':
        		financial_status = 'B - Full Filled'	
        	elif val[17] == 'C':
        		financial_status = 'C - Middle Class'
        	elif val[17] == 'D':
        		financial_status = 'D - Poor'
        	elif val[17] == 'E':
        		financial_status = 'E - Very Poor'
        else:
        	financial_status = 'E - Very Poor'    	
        if Family.objects.filter(family_id=familyid):
        	family = Family.objects.get(family_id=familyid)
        else:
            family = Family.objects.create(family_id=familyid,muhalla=masjid,report_date=data_date,language=language,ration_card=ration_card,address=fam_address,mobile=val[10],house_type=fam_house,toilet=toilet,house_cat=val[15],financial_status=financial_status,health_insurance=insurance,family_needs='')
    	# member add
    	member_id = '%s / %s' %(family.family_id,val[18])
    	dob_date = data_date - relativedelta(years=eval(val[21])) if val[21] else data_date
    	mem_age = str(datetime.now().year-dob_date.year)
    	if val[20]:
    		gender = 'MALE' if val[20] == 'M' else 'FEMALE'
    	else:
    		gender = 'MALE'
    	if Member.objects.filter(mem_id=member_id):
    		# memval = Member.objects.filter(mem_id=member_id).update(family=family,dateofbirth=dob_date,muhalla=family.muhalla,name=val[19],gender=gender,age=mem_age,Relation=val[22],qualification=val[25]
            memval = Member.objects.filter(mem_id=member_id).update(family=family,dateofbirth=dob_date,muhalla=family.muhalla,name=val[19],gender=gender,age=mem_age,Relation=val[22],qualification=val[25],marital_status=data['marital_status'],voter_status=voter,curr_location=data['location'],occupation=data['occupation'])
            member = memval[0]
        else:
            member = Member.objects.create(mem_id=member_id,family=family,dateofbirth=dob_date,muhalla=family.muhalla,name=data['name'],gender=data['gender'],age=age,Relation=data['relationship'],qualification=data['qualification'],marital_status=data['marital_status'],voter_status=voter,curr_location=data['location'],occupation=data['occupation'])
            try:
                fam_mem_id = '%s / %s' %(familyid,str(len(Member_scheme.objects.filter(family=family)) + 1))
            except:
                fam_mem_id = '%s / %s' %(familyid,member.id)
            member.mem_id = fam_mem_id
            member.save()
    print 'new_val',new_val	

if __name__ == "__main__":
    importcsvdatas()
