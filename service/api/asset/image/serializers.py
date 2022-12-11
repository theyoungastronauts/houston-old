from rest_framework import serializers

from api.asset.image.config import IMAGE_CONTENT_TYPES
from api.fields import ImageURLField


class ImageCreateSerializer(serializers.Serializer):
    content_type = serializers.ChoiceField(choices=IMAGE_CONTENT_TYPES)


class ImageRetrieveSerializer(serializers.Serializer):
    url = ImageURLField()
