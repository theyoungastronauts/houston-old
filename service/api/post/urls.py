from django.urls import path

from api.post.views import (
    PostListCreateView,
    PostRetrieveUpdateDestroyView,
)

urlpatterns = [
    path("", PostListCreateView.as_view()),
    path("<uuid:uuid>/", PostRetrieveUpdateDestroyView.as_view(lookup_field="uuid")),
]
