from rest_framework import serializers

from api.asset.audio.config import AUDIO_CONTENT_TYPES
from api.fields import AudioURLField


class AudioCreateSerializer(serializers.Serializer):
    content_type = serializers.ChoiceField(choices=AUDIO_CONTENT_TYPES)


class AudioRetrieveSerializer(serializers.Serializer):
    url = AudioURLField()
