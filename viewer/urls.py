from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^display/$', views.display, name='display'),
    url(r'^inspect/(?P<target_pk>[0-9]+)/$', views.inspect, name='inspect'),
    url(r'^tindspect/(?P<target_pk>[0-9]+)/$', views.tindspect, name='tindspect'),
    url(r'^mol_choice/(?P<mol_pk>[0-9]+)/(?P<score>[0-9]+)/$', views.mol_choice, name='mol_choice'),
    url(r'^mol_view/$', views.mol_view, name='mol_view'),
    url(r'^img_from_pk/$', views.img_from_pk, name='img_from_pk'),
    url(r'^img_from_smiles/$', views.img_from_smiles, name='img_from_smiles'),
    url(r'^prot_from_pk/(?P<pk>[0-9]+)/$', views.prot_from_pk, name='prot_from_pk'),
    url(r'^mol_from_pk/(?P<pk>[0-9]+)/', views.mol_from_pk, name='mol_from_pk'),
    url(r'^map_from_pk/(?P<pk>[0-9]+)/', views.map_from_pk, name='map_from_pk'),
    url(r'^get_vects_from_pk/(?P<pk>[0-9]+)/', views.get_vects_from_pk, name='get_vects_from_pk'),
    url(r'^get_graph_from_pk/(?P<pk>[0-9]+)/', views.get_graph_from_pk, name='get_graph_from_pk'),
    url(r'^post_view/$', views.post_view, name='post_view'),
    url(r'^get_view/(?P<pk>[0-9]+)/$', views.get_view, name='get_view'),
    url(r'^get_mols/$', views.get_mols, name='get_mols'),
]