from django.urls import path

from api.asset.image.views import ImageCreateRetrieveView

urlpatterns = [
    path("", ImageCreateRetrieveView.as_view()),
]
