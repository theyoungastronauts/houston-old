import re

from project.settings.environment import ENV
from project.utils.url import url_join

BITPACK_APPLICATION = ENV.str("BITPACK_APPLICATION")
BITPACK_TOKEN = ENV.str("BITPACK_TOKEN")
BITPACK_URL = ENV.str("BITPACK_URL")
BITPACK_ADMIN_TOKEN = ENV.str("BITPACK_ADMIN_TOKEN")

# region Audio


BITPACK_AUDIO_PUBLIC_URL = url_join(BITPACK_URL, "asset", BITPACK_APPLICATION, "audio")
BITPACK_AUDIO_API_URL = url_join(
    BITPACK_URL, "v1", "asset", BITPACK_APPLICATION, "audio"
)
BITPACK_AUDIO_URL_RE = r"^(" + re.escape(BITPACK_AUDIO_PUBLIC_URL) + r")(.+$)"

BITPACK_FILE_PUBLIC_URL = url_join(BITPACK_URL, "asset", BITPACK_APPLICATION, "file")
BITPACK_FILE_API_URL = url_join(BITPACK_URL, "v1", "asset", BITPACK_APPLICATION, "file")

BITPACK_FILE_URL_RE = r"^(" + re.escape(BITPACK_FILE_PUBLIC_URL) + r")(.+$)"


# endregion


# region Image


BITPACK_IMAGE_PUBLIC_URL = url_join(BITPACK_URL, "asset", BITPACK_APPLICATION, "image")
BITPACK_IMAGE_API_URL = url_join(
    BITPACK_URL, "v1", "asset", BITPACK_APPLICATION, "image"
)
BITPACK_IMAGE_URL_RE = r"^(" + re.escape(BITPACK_IMAGE_PUBLIC_URL) + r")(.+$)"

# endregion
