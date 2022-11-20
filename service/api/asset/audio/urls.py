from django.urls import path

from api.asset.audio.views import AudioCreateRetrieveView

urlpatterns = [
    path("", AudioCreateRetrieveView.as_view()),
]
