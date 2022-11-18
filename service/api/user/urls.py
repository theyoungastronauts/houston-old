from django.urls import path

from api.user.views import UserMeRetrieveUpdateView

urlpatterns = [
    path("me/", UserMeRetrieveUpdateView.as_view()),
]
