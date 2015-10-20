from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User

GENDER = (('MALE','MALE'), ('FEMALE','FEMALE'))
STATUS = (('Own', 'Own'), ('Rent', 'Rent'))
FINANCIAL = (('A - Well Settled', 'A - Well Settled'), ('B - Full Filled', 'B - Full Filled'), ('C - Middle Class', 'C - Middle Class'), ('D - Poor', 'D - Poor'), ('E - Very Poor', 'E - Very Poor'))
MARITAL = (('Married','Married'), ('Unmarried','Unmarried'), ('Widow','Widow'),('Devorced','Devorced'),('Aged Unmarried Woman','Aged Unmarried Woman'))
LOCATION = (('Local','Local'), ('Outstation','Outstation'), ('Foreign','Foreign'))
MADARASA = (('Boys For Makthab 4-15','Boys For Makthab 4-15'), ('Girls For Makthab 4-15','Girls For Makthab 4-15'), ('Adult Makthab','Adult Makthab'), ('Interest in Aalim/Hifz','Interest in Aalim/Hifz'), ('Interest in Niswan','Interest in Niswan'), ('Interest in 1yr Muallim','Interest in 1yr Muallim'), ('Jumrah Madarasa for Boys','Jumrah Madarasa for Boys'))
SYMPTOMTYPE = (('DISEASE','DISEASE'),('DISORDER','DISORDER'))
NAMAS = (('5 Times a day','5 Times a day'),('only Jumah','only Jumah'),('Not at All','Not at All'))
SOLUTION = (('Solved','Solved'),('Not Yet','Not Yet'))
NEWMEMTYPE = (('Mohalla User','Mohalla User'),('End Users & Donors','End Users & Donors'))

class District(models.Model):
    district_name = models.CharField(max_length=50,unique=True)
    district_code = models.CharField(max_length=10,unique=True)

class Taluk(models.Model):
    district = models.ForeignKey(District)
    taluk_name = models.CharField(max_length=30)

class Masjid(models.Model):
    taluk = models.ForeignKey(Taluk)
    mohalla_id = models.CharField(max_length=20,unique=True)
    name = models.CharField(max_length=30)
    musallas = models.CharField(max_length=20)
    location = models.CharField(max_length=30)

class Masjid_members(models.Model):
    masjid = models.ForeignKey(Masjid)
    member_name = models.CharField(max_length=30)
    age = models.CharField(max_length=30)
    mobile = models.CharField(max_length=20)
    address = models.CharField(max_length=50)
    designation = models.CharField(max_length=20)

class Family(models.Model):
    muhalla = models.ForeignKey(Masjid)
    family_id = models.CharField(max_length=30,unique=True)
    ration_card =  models.CharField(max_length=30)
    address = models.CharField(max_length=50)
    mobile = models.CharField(max_length=20)
    donor = models.BooleanField(default=False)
    # report_date = models.DateTimeField(default=timezone.now)
    volunteer = models.BooleanField(default=False)
    language = models.CharField(max_length=30,null=True)
    health_insurance = models.BooleanField(default=False)
    family_needs = models.TextField(null=True)
    house_type = models.CharField(max_length=50, choices=STATUS)
    toilet = models.BooleanField(default=True)
    financial_status = models.CharField(max_length=50, choices=FINANCIAL)

class Scheme(models.Model):
    scheme_type = models.CharField(max_length=50,unique=True)

class Condition(models.Model):
    field = models.CharField(max_length=50,null=True)
    conditions = models.CharField(max_length=20,null=True)
    value = models.CharField(max_length=20,null=True)

class Service(models.Model):
    service_id = models.CharField(max_length=20,unique=True)
    name = models.CharField(max_length=50,unique=True)
    description = models.TextField(null=True)

class SubScheme(models.Model):
    scheme = models.ForeignKey(Scheme)    
    subscheme_id = models.CharField(max_length=20,unique=True)
    name = models.CharField(max_length=50,unique=True)
    conditions = models.ManyToManyField(Condition,blank=True)
    description = models.CharField(max_length=30,null=True)
    
class Member(models.Model):
    muhalla = models.ForeignKey(Masjid)
    mem_id = models.CharField(max_length=20,unique=True)
    name = models.CharField(max_length=30)
    gender = models.CharField(max_length=10,choices=GENDER)
    # dateofbirth = models.DateTimeField(default=timezone.now)
    age = models.CharField(max_length=10)
    Relation = models.CharField(max_length=20)
    family_head = models.BooleanField(default=False)
    marital_status = models.CharField(max_length=20,choices=MARITAL)
    qualification = models.CharField(max_length=100,null=True)
    mother_tongue = models.CharField(max_length=20,null=True)
    disability = models.BooleanField(default=False)
    alive = models.BooleanField(default=True)
    voter_status = models.BooleanField(default=False)
    family = models.ForeignKey(Family)
    donor = models.BooleanField(default=False)
    quran_reading = models.BooleanField(default=False)
    namaz = models.CharField(max_length=30,choices=NAMAS) 
    mobile = models.CharField(max_length=20,null=True)
    volunteer = models.BooleanField(default=False)
    occupation = models.CharField(max_length=30,null=True)
    curr_location = models.CharField(max_length=20,choices=LOCATION)
    Makthab = models.BooleanField(default=False)
    madarasa_details = models.CharField(max_length=50,choices=MADARASA,null=True) 

class Member_scheme(models.Model):
    member = models.ForeignKey(Member,null=True)
    scheme = models.ForeignKey(SubScheme,null=True)
    status = models.BooleanField(default=False)
    solution = models.CharField(max_length=20,choices=SOLUTION)

class Member_service(models.Model):
    member = models.ForeignKey(Member,null=True)
    scheme = models.ForeignKey(Service,null=True)
    status = models.BooleanField(default=False)
    solution = models.CharField(max_length=20,choices=SOLUTION)    

class Disease(models.Model):
    sym_type = models.CharField(max_length=30,choices=SYMPTOMTYPE)
    disease_name = models.CharField(max_length=50,unique=True)
    disease_id = models.CharField(max_length=20,unique=True)
    description = models.TextField(null=True)

class Surgery(models.Model):
    member = models.ForeignKey(Member,null=True)
    disease = models.ForeignKey(Disease)
    hospital_name = models.CharField(max_length=50,null=True)
    cost = models.CharField(max_length=20,null=True)
    cash_inHand = models.CharField(max_length=20,null=True)
    details = models.TextField(null=True)

class Medical(models.Model):
    member = models.ForeignKey(Member,null=True)
    disease = models.ForeignKey(Disease)
    medicine_needs = models.CharField(max_length=200,null=True)
    cost = models.CharField(max_length=20,null=True)

class ChronicDisease(models.Model):
    member = models.ForeignKey(Member,null=True)
    disease_name = models.ForeignKey(Disease)
    doctor_name = models.CharField(max_length=50,null=True)
    cost = models.CharField(max_length=20,null=True)
    status = models.BooleanField(default=False)
    details = models.CharField(max_length=300,null=True)

class SensesMembers(models.Model):
    user = models.OneToOneField(User)
    member_type = models.CharField(max_length=30,choices=NEWMEMTYPE)
    masjid = models.ForeignKey(Masjid)
    
# Create your models here.
