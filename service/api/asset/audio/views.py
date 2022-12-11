from django.conf import settings

from api.asset.audio.config import AUDIO_EXTENSION_MAP
from api.asset.audio.serializers import AudioCreateSerializer, AudioRetrieveSerializer
from api.asset.views import AssetCreateRetrieveView
from project.utils import bitpack


class AudioCreateRetrieveView(AssetCreateRetrieveView):
    serializer_class_create = AudioCreateSerializer
    serializer_class_retrieve = AudioRetrieveSerializer

    asset_extension_map = AUDIO_EXTENSION_MAP
    asset_url_re = settings.BITPACK_AUDIO_URL_RE

    @staticmethod
    def create_resource_method(content_type, path):
        return bitpack.create_audio_resource(content_type, path)

    @staticmethod
    def retrieve_resource_method(path):
        return bitpack.retrieve_audio_resource(path)
