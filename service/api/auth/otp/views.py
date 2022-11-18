from django.contrib.auth import get_user_model
from django.core.exceptions import ValidationError
from rest_framework import status
from rest_framework.response import Response
from rest_framework_simplejwt import views as jwt_views
from rest_framework_simplejwt.tokens import RefreshToken

from access.models import OneTimePassword
from api import exceptions
from api.auth.otp.serializers import (
    OTPCreateSerializer,
    OTPValidateSerializer,
)
from api.permissions import AllowAny
from api.throttling import PathRateThrottle
from connect.sms.tasks import send_otp_sms

User = get_user_model()


class OTPCreateView(jwt_views.TokenViewBase):
    permission_classes = [AllowAny]
    serializer_class = OTPCreateSerializer
    throttle_classes = [PathRateThrottle]
    throttle_scope = "otp"

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        user, created = User.objects.get_or_create(
            number=serializer.validated_data.get("number")
        )
        send_otp_sms.apply_async(args=[user.pk])

        # Always return 204 to mislead user account number phishing
        return Response(None, status.HTTP_204_NO_CONTENT)


class OTPValidateView(jwt_views.TokenViewBase):
    permission_classes = [AllowAny]
    serializer_class = OTPValidateSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        try:
            user = User.objects.get(number=serializer.validated_data.get("number"))
        except User.DoesNotExist:
            raise exceptions.AuthenticationFailed()

        for otp in OneTimePassword.objects.filter(
            user=user, code=serializer.validated_data.get("code")
        ):
            if otp.is_valid:
                try:
                    otp.consume()
                    otp.save()
                except ValidationError:
                    continue

                refresh = RefreshToken.for_user(user)
                return Response(
                    {"access": str(refresh.access_token), "refresh": str(refresh)},
                    status.HTTP_200_OK,
                )

        raise exceptions.AuthenticationFailed()
