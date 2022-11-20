from django.conf import settings

from api.asset.image.config import IMAGE_EXTENSION_MAP
from api.asset.image.serializers import ImageCreateSerializer, ImageRetrieveSerializer
from api.asset.views import AssetCreateRetrieveView
from project.utils import bitpack


class ImageCreateRetrieveView(AssetCreateRetrieveView):
    serializer_class_create = ImageCreateSerializer
    serializer_class_retrieve = ImageRetrieveSerializer

    asset_extension_map = IMAGE_EXTENSION_MAP
    asset_url_re = settings.BITPACK_IMAGE_URL_RE

    @staticmethod
    def create_resource_method(content_type, path):
        return bitpack.create_image_resource(content_type, path)

    @staticmethod
    def retrieve_resource_method(path):
        return bitpack.retrieve_image_resource(path)
