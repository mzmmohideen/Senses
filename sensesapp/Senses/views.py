class Family(models.Model):
    ration_card_id =  models.CharField(max_length=20)
    address = models.CharField(max_length=50)
    city = models.TextField(max_length=20)
    state = models.TextField(max_length=20)
    mobile = models.TextField(max_length=20)
    mother_tongue = models.TextField(max_length=20)
    house_type = models.TextField(max_length=50,CHOICES=STATUS)
    toilet = models.BooleanField(default=True)
    financial_status = models.TextField(max_length=50,CHOICES=FINANCIAL)

class Member(models.Model):
    govt_id = models.CharField(max_length=20)
    name = models.CharField(max_length=20)
    gender = models.CharField(max_length=10)
    age = models.CharField(max_length=10)
    Relation = models.CharField(max_length=20)
    marital_status = models.CharField(max_length=20)
    voter_status = models.BooleanField(default=False)
    family = models.ForeignKey(Family)
    job_status = models.CharField(max_length=20)
    curr_location = models.CharField(max_length=20)
    to_join_madarasa = models.BooleanField(max_length=20) 
    schemes = models.ManyToManyField(Scheme)

class Scheme(models.Model):
    scheme_type = models.CharField(max_length=20)
    name = models.CharField(max_length=20)
    description = models.TextField()# Create your views here.
