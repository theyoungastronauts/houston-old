import requests
from django.conf import settings
from requests.exceptions import HTTPError
from rest_framework import status
from rest_framework.generics import GenericAPIView
from rest_framework.response import Response

from api import exceptions
from api.asset.image.serializers import AssetImageCreateSerializer
from api.permissions import IsAuthenticated
from project.utils.uuid import get_uuid


class AssetImageCreateView(GenericAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = AssetImageCreateSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        headers = {"X-Api-Key": settings.BITPACK_TOKEN}
        payload = {
            "content_type": "image/jpeg",
            "path": f"{request.user.uuid}/{get_uuid()}.jpg",
        }
        response = requests.post(
            settings.BITPACK_IMAGE_URL, headers=headers, json=payload
        )

        try:
            response.raise_for_status()
        except HTTPError:
            raise exceptions.ServerError()

        return Response(response.json(), status=status.HTTP_201_CREATED)
