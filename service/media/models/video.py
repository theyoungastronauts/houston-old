from django.conf import settings
from django.db import models
from django.utils.translation import gettext_lazy as _
from django.contrib.auth import get_user_model
from project.models import AbstractModel

User = get_user_model()

class VideoManager(models.Manager):
    def get_queryset(self):
        return super().get_queryset()


class Video(AbstractModel):

    title = models.CharField(_("Title"))
    description = models.TextField(_("Description"))
    url = models.URLField(_("Url"))
    view_count = models.IntegerField(_("View Count"))
    owner = models.ForeignKey(
      'access.User', 
      verbose_name=_("Owner"),
      on_delete=models.CASCADE,
    )
    

    class Meta(AbstractModel.Meta):
        verbose_name = _("Video")
        verbose_name_plural = _("Videos")