from django.urls import path, include

urlpatterns = [
    path("audio/", include("api.asset.audio.urls")),
    path("image/", include("api.asset.image.urls")),
]
