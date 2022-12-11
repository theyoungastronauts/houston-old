from django.db import models
from django.contrib.auth import get_user_model
from project.models import AbstractModel
from content.models import Post
from django.utils.translation import gettext_lazy as _


User = get_user_model()


class Like(AbstractModel):

    post = models.ForeignKey(Post, verbose_name=_("post"), on_delete=models.CASCADE)
    owner = models.ForeignKey(User, verbose_name=_("owner"), on_delete=models.CASCADE)

    class Meta:
        ordering = ["-created_at"]
        verbose_name = _("post like")
        verbose_name_plural = _("post likes")
        unique_together = [("post", "owner")]
