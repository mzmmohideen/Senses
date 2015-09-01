from django.conf.urls import patterns, include, url
from Senses.views import *
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
    # Examples:
    # url(r'^$', 'sensesapp.views.home', name='home'),
    # url(r'^sensesapp/', include('sensesapp.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),
)
