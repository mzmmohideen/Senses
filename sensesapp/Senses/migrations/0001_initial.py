# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'District'
        db.create_table(u'senses_district', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('district_name', self.gf('django.db.models.fields.CharField')(unique=True, max_length=50)),
        ))
        db.send_create_signal(u'senses', ['District'])

        # Adding model 'Taluk'
        db.create_table(u'senses_taluk', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('district', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['senses.District'])),
            ('taluk_name', self.gf('django.db.models.fields.CharField')(max_length=30)),
        ))
        db.send_create_signal(u'senses', ['Taluk'])

        # Adding model 'Family'
        db.create_table(u'senses_family', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('ration_card_id', self.gf('django.db.models.fields.CharField')(max_length=20)),
            ('address', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('city', self.gf('django.db.models.fields.CharField')(max_length=20)),
            ('state', self.gf('django.db.models.fields.CharField')(max_length=20)),
            ('mobile', self.gf('django.db.models.fields.CharField')(max_length=20)),
            ('mother_tongue', self.gf('django.db.models.fields.CharField')(max_length=20)),
            ('house_type', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('toilet', self.gf('django.db.models.fields.BooleanField')(default=True)),
            ('financial_status', self.gf('django.db.models.fields.CharField')(max_length=50)),
        ))
        db.send_create_signal(u'senses', ['Family'])

        # Adding model 'Scheme'
        db.create_table(u'senses_scheme', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('scheme_type', self.gf('django.db.models.fields.CharField')(max_length=20)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=20)),
            ('description', self.gf('django.db.models.fields.CharField')(max_length=30, null=True)),
        ))
        db.send_create_signal(u'senses', ['Scheme'])

        # Adding model 'Member'
        db.create_table(u'senses_member', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('govt_id', self.gf('django.db.models.fields.CharField')(max_length=20)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=20)),
            ('gender', self.gf('django.db.models.fields.CharField')(max_length=10)),
            ('age', self.gf('django.db.models.fields.CharField')(max_length=10)),
            ('Relation', self.gf('django.db.models.fields.CharField')(max_length=20)),
            ('marital_status', self.gf('django.db.models.fields.CharField')(max_length=20)),
            ('voter_status', self.gf('django.db.models.fields.BooleanField')(default=False)),
            ('family', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['senses.Family'])),
            ('job_status', self.gf('django.db.models.fields.CharField')(max_length=20)),
            ('curr_location', self.gf('django.db.models.fields.CharField')(max_length=20)),
            ('to_join_madarasa', self.gf('django.db.models.fields.BooleanField')(default=False, max_length=20)),
        ))
        db.send_create_signal(u'senses', ['Member'])

        # Adding M2M table for field schemes on 'Member'
        m2m_table_name = db.shorten_name(u'senses_member_schemes')
        db.create_table(m2m_table_name, (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('member', models.ForeignKey(orm[u'senses.member'], null=False)),
            ('scheme', models.ForeignKey(orm[u'senses.scheme'], null=False))
        ))
        db.create_unique(m2m_table_name, ['member_id', 'scheme_id'])


    def backwards(self, orm):
        # Deleting model 'District'
        db.delete_table(u'senses_district')

        # Deleting model 'Taluk'
        db.delete_table(u'senses_taluk')

        # Deleting model 'Family'
        db.delete_table(u'senses_family')

        # Deleting model 'Scheme'
        db.delete_table(u'senses_scheme')

        # Deleting model 'Member'
        db.delete_table(u'senses_member')

        # Removing M2M table for field schemes on 'Member'
        db.delete_table(db.shorten_name(u'senses_member_schemes'))


    models = {
        u'senses.district': {
            'Meta': {'object_name': 'District'},
            'district_name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '50'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        },
        u'senses.family': {
            'Meta': {'object_name': 'Family'},
            'address': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'city': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'financial_status': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'house_type': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'mobile': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'mother_tongue': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'ration_card_id': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'state': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'toilet': ('django.db.models.fields.BooleanField', [], {'default': 'True'})
        },
        u'senses.member': {
            'Meta': {'object_name': 'Member'},
            'Relation': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'age': ('django.db.models.fields.CharField', [], {'max_length': '10'}),
            'curr_location': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'family': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['senses.Family']"}),
            'gender': ('django.db.models.fields.CharField', [], {'max_length': '10'}),
            'govt_id': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'job_status': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'marital_status': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'schemes': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['senses.Scheme']", 'symmetrical': 'False'}),
            'to_join_madarasa': ('django.db.models.fields.BooleanField', [], {'default': 'False', 'max_length': '20'}),
            'voter_status': ('django.db.models.fields.BooleanField', [], {'default': 'False'})
        },
        u'senses.scheme': {
            'Meta': {'object_name': 'Scheme'},
            'description': ('django.db.models.fields.CharField', [], {'max_length': '30', 'null': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'scheme_type': ('django.db.models.fields.CharField', [], {'max_length': '20'})
        },
        u'senses.taluk': {
            'Meta': {'object_name': 'Taluk'},
            'district': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['senses.District']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'taluk_name': ('django.db.models.fields.CharField', [], {'max_length': '30'})
        }
    }

    complete_apps = ['senses']