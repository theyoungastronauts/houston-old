from django.urls import path

from api.user.views import (
    UserMeRetrieveUpdateView,
    UserRetrieveView,
    UserFollowView,
    UserListMeFollowersView,
    UserListMeFollowingView,
)

urlpatterns = [
    path("me/", UserMeRetrieveUpdateView.as_view()),
    path("<uuid:uuid>/", UserRetrieveView.as_view(lookup_field="uuid")),
    path(
        "<uuid:uuid>/follow/",
        UserFollowView.as_view(lookup_field="uuid"),
        {"will_follow": True},
    ),
    path(
        "<uuid:uuid>/unfollow/",
        UserFollowView.as_view(lookup_field="uuid"),
        {"will_follow": False},
    ),
    path("me/followers/", UserListMeFollowersView.as_view()),
    path("me/following/", UserListMeFollowingView.as_view()),
]
