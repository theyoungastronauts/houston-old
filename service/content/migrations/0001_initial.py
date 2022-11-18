# Generated by Django 4.0 on 2022-11-18 15:25

import django.contrib.postgres.fields
import django.core.validators
from django.db import migrations, models
import django.db.models.deletion
import project.utils.uuid
import project.validators


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('access', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Post',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('uuid', models.UUIDField(db_index=True, default=project.utils.uuid.get_uuid, editable=False, unique=True, verbose_name='UUID')),
                ('metadata', models.JSONField(blank=True, default=dict, null=True, validators=[project.validators.TypeValidator(dict)], verbose_name='Metadata')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Created At')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Updated At')),
                ('title', models.CharField(max_length=128, verbose_name='Title')),
                ('body', models.TextField(blank=True, null=True)),
                ('assets', django.contrib.postgres.fields.ArrayField(base_field=models.URLField(max_length=256, validators=[django.core.validators.RegexValidator('^https://api\\.bitpack\\.app/asset/houston\\-dev/image/.+$')]), size=None, verbose_name='Assets')),
                ('is_deleted', models.BooleanField(default=False, verbose_name='Deleted')),
                ('owner', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='posts', to='access.user', verbose_name='Owner')),
            ],
            options={
                'verbose_name': 'Post',
                'verbose_name_plural': 'Posts',
                'ordering': ['-created_at'],
                'abstract': False,
            },
        ),
    ]
