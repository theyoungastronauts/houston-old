from django.urls import path, include

urlpatterns = [
    path("image/", include("api.asset.image.urls")),
]
