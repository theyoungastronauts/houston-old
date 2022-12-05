from django.db import models
from django.contrib.auth import get_user_model
from project.models import AbstractModel
from django.utils.translation import gettext_lazy as _


User = get_user_model()


class Follow(AbstractModel):

    user = models.ForeignKey(
        User,
        verbose_name=_("user"),
        related_name="follow_users",
        on_delete=models.CASCADE,
    )
    owner = models.ForeignKey(
        User,
        verbose_name=_("owner"),
        related_name="follow_owners",
        on_delete=models.CASCADE,
    )

    class Meta:
        ordering = ["-created_at"]
        verbose_name = _("user follow")
        verbose_name_plural = _("user follows")
        unique_together = [("user", "owner")]
