from rest_framework.generics import GenericAPIView
from rest_framework.mixins import (
    DestroyModelMixin,
    ListModelMixin,
    CreateModelMixin,
    RetrieveModelMixin,
    UpdateModelMixin,
)

from api.video.filters import VideoFilter
from api.video.querysets import ALL_VIDEOS_QUERYSET
from api.video.serializers import VideoSerializer
from api.permissions import IsAuthenticated, IsOwnerOrReadOnly


class VideoAPIView(GenericAPIView):
    queryset = ALL_VIDEOS_QUERYSET
    serializer_class = VideoSerializer
    permission_classes = [IsAuthenticated, IsOwnerOrReadOnly]
    filterset_class = VideoFilter

    search_fields = []
    ordering_fields = ["created_at"]
    ordering = ["-created_at"]

    def get_queryset(self):
        return super().get_queryset()
    


class VideoListCreateView(ListModelMixin, CreateModelMixin, VideoAPIView):
    def get(self, request, *args, **kwargs):
        return self.list(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        return self.create(request, *args, **kwargs)

    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)


class VideoRetrieveUpdateDestroyView(
    RetrieveModelMixin, UpdateModelMixin, DestroyModelMixin, VideoAPIView
):
    def get(self, request, *args, **kwargs):
        return self.retrieve(request, *args, **kwargs)

    def put(self, request, *args, **kwargs):
        return self.update(request, *args, **kwargs)

    def patch(self, request, *args, **kwargs):
        return self.partial_update(request, *args, **kwargs)

    def delete(self, request, *args, **kwargs):
        return self.destroy(request, *args, **kwargs)

