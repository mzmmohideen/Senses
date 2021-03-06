import os, sys
sys.path.insert(0, os.path.dirname(os.path.dirname(__file__)))
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "sensesapp.settings")
from senses.models import *
import csv,json,xlrd
import re
from os import listdir
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
#      reader = csv.reader(f)
#      print 'csv',reader

def importcsvdatas():
     s = os.path.dirname(__file__)
     print 's',os.path.dirname(__file__),s
     csv_data = open('%s/csv/census-thangachimadam-301-389.csv'%s,'rb')     
     new_val = defaultdict(list)
     data = list(csv.reader(csv_data))
     print 'data',data[1][0].split('|')[1]
     for i in data[1:]:
          val = i[0].split('|')
          print 'avai',val[3],datetime.strptime("10/02/2015","%d/%m/%Y")
          family_head = True if val[18] == '1' else False
          print 'family_head',family_head,val[18]
          exit()
          if val[16]:
                print 'toilet',val[16]
          else:
                print 'no',data[1:].index(i)

def find_csv_filenames( path_to_dir, suffix=".csv" ):
    filenames = listdir(path_to_dir)
    return [ filename for filename in filenames if filename.endswith( suffix ) ]

def monthdelta(date, delta):
    m, y = (date.month-delta) % 12, date.year + ((date.month)-delta-1) // 12
    if not m: m = 12
    d = min(date.day, [31,
        29 if y%4==0 and not y%400==0 else 28,31,30,31,30,31,31,30,31,30,31][m-1])
    return date.replace(day=d,month=m, year=y)    

def importcsvdata(value):
     s = os.path.dirname(__file__)
     if value == 'upload':
      filenames = find_csv_filenames('%s/csv/'%s)
     else:
      filenames = [value]
     print 'value',filenames[0],type(filenames[0])
     # exit()       
     for name in filenames:
       # print 'filename',name,type(name)
       # exit()
       # scraped_csv = open('%s/productscrapper/%s'%(s,name))
       # csv_data = open('%s/csv/%s'%(s,name),'rb')
       if str(name).lower().endswith(('.xls','xlsx')):
        data = []
        wb = xlrd.open_workbook(filename=None,file_contents=name.read())
        sh = wb.sheet_by_name('Sheet1')
        for i in xrange(sh.nrows):
          data.append(sh.row_values(i))
        maxLenObj = max(map(len,data))
       elif str(name).lower().endswith(('.csv','csvx')) and value == 'upload':
        csv_data = open('%s/csv/%s'%(s,name))
        a = list(csv.reader(csv_data))
        data = [i[0].split('|') for i in a[1:]]
        maxLenObj = max(map(len,data))
       elif str(name).lower().endswith(('.csv','csvx')):
        # csv_data = open('%s'%name)
        a = list(csv.reader(name))
        data = [i[0].split('|') for i in a[1:]]
        maxLenObj = max(map(len,data)) 
       else:
        return 'Please upload only Valid Files! these extensions only (.csv,csvx,.xls,.xlsx) Accepted!'        
       for i in data[1:]:
            try:
                val = i
                # val = i[0].split('|')
                if len(val) < maxLenObj:
                  val = val + ['']*(maxLenObj-len(val))
                try:
                  if val[3]:
                    if len(val[3].split('/')[2]) == 2:
                      curr_date = '%s/%s/20%s'%(val[3].split('/')[0],val[3].split('/')[1],val[3].split('/')[2])
                      data_date = datetime.strptime(curr_date,"%d/%m/%Y")
                    else:
                      data_date = datetime.strptime(val[3],"%d/%m/%Y")
                      
                  else:
                        data_date = datetime.now()
                except:
                  data_date = datetime.now()
                district_val = data[1][1].capitalize() if val[1] else data[1][1].capitalize()
                taluk_name = data[1][2].capitalize() if val[2] else data[1][2].capitalize()
                if district_val == 'Ramnad':
                  district_val = 'Ramanathapuram'                  
                district_value = District.objects.get(district_name=district_val)  
                if Taluk.objects.filter(taluk_name=taluk_name,district=district_value):                
                      taluk = Taluk.objects.get(taluk_name=taluk_name,district=district_value)
                else:
                      taluk = Taluk.objects.create(taluk_name=taluk_name,district=district_value)
                if not val[6]:
                  muhalla_dis = len(Masjid.objects.filter(district=district_value))
                  muhalla_dis_val = '%04d'%(muhalla_dis+1) if muhalla_dis<9999 else (muhalla_dis+1)
                  csv_mohalla_id = '%s / %s'%(district_value.district_code,muhalla_dis_val)
                else:
                  csv_mohalla_id = val[6]
                mohalla_location = val[9] if val[9] else ''
                mohalla_name = data[1][5] if data[1][5] else data[1][9]  
                # mohalla_name = val[5] if val[5] else mohalla_location
                if Masjid.objects.filter(taluk=taluk,name=mohalla_name):
                      # muhalla_update = Masjid.objects.filter(taluk=taluk,name=mohalla_name).update(mohalla_id=csv_mohalla_id,taluk=taluk,district=district_value,musallas='',location=mohalla_location)
                      muhalla_update = Masjid.objects.filter(taluk=taluk,name=mohalla_name).update(taluk=taluk,district=district_value,musallas='',location=mohalla_location)
                      masjid = Masjid.objects.get(taluk=taluk,name=mohalla_name)
                      print 'muhalla updated'
                elif Masjid.objects.filter(mohalla_id=csv_mohalla_id):
                      pass      
                else:
                      masjid = Masjid.objects.create(mohalla_id=csv_mohalla_id,taluk=taluk,district=district_value,name=mohalla_name,musallas='',location=mohalla_location)
                # toilet = True if val[16] == 'Y' else False
                if val[16]:
                  if val[16] == 'Y':
                    toilet = True
                  else:
                    toilet = False
                else:
                  toilet = True                 
                if val[63]:
                      insurance = True if val[63] == 'Yes' else False
                else:
                      insurance = False
                if val[62]:
                      donor = True if val[62] == 'Yes' else False
                else:
                      donor = False
                if val[64]:
                      volunteer = True if val[64] == 'Yes' else False
                else:
                      volunteer = False
                family_needs = val[69] if val[69] else ''
                familyid = '%s / %s' %(masjid.mohalla_id,'%03d'%(int(val[4])))
                language = val[12] if val[12] else ''
                # ration_card = val[13] if val[13] else ''
                if val[13]:
                  if val[13] == 'N' or val[13] == 'NO' or val[13] == 'No':
                    ration_card = ''
                  else:
                    ration_card = val[13]
                else:
                  ration_card = ''                    
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
                      financial_status = 'C - Middle Class'
                if val[15]:
                  house_cat = '' if val[15] == '-' else val[15]
                else:
                  house_cat = ''
                # mobile_no = val[10] if len(val[10]) else val[10][:10]
                try:
                  mobile_no = int(val[10]) if val[10] else 0
                except:
                  try:
                    mobile_no = int(val[10][:10])
                  except:
                    try:
                      mobile_no = int(val[10].split('/')[0])
                    except:
                      mobile_no = 0                   
                if Family.objects.filter(family_id=familyid):
                      family_update = Family.objects.filter(family_id=familyid).update(muhalla=masjid,report_date=data_date,language=language,ration_card=ration_card,address=fam_address,mobile=mobile_no,house_type=fam_house,toilet=toilet,house_cat=house_cat,financial_status=financial_status,health_insurance=insurance,volunteer=volunteer,donor=donor,family_needs=family_needs)
                      family = Family.objects.get(family_id=familyid)
                else:
                      family = Family.objects.create(family_id=familyid,muhalla=masjid,report_date=data_date,language=language,ration_card=ration_card,address=fam_address,mobile=mobile_no,house_type=fam_house,toilet=toilet,house_cat=house_cat,financial_status=financial_status,health_insurance=insurance,volunteer=volunteer,donor=donor,family_needs=family_needs)
                # member add
                if val[18]:
                  mem_val = int(val[18])
                else:
                  mem_val = 1             
                member_id = '%s / %s' %(family.family_id,int(mem_val))
                if val[21]:
                  try:
                    if 'M' in str(val[21]) or 'm' in str(val[21]):
                      age_val = str(val[21]).split('M')[0]
                      dob_date = monthdelta(data_date,int(age_val))
                    else:
                      age_val = int(val[21])
                      dob_date = data_date - relativedelta(years=age_val)
                  except:
                    dob_date = data_date - relativedelta(years=0)                      
                else:
                  dob_date = data_date - relativedelta(years=0)
                # try:
                #   print 'float',val[21]
                #   if 'M' in val[21]:
                #     print '1'
                #     dob_date = monthdelta(data_date,int(val[21].split('M')[0]))
                #   else:
                #     print '2'
                #     dob_date = data_date - relativedelta(years=int(val[21])) if val[21] else data_date
                # except:
                #   try:
                #     print '3'
                #     dob_date = data_date - relativedelta(years=int(val[21].split(' ')[0]))
                #   except:
                #     try:
                #       print '4'
                #       dob_date = data_date - relativedelta(years=int(val[21][:1]))
                #     except:
                #       print '5'
                #       dob_date = data_date - relativedelta(years=0)                      
                mem_age = int(datetime.now().year-dob_date.year)
                if mem_age == 0:
                  mem_age_month = int(datetime.now().month-dob_date.month)
                else:
                  mem_age_month = 0
                print 'line val',val[21],data[1:].index(val)
                print 'val',val[21],dob_date,mem_age,mem_age_month
                # exit()  
                if val[23]:
                      if val[23] == 'M':
                           marital_status = 'Married'
                      elif val[23] == 'W':
                           marital_status = 'Widow'
                      elif val[23] == 'D':
                           marital_status = 'Devorced'
                      elif val[23] == 'S' and mem_age < 30:
                           marital_status = 'Single'     
                      elif val[23] == 'S' and mem_age >= 30 and gender == 'FEMALE':
                           marital_status = 'Aged Unmarried Woman'
                      else:
                           marital_status = 'Unknown'
                else:
                      marital_status = 'Unknown'
                if val[20]:
                  if val[20] == 'M':
                    gender = 'MALE'
                  elif val[20] == 'F':
                    gender = 'FEMALE'
                  else:
                    gender = 'FEMALE'
                else:
                  gender = 'MALE'
                if val[24]:
                      voterstatus = True if val[24] == 'Y' else False
                else:
                      voterstatus = False
                relation = val[22] if val[22] else ''
                qualify = val[25] if val[25] else ''
                try:
                  qualification = int(qualify)
                except:
                  qualification = qualify                  
                if val[27]:
                      if val[27] == 'L':
                           location = 'Local'
                      elif val[27] == 'F':
                           location = 'Foreign'
                      elif val[27] == 'O':
                           location = 'Outstation'
                      else:
                           location = 'Local'
                else:
                      location = 'Local'
                occupation = val[26] if val[26] else ''
                if val[29] == 'Y':
                   madarasa_details = 'Interest in Niswan'
                   makhtab = True
                else:
                   madarasa_details = ''
                   makhtab = False
                if val[30] == 'Y':
                   madarasa_details = 'Interest in 1yr Muallim'
                   makhtab = True
                else:
                   madarasa_details = ''
                   makhtab = False
                if val[31] == 'Y' or val[32] == 'Y':
                   madarasa_details = 'Interest in Aalim/Hifz'
                   makhtab = True
                else:
                   madarasa_details = ''
                   makhtab = False
                family_head = True if mem_val == 1 else False
                if Member.objects.filter(mem_id=member_id,family=family):
                      memval = Member.objects.filter(mem_id=member_id,family=family).update(family_head=family_head,dateofbirth=dob_date,muhalla=family.muhalla,taluk=taluk,district=district_value,name=val[19],gender=gender,age=mem_age,mem_age_month=mem_age_month,Relation=relation,qualification=qualification,marital_status=marital_status,voter_status=voterstatus,curr_location=location,occupation=occupation,Makthab=makhtab,madarasa_details=madarasa_details)
                      member = Member.objects.get(mem_id=member_id,family=family)
                else:
                      member = Member.objects.create(mem_id=member_id,family=family,family_head=family_head,dateofbirth=dob_date,muhalla=family.muhalla,taluk=taluk,district=district_value,name=val[19],gender=gender,age=mem_age,mem_age_month=mem_age_month,Relation=relation,qualification=qualification,marital_status=marital_status,voter_status=voterstatus,curr_location=location,occupation=occupation,Makthab=makhtab,madarasa_details=madarasa_details)
                
                old_age = True if val[33] == 'Y' else False
                if old_age:
                  if Member_scheme.objects.filter(member=member,scheme=SubScheme.objects.get(name='Old Age Pension')):
                      mem_scheme = Member_scheme.objects.filter(member=member,scheme=SubScheme.objects.get(name='Old Age Pension')).update(status=True,solution="Not Yet")
                  else:
                      mem_scheme = Member_scheme.objects.create(member=member,scheme=SubScheme.objects.get(name='Old Age Pension'),status=True,solution="Not Yet")
       
                deserted_women = True if val[34] == 'Y' else False
                if deserted_women:
                  if Member_scheme.objects.filter(member=member,scheme=SubScheme.objects.get(name='Deserted Women Pension')):
                      mem_scheme = Member_scheme.objects.filter(member=member,scheme=SubScheme.objects.get(name='Deserted Women Pension')).update(status=True,solution="Not Yet")
                  else:
                      mem_scheme = Member_scheme.objects.create(member=member,scheme=SubScheme.objects.get(name='Deserted Women Pension'),status=True,solution="Not Yet")
       
                marriage_help = True if val[35] == 'Y' else False
                if marriage_help:
                  if Member_scheme.objects.filter(member=member,scheme=SubScheme.objects.get(name='Marriage Help')):
                      mem_scheme = Member_scheme.objects.filter(member=member,scheme=SubScheme.objects.get(name='Marriage Help')).update(status=True,solution="Not Yet")
                  else:
                      mem_scheme = Member_scheme.objects.create(member=member,scheme=SubScheme.objects.get(name='Marriage Help'),status=True,solution="Not Yet")

                disability = True if val[36] == 'Y' else False
                if disability:
                  if Member_scheme.objects.filter(member=member,scheme=SubScheme.objects.get(name='Disablity Person')):
                      mem_scheme = Member_scheme.objects.filter(member=member,scheme=SubScheme.objects.get(name='Disablity Person')).update(status=True,solution="Not Yet")
                  else:
                      mem_scheme = Member_scheme.objects.create(member=member,scheme=SubScheme.objects.get(name='Disablity Person'),status=True,solution="Not Yet")
       
                widow_aged = True if val[37] == 'Y' else False
                if widow_aged:
                  if Member_scheme.objects.filter(member=member,scheme=SubScheme.objects.get(name='Widow / Aged Unmarried Women Welfare')):
                      mem_scheme = Member_scheme.objects.filter(member=member,scheme=SubScheme.objects.get(name='Widow / Aged Unmarried Women Welfare')).update(status=True,solution="Not Yet")
                  else:
                      mem_scheme = Member_scheme.objects.create(member=member,scheme=SubScheme.objects.get(name='Widow / Aged Unmarried Women Welfare'),status=True,solution="Not Yet")

                orphan_destitute = True if val[38] == 'Y' else False
                if orphan_destitute:
                  if Member_scheme.objects.filter(member=member,scheme=SubScheme.objects.get(name='Destitute / Orphan Welfare')):
                      mem_scheme = Member_scheme.objects.filter(member=member,scheme=SubScheme.objects.get(name='Destitute / Orphan Welfare')).update(status=True,solution="Not Yet")
                  else:
                      mem_scheme = Member_scheme.objects.create(member=member,scheme=SubScheme.objects.get(name='Destitute / Orphan Welfare'),status=True,solution="Not Yet") 
               
                ulama_welfare = True if val[39] == 'Y' else False
                if ulama_welfare:
                  if Member_scheme.objects.filter(member=member,scheme=SubScheme.objects.get(name='Ulama Welfare Card')):
                      mem_scheme = Member_scheme.objects.filter(member=member,scheme=SubScheme.objects.get(name='Ulama Welfare Card')).update(status=True,solution="Not Yet")
                  else:
                      mem_scheme = Member_scheme.objects.create(member=member,scheme=SubScheme.objects.get(name='Ulama Welfare Card'),status=True,solution="Not Yet")
                 
                higher_guidance = True if val[40] == 'Y' else False
                if higher_guidance:
                  if Member_scheme.objects.filter(member=member,scheme=SubScheme.objects.get(name='Guidance For Higher Education & Employment')):
                      mem_scheme = Member_scheme.objects.filter(member=member,scheme=SubScheme.objects.get(name='Guidance For Higher Education & Employment')).update(status=True,solution="Not Yet")
                  else:
                      mem_scheme = Member_scheme.objects.create(member=member,scheme=SubScheme.objects.get(name='Guidance For Higher Education & Employment'),status=True,solution="Not Yet")
       
                financialforhigher = True if val[41] == 'Y' else False
                if financialforhigher:
                  if Member_scheme.objects.filter(member=member,scheme=SubScheme.objects.get(name='Financial Support For Higher Education')):
                      mem_scheme = Member_scheme.objects.filter(member=member,scheme=SubScheme.objects.get(name='Financial Support For Higher Education')).update(status=True,solution="Not Yet")
                  else:
                      mem_scheme = Member_scheme.objects.create(member=member,scheme=SubScheme.objects.get(name='Financial Support For Higher Education'),status=True,solution="Not Yet")
                 
                schooldropout = True if val[42] == 'Y' else False
                if schooldropout:
                  if Member_scheme.objects.filter(member=member,scheme=SubScheme.objects.get(name='School Dropouts Interested In Employement')):
                      mem_scheme = Member_scheme.objects.filter(member=member,scheme=SubScheme.objects.get(name='School Dropouts Interested In Employement')).update(status=True,solution="Not Yet")
                  else:
                      mem_scheme = Member_scheme.objects.create(member=member,scheme=SubScheme.objects.get(name='School Dropouts Interested In Employement'),status=True,solution="Not Yet")
       
                prematric = True if val[43] == 'Y' else False
                if prematric:
                  if Member_scheme.objects.filter(member=member,scheme=SubScheme.objects.get(name='Pre Matric Scholorship')):
                      mem_scheme = Member_scheme.objects.filter(member=member,scheme=SubScheme.objects.get(name='Pre Matric Scholorship')).update(status=True,solution="Not Yet")
                  else:
                      mem_scheme = Member_scheme.objects.create(member=member,scheme=SubScheme.objects.get(name='Pre Matric Scholorship'),status=True,solution="Not Yet")
       
                postmatric = True if val[44] == 'Y' else False
                if postmatric:
                  if Member_scheme.objects.filter(member=member,scheme=SubScheme.objects.get(name='Post Matric Scholorship')):
                      mem_scheme = Member_scheme.objects.filter(member=member,scheme=SubScheme.objects.get(name='Post Matric Scholorship')).update(status=True,solution="Not Yet")
                  else:
                      mem_scheme = Member_scheme.objects.create(member=member,scheme=SubScheme.objects.get(name='Post Matric Scholorship'),status=True,solution="Not Yet")

                skilldev = True if val[45] == 'Y' else False
                if skilldev:
                  if Member_service.objects.filter(member=member,scheme=Service.objects.get(name='Skill Development Guidance & Training')):
                      mem_service = Member_service.objects.filter(member=member,scheme=Service.objects.get(name='Skill Development Guidance & Training')).update(status=True,solution="Not Yet")
                  else:
                      mem_service = Member_service.objects.create(member=member,scheme=Service.objects.get(name='Skill Development Guidance & Training'),status=True,solution="Not Yet")
       
                employment = True if val[46] == 'Y' else False
                if employment:
                  if Member_service.objects.filter(member=member,scheme=Service.objects.get(name='Employement')):
                      mem_service = Member_service.objects.filter(member=member,scheme=Service.objects.get(name='Employement')).update(status=True,solution="Not Yet")
                  else:
                      mem_service = Member_service.objects.create(member=member,scheme=Service.objects.get(name='Employement'),status=True,solution="Not Yet")
       
                fam_coun = True if val[47] == 'Y' else False
                if fam_coun:
                  if Member_service.objects.filter(member=member,scheme=Service.objects.get(name='Family Councelling (Issue & Support)')):
                      mem_service = Member_service.objects.filter(member=member,scheme=Service.objects.get(name='Family Councelling (Issue & Support)')).update(status=True,solution="Not Yet")
                  else:
                      mem_service = Member_service.objects.create(member=member,scheme=Service.objects.get(name='Family Councelling (Issue & Support)'),status=True,solution="Not Yet")
       
                matrimony = True if val[48] == 'Y' else False
                if matrimony:
                  if Member_service.objects.filter(member=member,scheme=Service.objects.get(name='Matrimonial')):
                      mem_service = Member_service.objects.filter(member=member,scheme=Service.objects.get(name='Matrimonial')).update(status=True,solution="Not Yet")
                  else:
                      mem_service = Member_service.objects.create(member=member,scheme=Service.objects.get(name='Matrimonial'),status=True,solution="Not Yet")
       
                buss_coun = True if val[49] == 'Y' else False
                if buss_coun:
                  if Member_service.objects.filter(member=member,scheme=Service.objects.get(name='Petty Business Councelling & Finance Support')):
                      mem_service = Member_service.objects.filter(member=member,scheme=Service.objects.get(name='Petty Business Councelling & Finance Support')).update(status=True,solution="Not Yet")
                  else:
                      mem_service = Member_service.objects.create(member=member,scheme=Service.objects.get(name='Petty Business Councelling & Finance Support'),status=True,solution="Not Yet")
       
                enterpren_coun = True if val[50] == 'Y' else False
                if enterpren_coun:
                  if Member_service.objects.filter(member=member,scheme=Service.objects.get(name='Enterprenership Counselling')):
                      mem_service = Member_service.objects.filter(member=member,scheme=Service.objects.get(name='Enterprenership Counselling')).update(status=True,solution="Not Yet")
                  else:
                      mem_service = Member_service.objects.create(member=member,scheme=Service.objects.get(name='Enterprenership Counselling'),status=True,solution="Not Yet")
       
                rehab_coun = True if val[51] == 'Y' else False
                if rehab_coun:
                  if Member_service.objects.filter(member=member,scheme=Service.objects.get(name='Rehabiliation  Counseling For Addicts')):
                      mem_service = Member_service.objects.filter(member=member,scheme=Service.objects.get(name='Rehabiliation  Counseling For Addicts')).update(status=True,solution="Not Yet")
                  else:
                      mem_service = Member_service.objects.create(member=member,scheme=Service.objects.get(name='Rehabiliation  Counseling For Addicts'),status=True,solution="Not Yet")
       
                suffer_interest = True if val[52] == 'Y' else False
                if suffer_interest:
                  if Member_service.objects.filter(member=member,scheme=Service.objects.get(name='Suffering Due To Interest Base Loan')):
                      mem_service = Member_service.objects.filter(member=member,scheme=Service.objects.get(name='Suffering Due To Interest Base Loan')).update(status=True,solution="Not Yet")
                  else:
                      mem_service = Member_service.objects.create(member=member,scheme=Service.objects.get(name='Suffering Due To Interest Base Loan'),status=True,solution="Not Yet")
                try:
                  disease_id = val[53] if val[53] else ''
                except:
                  disease_id = 'HL01'                  
                if disease_id:
                  try:
                    disease_list = []
                    # disease_id_list = disease_id.split(',')
                    disease_id_list = re.split(r'[ &/,]+',disease_id)
                    for i in disease_id_list:
                      if Disease.objects.filter(disease_id=i):
                        get_disease = Disease.objects.get(disease_id=i)
                      else:
                        disease_name = 'Disease %s'%i
                        try:
                          get_disease = Disease.objects.get(disease_name=disease_name)
                        except:
                          get_disease = Disease.objects.create(sym_type='DISEASE',disease_name=disease_name,disease_id=i)
                      disease_list.append(get_disease)    
                  except:
                    disease_list = []
                    try:
                      get_disease = Disease.objects.get(disease_id=disease_id)
                    except:
                      disease_name = disease_id[:50]
                      disease_id = 'HL%s'%str(len(disease_id))
                      if Disease.objects.filter(disease_name=disease_name):
                        get_disease = Disease.objects.get(disease_name=disease_name)
                      elif Disease.objects.filter(disease_id=disease_id):
                        get_disease = Disease.objects.get(disease_id=disease_id)
                      else:
                        get_disease = Disease.objects.create(sym_type='DISEASE',disease_name=disease_name,disease_id=disease_id)
                    disease_list.append(get_disease)        
                  medicine = val[54] if val[54] else ''
                  medicine_cost = val[55] if val[55] else '' 
                  med_monthly_expend = val[56] if val[56] else ''
                  for dis_val in disease_list:
                    if Medical.objects.filter(member=member,disease=dis_val):
                      add_medical_needs = Medical.objects.filter(member=member,disease=dis_val).update(medicine_needs=medicine,cost=medicine_cost,monthly_expend=med_monthly_expend)
                    else:
                      add_medical_needs = Medical.objects.create(member=member,disease=dis_val,medicine_needs=medicine,cost=medicine_cost,monthly_expend=med_monthly_expend)
                    surg_hospital = val[57] if val[57] else ''    
                    surg_name = val[58] if val[58] else ''
                    surg_cost = val[59] if val[59] else ''
                    surg_cashinhand = val[60] if val[60] else ''
                    if surg_hospital or surg_name or surg_cost or surg_cashinhand:
                      try:
                        if surg_name:
                          surgery_name = surg_name
                        elif len(disease_list) > 0:
                          surgery_name = disease_list[0]
                        else:
                          surgery_name = ''
                        get_dis_val = Disease.objects.get(disease_name=surgery_name)
                      except:
                        surgery_name = Disease.objects.all()
                        get_dis_val = surgery_name[0]  
                      if Surgery.objects.filter(member=member,disease=get_dis_val):
                        add_surgery_needs = Surgery.objects.filter(member=member,disease=get_dis_val).update(surgery_name=surg_name,hospital_name=surg_hospital,cost=surg_cost,cash_inHand=surg_cashinhand)
                      else:
                        add_surgery_needs = Surgery.objects.create(member=member,disease=get_dis_val,surgery_name=surg_name,hospital_name=surg_hospital,cost=surg_cost,cash_inHand=surg_cashinhand)
                    chronic_disease_details = val[61] if val[61] else ''
                    if chronic_disease_details:
                      if ChronicDisease.objects.filter(member=member,disease_name=dis_val):
                        add_chronic_needs = ChronicDisease.objects.filter(member=member,disease_name=dis_val).update(details=chronic_disease_details,status=True)
                      else:
                        add_chronic_needs = ChronicDisease.objects.create(member=member,disease_name=dis_val,details=chronic_disease_details,status=True)
                else:
                  pass
                loan_needers = True if val[65] == 'Y' else False
                if loan_needers:
                  if Member_service.objects.filter(member=member,scheme=Service.objects.get(name='Loan Need Without Interest')):
                      mem_service = Member_service.objects.filter(member=member,scheme=Service.objects.get(name='Loan Need Without Interest')).update(status=True,solution="Not Yet")
                  else:
                      mem_service = Member_service.objects.create(member=member,scheme=Service.objects.get(name='Loan Need Without Interest'),status=True,solution="Not Yet")

                food_needers = True if val[66] == 'Y' else False
                if food_needers:
                  if Member_service.objects.filter(member=member,scheme=Service.objects.get(name='Food Needed People List')):
                      mem_service = Member_service.objects.filter(member=member,scheme=Service.objects.get(name='Food Needed People List')).update(status=True,solution="Not Yet")
                  else:
                      mem_service = Member_service.objects.create(member=member,scheme=Service.objects.get(name='Food Needed People List'),status=True,solution="Not Yet")

                govt_card_needers = True if val[67] == 'Y' else False
                if govt_card_needers:
                  if Member_service.objects.filter(member=member,scheme=Service.objects.get(name='Needed Any Govt Aided Card')):
                      mem_service = Member_service.objects.filter(member=member,scheme=Service.objects.get(name='Needed Any Govt Aided Card')).update(status=True,solution="Not Yet")
                  else:
                      mem_service = Member_service.objects.create(member=member,scheme=Service.objects.get(name='Needed Any Govt Aided Card'),status=True,solution="Not Yet")

                other_govt_scheme = True if val[68] == 'Y' else False
                if other_govt_scheme:
                  if Member_service.objects.filter(member=member,scheme=Service.objects.get(name='Other Government Schemes')):
                      mem_service = Member_service.objects.filter(member=member,scheme=Service.objects.get(name='Other Government Schemes')).update(status=True,solution="Not Yet")
                  else:
                      mem_service = Member_service.objects.create(member=member,scheme=Service.objects.get(name='Other Government Schemes'),status=True,solution="Not Yet")
            except:
              print 'report',repr(format_exc())
              return 'Error in Row number: ',data.index(i),'Error:',repr(format_exc())
              # return repr(format_exc())
              # exit()


if __name__ == "__main__":
     importcsvdata('upload')