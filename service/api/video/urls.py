from django.urls import path

from api.video.views import (
    VideoListCreateView,
    VideoRetrieveUpdateDestroyView,
)

urlpatterns = [
    path("", VideoListCreateView.as_view()),
    path("<uuid:uuid>/", VideoRetrieveUpdateDestroyView.as_view(lookup_field="uuid")),
]