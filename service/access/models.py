from django.conf import settings
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from django.contrib.contenttypes.models import ContentType
from django.core.exceptions import ValidationError
from django.core.validators import RegexValidator
from django.db import models
from django.utils import timezone
from django.utils.translation import gettext_lazy as _
from phonenumber_field.modelfields import PhoneNumberField

from project.fields import CIEmailField
from project.models import AbstractModel
from project.utils.string import get_random_string

OTP_LENGTH = 6


def get_otp_code():
    return get_random_string("0123456789", OTP_LENGTH)


class UserManager(BaseUserManager):
    def _create_user(self, number, password, **kwargs):
        if not number:
            raise ValueError("Users must have a phone number")

        user = self.model(number=number, **kwargs)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, number, password=None, **kwargs):
        kwargs["is_admin"] = False
        return self._create_user(number, password, **kwargs)

    def create_superuser(self, number, password, **kwargs):
        kwargs["is_admin"] = True
        return self._create_user(number, password, **kwargs)


class User(AbstractModel, AbstractBaseUser):
    number = PhoneNumberField(_("Number"), unique=True, db_index=True)
    name = models.CharField(_("Name"), max_length=32, blank=True)
    email = CIEmailField(
        _("Email"), max_length=128, blank=True, null=True, unique=True, db_index=True
    )
    password = models.CharField(_("Password"), max_length=128)
    image = models.URLField(
        _("Image"),
        max_length=256,
        validators=[RegexValidator(settings.BITPACK_IMAGE_URL_RE)],
        blank=True,
    )
    is_active = models.BooleanField(
        _("Active"),
        help_text=_("Designates whether this user can access their account."),
        default=True,
    )
    is_setup = models.BooleanField(
        _("Setup"),
        help_text=_("Designates whether the user requires onboarding."),
        default=False,
    )
    is_admin = models.BooleanField(
        _("Admin"),
        help_text=_("Designates whether the user can log into this admin site."),
        default=False,
    )

    last_login = None

    objects = UserManager()

    USERNAME_FIELD = "number"
    REQUIRED_FIELDS = ["name", "email"]

    @property
    def is_staff(self):
        return self.is_admin

    @property
    def is_superuser(self):
        return self.is_admin

    def __str__(self):
        return f"{self.number} | {self.name}" if self.name else str(self.number)

    def has_perm(self, perm, obj=None):
        return self.is_active and self.is_admin

    def has_module_perms(self, app_label):
        return self.is_active and self.is_admin

    def get_all_permissions(self, obj=None):
        return []

    class Meta(AbstractModel.Meta):
        verbose_name = _("User")
        verbose_name_plural = _("Users")


class OneTimePassword(AbstractModel):
    code = models.CharField(
        _("Code"),
        default=get_otp_code,
        max_length=OTP_LENGTH,
        editable=False,
        db_index=True,
    )
    user = models.ForeignKey(
        User, verbose_name=_("User"), on_delete=models.CASCADE, db_index=True
    )
    expires_at = models.DateTimeField(_("Expires At"))
    consumed_at = models.DateTimeField(_("Consumed At"), blank=True, null=True)

    @property
    def is_expired(self):
        return timezone.now() > self.expires_at

    @property
    def is_consumed(self):
        return bool(self.consumed_at)

    @property
    def is_valid(self):
        return self.user.is_active and not self.is_expired and not self.is_consumed

    def consume(self):
        if not self.is_valid:
            raise ValidationError("Cannot consume, OTP is invalid.")
        self.consumed_at = timezone.now()

    def __str__(self):
        return str(self.uuid)

    class Meta(AbstractModel.Meta):
        verbose_name = _("OTP")
        verbose_name_plural = _("OTPs")
