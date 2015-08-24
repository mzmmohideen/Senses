class Family(models.Model):
    ration_card_id =  models.CharField(max_length=20)
    address = models.TextField()

class Member(models.Model):
    _id = models.CharField(max_length=20)
    name = models.CharField(max_length=20)
    family = models.ForeignKey(Family)
    schemes = models.ManyToManyField(Scheme)

class Scheme(models.Model):
    scheme_type = models.CharField(max_length=20)
    name = models.CharField(max_length=20)
    description = models.TextField()# Create your views here.
