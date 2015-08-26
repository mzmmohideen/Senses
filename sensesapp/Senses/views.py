from django.shortcuts import render_to_response, HttpResponse, render
from Senses.models import *
from django.contrib.auth.models import User
from django.core.context_processors import csrf
from django.views.decorators.csrf import *
import json,csv
from django.contrib.auth.decorators import login_required
from collections import defaultdict
from django.core.exceptions import ObjectDoesNotExist
from datetime import datetime, time
from traceback import format_exc
from itertools import groupby
from operator import itemgetter

def login(request):
    # if Staff.objects.filter(role="Admin"):
    return render(request, 'login.html')
    # else:
        # return render(request, 'signup.html')