# from django.db import models
import os, sys
sys.path.insert(0, os.path.dirname(os.path.dirname(__file__)))
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "sensesapp.settings")
from senses.models import *

def imp_districtData():
    print '???'
    district = [
        {"district_name":"Ariyalur",
         "district_code":"AR"
        },
        {"district_name":"Chennai",
         "district_code":"CH"
        },
        {"district_name":"Coimbatore",
         "district_code":"CO"
        },
        {"district_name":"Cuddalore",
         "district_code":"CU"
        },
        {"district_name":"Dharmapuri",
         "district_code":"DH"
        },
        {"district_name":"Dindigul",
         "district_code":"DI"
        },
        {"district_name":"Erode",
         "district_code":"ER"
        },
        {"district_name":"Kanchipuram",
         "district_code":"KC"
        },
        {"district_name":"Kanyakumari",
         "district_code":"KK"
        },
        {"district_name":"Karur",
         "district_code":"KRR"
        },
        {"district_name":"Krishnagiri",
         "district_code":"KR"
        },
        {"district_name":"Madurai",
         "district_code":"MA"
        },
        {"district_name":"Nagapattinam",
         "district_code":"NG"
        },
        {"district_name":"Namakkal",
         "district_code":"NM"
        },
        {"district_name":"The Nilgiris",
         "district_code":"NI"
        },
        {"district_name":"Perambalur",
         "district_code":"PE"
        },
        {"district_name":"Pudukkottai",
         "district_code":"PU"
        },
        {"district_name":"Ramanathapuram",
         "district_code":"RA"
        },
        {"district_name":"Salem",
         "district_code":"SA"
        },
        {"district_name":"Sivaganga",
         "district_code":"SI"
        },
        {"district_name":"Thanjavur",
         "district_code":"TJ"
        },
        {"district_name":"Theni",
         "district_code":"TH"
        },
        {"district_name":"Thoothukudi",
         "district_code":"TK"
        },
        {"district_name":"Tiruchirappalli",
         "district_code":"TC"
        },
        {"district_name":"Tirunelveli",
         "district_code":"TI"
        },
        {"district_name":"Tiruppur",
         "district_code":"TP"
        },
        {"district_name":"Tiruvallur",
         "district_code":"TL"
        },
        {"district_name":"Tiruvannamalai",
         "district_code":"TV"
        },
        {"district_name":"Tiruvarur",
         "district_code":"TR"
        },
        {"district_name":"Vellore",
         "district_code":"VE"
        },
        {"district_name":"Viluppuram",
         "district_code":"VL"
        },
        {"district_name":"Virudhunagar",
         "district_code":"VR"
        },
    ]
    print 'district',district
    for i in district:
        if District.objects.filter(district_name=i['district_name'],district_code=i['district_code']):
            continue
        elif District.objects.filter(district_name=i['district_name']):
            dis = District.objects.filter(district_name=i['district_name']).update(district_code=i['district_code'])
        elif District.objects.filter(district_code=i['district_code']):
            dis = District.objects.filter(district_code=i['district_code']).update(district_name=i['district_name'])    
        else:
            dis = District.objects.create(district_name=i['district_name'],district_code=i['district_code'])

def createdistrictuser():
    dis_list = ["Ariyalur","Chennai","Coimbatore","Cuddalore","Dharmapuri","Dindigul","Erode","Kanchipuram","Kanyakumari","Karur","Krishnagiri","Madurai","Nagapattinam","Namakkal","The Nilgiris","Perambalur","Pudukkottai","Ramanathapuram","Salem","Sivaganga","Thanjavur","Theni","Thoothukudi","Tiruchirappalli","Tirunelveli","Tiruppur","Tiruvallur","Tiruvannamalai","Tiruvarur","Vellore","Viluppuram","Virudhunagar"]
    for i in dis_list:
        password = '%s123'%i[:3]
        get_dis = District.objects.get(district_name=i)
        if not User.objects.filter(username=i):
            create_dis_user = User.objects.create(username=i,email='%s@district.com'%i,last_name=password)
            create_dis_user.set_password(password)
            create_dis_user.save()
            user_add = SensesMembers.objects.create(user=create_dis_user,member_type='District User',district=get_dis)
        else:
            get_user = User.objects.get(username=i)
            print 'yes',get_dis,get_user
            user_add = SensesMembers.objects.filter(user=get_user).update(member_type='District User',district=get_dis)
            print 'success',i
if __name__ == '__main__':
    createdistrictuser()