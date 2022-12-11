from django.utils.translation import gettext_lazy as _
from bitpack.widgets import BitpackUploadWidget
from django.db.models.fields import CharField


class BitpackImageField(CharField):
    # default_validators = [validators.URLValidator()]
    description = _("Image")

    def __init__(self, verbose_name=None, name=None, **kwargs):
        kwargs.setdefault("max_length", 200)
        super().__init__(verbose_name, name, **kwargs)

    def deconstruct(self):
        name, path, args, kwargs = super().deconstruct()
        if kwargs.get("max_length") == 200:
            del kwargs["max_length"]
        return name, path, args, kwargs

    def formfield(self, **kwargs):

        return super().formfield(
            **{
                "form_class": BitpackUploadWidget,
                **kwargs,
            }
        )
