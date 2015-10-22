import os, sys
sys.path.insert(0, os.path.dirname(os.path.dirname(__file__)))
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "sensesapp.settings")
from senses.models import *
from django.core.exceptions import ObjectDoesNotExist

scheme_list_govt = [{'scheme_id':'GN01', 'scheme_name':'Old Age Pension'},{'scheme_id':'GN02', 'scheme_name':'Deserted Women Pension'},{'scheme_id':'GN03', 'scheme_name':'Marriage Help'},{'scheme_id':'GN04', 'scheme_name':'Disablity Person'},{'scheme_id':'GN05', 'scheme_name':'Widow / Aged Unmarried Women Welfare'},{'scheme_id':'GN07', 'scheme_name':'Destitute / Orphan Welfare'},{'scheme_id':'GN06', 'scheme_name':'Ulama Welfare Card'}]
scheme_list_edu = [{'scheme_id':'ED01','scheme_name':'Guidance For Higher Education & Employment'},{'scheme_id':'ED03','scheme_name':'Financial Support For Higher Education'},{'scheme_id':'ED02','scheme_name':'School Dropouts Interested In Employement'},{'scheme_id':'ED04','scheme_name':'Pre Matric Scholorship'},{'scheme_id':'ED05','scheme_name':'Post Matric Scholorship'}]
service_list = [{'service_id':'SE01','service_name':'Skill Development Guidance & Training'},{'service_id':'SE02','service_name':'Employement'},{'service_id':'SE03','service_name':'Family Councelling (Issue & Support)'},{'service_id':'SE04','service_name':'Matrimonial'},{'service_id':'SE05','service_name':'Petty Business Councelling & Finance Support'},{'service_id':'SE06','service_name':'Enterprenership Counselling'},{'service_id':'SE07','service_name':'Rehabiliation  Counseling For Addicts'},{'service_id':'SE08','service_name':'Suffering Due To Interest Base Loan'}]
other_needs = [{'service_id':'ON01','service_name':'Loan Need Without Interest'},{'service_id':'ON02','service_name':'Food Needed People List'},{'service_id':'ON03','service_name':'Needed Any Govt Aided Card'},{'service_id':'ON04','service_name':'Other Government Schemes'}]

#scheme_list
def import_scheme_list():
    for i in scheme_list_govt:
        schemetype = "Govt/ Other NGO'S Related Schemes"
        if Scheme.objects.filter(scheme_type=schemetype):
            scheme = Scheme.objects.get(scheme_type=schemetype)
        else:
            scheme = Scheme.objects.create(scheme_type=schemetype)
        if SubScheme.objects.filter(name=i['scheme_name']):
            pass
        elif SubScheme.objects.filter(subscheme_id=i['scheme_id']):
            sub_scheme = SubScheme.objects.filter(subscheme_id=i['scheme_id']).update(scheme=scheme,name=i['scheme_name'])
        else:
            subScheme = SubScheme.objects.create(scheme=scheme,subscheme_id=i['scheme_id'],name=i['scheme_name'])
    for j in scheme_list_edu:
        scheme_type = "Education / Employment Related Services"
        if Scheme.objects.filter(scheme_type=scheme_type):
            scheme = Scheme.objects.get(scheme_type=scheme_type)
        else:
            scheme = Scheme.objects.create(scheme_type=scheme_type)
        if SubScheme.objects.filter(name=j['scheme_name']):
            pass
        elif SubScheme.objects.filter(subscheme_id=j['scheme_id']):
            sub_scheme = SubScheme.objects.filter(subscheme_id=j['scheme_id']).update(scheme=scheme,name=j['scheme_name'])
        else:
            subScheme = SubScheme.objects.create(scheme=scheme,subscheme_id=j['scheme_id'],name=j['scheme_name'])
    #service list
    for k in service_list:
        if Service.objects.filter(name=k['service_name']):
            pass
        elif Service.objects.filter(service_id=k['service_id']):
            service = Service.objects.filter(service_id=k['service_id']).update(name=k['service_name'])
        else:
            service = Service.objects.create(name=k['service_name'],service_id=k['service_id'])
    for m in other_needs:
        if Service.objects.filter(name=m['service_name']):
            pass
        elif Service.objects.filter(service_id=m['service_id']):
            service = Service.objects.filter(service_id=m['service_id']).update(name=m['service_name'])
        else:
            service = Service.objects.create(name=m['service_name'],service_id=m['service_id'])        

if __name__ == "__main__":
    import_scheme_list()