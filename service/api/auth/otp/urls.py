from django.urls import path

from api.auth.otp.views import (
    OTPCreateView,
    OTPValidateView,
)

urlpatterns = [
    path("", OTPCreateView.as_view()),
    path("validate/", OTPValidateView.as_view()),
]
