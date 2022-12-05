from django.urls import path

from api.post.views import (
    PostListCreateView,
    PostRetrieveUpdateDestroyView,
    PostListMeView,
    PostRetrieveMeView,
    PostCommentListCreateView,
    PostListMeLikesView,
    PostLikeView,
)

urlpatterns = [
    path("", PostListCreateView.as_view()),
    path("<uuid:uuid>/", PostRetrieveUpdateDestroyView.as_view(lookup_field="uuid")),
    path("me/", PostListMeView.as_view()),
    path("me/<uuid:uuid>/", PostRetrieveMeView.as_view(lookup_field="uuid")),
    path("<uuid:uuid>/comment/", PostCommentListCreateView.as_view()),
    path("me/liked/", PostListMeLikesView.as_view()),
    path(
        "<uuid:uuid>/like/",
        PostLikeView.as_view(lookup_field="uuid"),
        {"will_like": True},
    ),
    path(
        "<uuid:uuid>/unlike/",
        PostLikeView.as_view(lookup_field="uuid"),
        {"will_like": False},
    ),
]
