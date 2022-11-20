import re
from django import forms
from django.core import validators

import requests
from django.conf import settings
from django.core.validators import RegexValidator
from django.forms.widgets import Widget
from django.template import loader
from django.utils.safestring import mark_safe

from project.utils.url import url_join
from project.utils.uuid import get_uuid

AUTH_HEADERS = {"X-Api-Key": settings.BITPACK_TOKEN}


def _create_resource(url, content_type, path):
    payload = {"content_type": content_type, "path": path}
    response = requests.post(url, headers=AUTH_HEADERS, json=payload)
    response.raise_for_status()
    return response.json()


def _retrieve_resource(url, path):
    url = url_join(url, path, append_trailing_slash=False)
    response = requests.get(url, headers=AUTH_HEADERS)
    response.raise_for_status()
    return response.json()


def get_asset_url(key):
    return url_join(settings.BITPACK_URL, key, append_trailing_slash=False)


def get_asset_path(url, url_pattern):
    match = re.match(url_pattern, url)
    if not match or len(match.groups()) < 2:
        return False
    return match.group(2)


# region Audio


def get_audio_path(url):
    return get_asset_path(url, settings.BITPACK_AUDIO_URL_RE)


def audio_validator(value):
    return RegexValidator(settings.BITPACK_AUDIO_URL_RE)(value)


def create_audio_resource(content_type, path):
    return _create_resource(settings.BITPACK_AUDIO_API_URL, content_type, path)


def retrieve_audio_resource(path):
    return _retrieve_resource(settings.BITPACK_AUDIO_API_URL, path)


def create_file_resource(content_type, path):
    return _create_resource(settings.BITPACK_FILE_API_URL, content_type, path)


def retrieve_file_resource(path):
    return _retrieve_resource(settings.BITPACK_FILE_API_URL, path)


def file_validator(value):
    return RegexValidator(settings.BITPACK_FILE_URL_RE)(value)


def upload_audio_asset(buffer, *, content_type="audio/mp3", path=None):
    if not path:
        path = f"{get_uuid()}.mp3"

    audio_resource = create_audio_resource(content_type, path)
    upload_response = requests.post(
        audio_resource["url"],
        data=audio_resource["fields"],
        files={"file": buffer.read()},
    )
    upload_response.raise_for_status()
    return retrieve_audio_resource(path)


def upload_image_asset(buffer, *, content_type="image/jpeg", path=None):
    if not path:
        ext = content_type.split("/")[1].replace("jpeg", "jpg").lower()
        path = f"{get_uuid()}.{ext}"

    image_resource = create_image_resource(content_type, path)
    upload_response = requests.post(
        image_resource["url"],
        data=image_resource["fields"],
        files={"file": buffer.read()},
    )
    upload_response.raise_for_status()
    return retrieve_image_resource(path)


def upload_file_asset(buffer, *, content_type="application/binary", path=None):

    if not path:
        path = f"{get_uuid()}.zip"

    file_resource = create_file_resource(content_type, path)
    upload_response = requests.post(
        file_resource["url"],
        data=file_resource["fields"],
        files={"file": buffer.read()},
    )
    upload_response.raise_for_status()
    return retrieve_file_resource(path)


# endregion


# region Image


def get_image_path(url):
    return get_asset_path(url, settings.BITPACK_IMAGE_URL_RE)


def image_validator(value):
    return RegexValidator(settings.BITPACK_IMAGE_URL_RE)(value)


def create_image_resource(content_type, path):
    return _create_resource(settings.BITPACK_IMAGE_API_URL, content_type, path)


def retrieve_image_resource(path):
    return _retrieve_resource(settings.BITPACK_IMAGE_API_URL, path)


# endregion
