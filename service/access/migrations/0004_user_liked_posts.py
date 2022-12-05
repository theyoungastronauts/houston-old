# Generated by Django 4.0 on 2022-12-02 19:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('content', '0005_alter_comment_parent'),
        ('access', '0003_user_bio'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='liked_posts',
            field=models.ManyToManyField(blank=True, related_name='user_post_likes', through='connect.Like', to='content.Post', verbose_name='liked posts'),
        ),
    ]
