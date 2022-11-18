import re

from project.settings.environment import ENV
from project.utils.urls import join_url

BITPACK_APPLICATION = ENV.str("BITPACK_APPLICATION")
BITPACK_TOKEN = ENV.str("BITPACK_TOKEN")
BITPACK_URL = ENV.str("BITPACK_URL")
BITPACK_IMAGE_URL = join_url(BITPACK_URL, "asset", BITPACK_APPLICATION, "image")
BITPACK_IMAGE_URL_RE = r"^" + re.escape(BITPACK_IMAGE_URL) + r".+$"
