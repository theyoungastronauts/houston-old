from requests.exceptions import HTTPError
from rest_framework import status
from rest_framework.generics import GenericAPIView
from rest_framework.response import Response

from api import exceptions
from api.permissions import IsAuthenticatedOrSecretToken
from project.utils import bitpack
from project.utils.uuid import get_uuid


class AssetCreateRetrieveView(GenericAPIView):
    permission_classes = [IsAuthenticatedOrSecretToken]

    serializer_class_create = None
    serializer_class_retrieve = None

    asset_extension_map = None
    asset_url_re = None

    create_resource_method = None
    retrieve_resource_method = None

    def get_serializer_class(self):
        method = self.request.method
        if method == "POST":
            return self.serializer_class_create
        elif method == "GET":
            return self.serializer_class_retrieve
        else:
            raise exceptions.MethodNotAllowed(method)

    def get_asset_extension(self, content_type):
        return self.asset_extension_map[content_type]

    def get_asset_filename(self, content_type):
        extension = self.get_asset_extension(content_type)
        return f"{get_uuid()}.{extension}"

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        content_type = serializer.validated_data.get("content_type")
        filename = self.get_asset_filename(content_type)

        try:
            resource = self.create_resource_method(content_type, filename)
        except HTTPError:
            raise exceptions.BadRequest()

        return Response(resource, status=status.HTTP_201_CREATED)

    def get(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=self.request.query_params)
        serializer.is_valid(raise_exception=True)

        url = serializer.validated_data.get("url")
        path = bitpack.get_asset_path(url, self.asset_url_re)
        if not path:
            raise exceptions.BadRequest()

        try:
            resource = self.retrieve_resource_method(path)
        except HTTPError as e:
            raise exceptions.BadRequest()

        return Response(resource, status=status.HTTP_200_OK)
