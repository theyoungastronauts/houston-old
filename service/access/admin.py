from admin_auto_filters.filters import AutocompleteFilterFactory
from django.contrib import admin
from django.contrib.auth import get_user_model
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.contrib.auth.models import Group
from django.contrib.auth.forms import UserChangeForm
from django.db.models import Q, Case, When, Value, BooleanField
from django.utils import timezone
from django.utils.translation import gettext_lazy as _

from access.models import OneTimePassword
from admin.mixins import OverridesMixin
from admin.models import ModelAdmin
from bitpack.widgets import BitpackUploadWidget


User = get_user_model()

admin.site.unregister(Group)


class UserAdminForm(UserChangeForm):
    class Meta:
        model = User
        widgets = {
            "image": BitpackUploadWidget(),
        }
        fields = "__all__"


@admin.register(User)
class UserAdmin(OverridesMixin, BaseUserAdmin):
    form = UserAdminForm
    save_on_top = True

    autocomplete_fields = []
    search_fields = ["number", "name", "email"]
    readonly_fields = ["id", "uuid", "is_setup", "created_at", "updated_at"]

    list_display = [
        "number",
        "name",
        "email",
        "is_active",
        "is_setup",
        "is_admin",
        "created_at",
    ]
    list_filter = [
        "is_active",
        "is_setup",
        "is_admin",
        "created_at",
    ]
    filter_horizontal = []

    date_hierarchy = "created_at"
    ordering = ["-created_at"]

    add_fieldsets = (
        (
            _("Details"),
            {
                "fields": [
                    "number",
                    "name",
                    "email",
                    "image",
                    "password1",
                    "password2",
                ]
            },
        ),
        (
            _("Access"),
            {"fields": ["is_active", "is_admin"]},
        ),
        (_("Data"), {"fields": ["metadata"]}),
    )

    fieldsets = (
        (
            _("Details"),
            {
                "fields": [
                    "id",
                    "uuid",
                    "number",
                    "name",
                    "email",
                    "image",
                ]
            },
        ),
        (
            _("Access"),
            {
                "fields": [
                    "is_setup",
                    "is_active",
                    "is_admin",
                    "password",
                ]
            },
        ),
        (_("Data"), {"fields": ["metadata"]}),
        (_("Dates"), {"fields": ["created_at", "updated_at"]}),
    )

    class Media:
        pass


@admin.register(OneTimePassword)
class OneTimePasswordAdmin(ModelAdmin):
    search_fields = ["user__number", "user__name", "user__email"]

    list_display = [
        "__str__",
        "code",
        "user",
        "is_valid",
        "is_consumed",
        "created_at",
    ]
    list_filter = [
        AutocompleteFilterFactory(_("User"), "user"),
    ]

    date_hierarchy = "created_at"
    ordering = ["-created_at"]

    def get_readonly_fields(self, request, obj=None):
        readonly_fields = [
            "id",
            "uuid",
            "code",
            "is_valid",
            "is_consumed",
            "created_at",
            "expires_at",
            "consumed_at",
        ]
        if obj:
            readonly_fields.append("user")
        return readonly_fields

    def get_queryset(self, request):
        return (
            super()
            .get_queryset(request)
            .annotate(
                _is_valid=Case(
                    When(
                        Q(
                            user__is_active=True,
                            expires_at__gte=timezone.now(),
                            consumed_at__isnull=True,
                        ),
                        then=Value(True),
                    ),
                    default=Value(False),
                    output_field=BooleanField(),
                ),
                _is_consumed=Case(
                    When(consumed_at__isnull=False, then=Value(True)),
                    default=Value(False),
                    output_field=BooleanField(),
                ),
            )
        )

    def is_valid(self, obj):
        if not obj.pk:
            return
        return obj._is_valid

    is_valid.short_description = _("Valid")
    is_valid.admin_order_field = "is_valid"
    is_valid.boolean = True

    def is_consumed(self, obj):
        if not obj.pk:
            return
        return obj._is_consumed

    is_consumed.short_description = _("Consumed")
    is_consumed.admin_order_field = "is_consumed"
    is_consumed.boolean = True

    fieldsets = (
        (
            _("Details"),
            {"fields": ["uuid", "code", "user"]},
        ),
        (_("Data"), {"fields": ["is_valid", "is_consumed", "metadata"]}),
        (
            _("Dates"),
            {"fields": ["created_at", "expires_at", "consumed_at"]},
        ),
    )

    class Media:
        pass
