import os, sys
sys.path.insert(0, os.path.dirname(os.path.dirname(__file__)))
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "sensesapp.settings")
from senses.models import *
from django.core.exceptions import ObjectDoesNotExist
from traceback import format_exc

def edit_family_id():
    # for i in Family.objects.all():
    #     try:
    #         if i.family_id == 'ER / 0001 / 59':
    #             print 'got',i.family_id
    #             exit()
    #         if len(i.family_id.split('/')[2]) != 4:
    #         	print '59',i.family_id
    #         	fam_id = i.family_id.replace(i.family_id.split('/')[2], '%s%s'%(' ','%03d'%eval(i.family_id.split('/')[2])))
    #         	i.family_id = fam_id
    #         	i.save()
    #         	print 'fam_id_final',i.family_id
    #         else:
    #         	print 'fam_id',fam_id
    #         # fam_id.save()
    #     except:
    #     	pass
    #         # print 'id',i.family_id
    #         # print 'error',repr(format_exc())
    for i in Member.objects.all():
        try:
            if len(i.mem_id.split('/')[2]) != 4:
                print '59',i.mem_id
                fam_id = i.mem_id.replace(i.mem_id.split('/')[2], '%s%s%s'%(' ','%03d'%eval(i.mem_id.split('/')[2]),' '))
                i.mem_id = fam_id
                i.save()
                print 'fam_id_final',i.mem_id
            else:
                print 'fam_id',fam_id
            # fam_id.save()
        except:
            pass        
    for i in Member.objects.all():
        try:
            if i.Relation=='Family Head':
                i.family_head = True
                i.save()
            elif eval(i.mem_id.split('/')[3]) == 1:
                i.family_head = True
                i.save()
            else:
                pass
        except:
            print 'value',i.mem_id,i.name
            print 'repr',repr(format_exc())
                

if __name__ == "__main__":
    edit_family_id()