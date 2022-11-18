from django.urls import path

from api.asset.image.views import AssetImageCreateView

urlpatterns = [
    path("", AssetImageCreateView.as_view()),
]
