from django.conf.urls import patterns, include, url
from senses.views import *
from django.contrib import admin

admin.autodiscover()


# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
    url(r'^$', login_check),
    url(r'^login/$', login_check),
    url(r'^signup/$', signup),
    url(r'^user_signup/$', user_signup),
    url(r'^login_page/$', login_page),
    url(r'^logout_view/',logout_view),
    url(r'^home/$', apping),
    url(r'^mohallauser/$', mohallauser),
    url(r'^enduser/$', enduser),
    url(r'^family_member/', family_member),
    url(r'^UpdateFamilyMember/$', UpdateFamilyMember),
    url(r'^get_mahallauser_data/',get_mahallauser_data),
    url(r'^addLocation/$',addLocation),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^add_masjid/',add_masjid),
    url(r'^masjid_member/',masjid_member),
    url(r'^familyData/',familyData),
    url(r'^fetch_data_api/',fetch_data_api),
    url(r'^matrix_taluk_api/',matrix_taluk_api),
    url(r'^dashboard_api/',dashboard_api),    
    url(r'^change_password/',change_password),
    url(r'^new_member/',new_member),
    url(r'^UpdateFamily_member/',UpdateFamily_member),
    url(r'^SchemeData/',SchemeData),
    url(r'^fetchReportData/',fetchReportData),
    url(r'^getServiceData/',getServiceData),
    url(r'^getSchemeData/',getSchemeData),
    url(r'^ServiceData/',ServiceData),
    url(r'^DiseaseData/',DiseaseData),
    url(r'^updateMemScheme/',updateMemScheme),
    url(r'^FamilyMemberData/',FamilyMemberData),
    url(r'^report_to_pdf/',report_to_pdf),
    url(r'^upload_bulk_data/',upload_bulk_data),    
    # Examples:
    # url(r'^$', 'sensesapp.views.home', name='home'),
    # url(r'^sensesapp/', include('sensesapp.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),
)
