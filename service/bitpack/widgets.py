import json
from builtins import super

from django import forms
from django.conf import settings


class BitpackUploadWidget(forms.Widget):
    class Media:
        js = ()
        css = {"all": ()}

    template_name = "bitpack_upload_widget.html"

    def __init__(self, attrs=None, options=None):
        default_options = {"extensions": [".jpg", ".jpeg", ".gif", ".png"]}
        if options:
            default_options.update(options)

        self.options = default_options

        super(BitpackUploadWidget, self).__init__(attrs=attrs)

    def get_context(self, name, value, attrs):
        context = super().get_context(name, value, attrs)
        context["widget"]["options"] = json.dumps(self.options)
        context["bitpack_admin_token"] = settings.BITPACK_ADMIN_TOKEN
        return context
