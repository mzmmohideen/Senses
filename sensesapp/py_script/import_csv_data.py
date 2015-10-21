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
from django.db.models import Q

# with open('../csv/member.csv','rb') as f:
# 	reader = csv.reader(f)
# 	print 'csv',reader

def importcsvdata():
    s = os.path.dirname(__file__)
    print 's',os.path.dirname(__file__),s
    csv_data = open('%s/csv/member.csv'%s,'rb')    
    new_val = defaultdict(list)
    data = list(csv.reader(csv_data))
    for i in data:
    	val = i[0].split('|')
    	if val[4]:
    		new_val[val[4]] = val
    print 'new_val',new_val	

if __name__ == "__main__":
    importcsvdata()
