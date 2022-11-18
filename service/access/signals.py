import datetime

from django.conf import settings
from django.contrib.auth import get_user_model
from django.db.models.signals import pre_save
from django.dispatch import receiver
from django.utils import timezone

from access.models import OneTimePassword

User = get_user_model()


@receiver(pre_save, sender=User)
def pre_save_user(sender, instance, **kwargs):
    instance.is_setup = bool(instance.name)


@receiver(pre_save, sender=OneTimePassword)
def pre_save_otp(sender, instance, **kwargs):
    if instance._state.adding:
        instance.created_at = timezone.now()
        instance.expires_at = instance.created_at + datetime.timedelta(
            seconds=settings.AUTH_OTP_TIMEOUT
        )
