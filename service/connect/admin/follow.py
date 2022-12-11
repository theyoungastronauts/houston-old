from admin_auto_filters.filters import AutocompleteFilterFactory
from django.contrib import admin
from django.utils.translation import gettext_lazy as _

from admin.models import ModelAdmin
from connect.models import Follow


@admin.register(Follow)
class FollowAdmin(ModelAdmin):
    search_fields = [
        "owner__number",
        "owner__name",
        "owner__email",
        "user__number",
        "user__name",
        "user__email",
    ]
    readonly_fields = [
        "uuid",
        "created_at",
        "updated_at",
    ]
    autocomplete_fields = ["owner", "user"]

    list_display = [
        "owner",
        "user",
        "created_at",
    ]
    list_filter = [
        AutocompleteFilterFactory(_("Owner"), "owner"),
        AutocompleteFilterFactory(_("User"), "user"),
    ]

    date_hierarchy = "created_at"
    ordering = ["-created_at"]

    fieldsets = (
        (
            _("Details"),
            {
                "fields": [
                    "uuid",
                    "owner",
                    "user",
                ]
            },
        ),
        (
            _("Dates"),
            {
                "fields": [
                    "created_at",
                ]
            },
        ),
    )

    class Media:
        pass
