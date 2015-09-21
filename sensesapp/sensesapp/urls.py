from django.conf.urls import patterns, include, url
from senses.views import *
from django.contrib import admin

admin.autodiscover()


# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
	url(r'^$', login),
	url(r'^login/$', login),
	url(r'^signup/$', signup),
    url(r'^login_page/$', login_page),
    url(r'^home/$', apping),
    url(r'^addLocation/$',addLocation),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^add_masjid/',add_masjid),
    url(r'^masjid_member/',masjid_member),
    url(r'^familyData/',familyData),
    url(r'^UpdateFamily_member/',UpdateFamily_member),
    url(r'^SchemeData/',SchemeData),
    url(r'^getServiceData/',getServiceData),
    url(r'^getSchemeData/',getSchemeData),
    url(r'^ServiceData/',ServiceData),
    url(r'^DiseaseData/',DiseaseData),
    url(r'^updateMemScheme/',updateMemScheme),
    url(r'^FamilyMemberData/',FamilyMemberData),
    # Examples:
    # url(r'^$', 'sensesapp.views.home', name='home'),
    # url(r'^sensesapp/', include('sensesapp.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),
)
