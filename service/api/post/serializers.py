from rest_framework import serializers

from api.user.serializers import UserPublicSerializer
from content.models import Post


class PostSerializer(serializers.ModelSerializer):
    owner = UserPublicSerializer(read_only=True)
    num_assets = serializers.IntegerField(read_only=True)

    class Meta:
        model = Post
        fields = [
            "uuid",
            "owner",
            "num_assets",
            "assets",
            "metadata",
            "created_at",
        ]
        read_only_fields = [
            "uuid",
            "owner",
            "num_assets",
            "metadata",
            "created_at",
        ]