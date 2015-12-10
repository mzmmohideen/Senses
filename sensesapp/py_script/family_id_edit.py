import os, sys
sys.path.insert(0, os.path.dirname(os.path.dirname(__file__)))
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "sensesapp.settings")
from senses.models import *
from django.core.exceptions import ObjectDoesNotExist
from traceback import format_exc

def edit_family_id():
    for i in Family.objects.all():
        try:
            if i.family_id == 'ER / 0001 / 59':
                print 'got',i.family_id
                exit()
            if len(i.family_id.split('/')[2]) != 4:
            	print '59',i.family_id
            	fam_id = i.family_id.replace(i.family_id.split('/')[2], '%s%s'%(' ','%03d'%eval(i.family_id.split('/')[2])))
            	i.family_id = fam_id
            	i.save()
            	print 'fam_id_final',i.family_id
            else:
            	print 'fam_id',fam_id
            # fam_id.save()
        except:
        	pass
            # print 'id',i.family_id
            # print 'error',repr(format_exc())
            

if __name__ == "__main__":
    edit_family_id()