from phonenumber_field.serializerfields import PhoneNumberField
from rest_framework import serializers


class OTPCreateSerializer(serializers.Serializer):
    number = PhoneNumberField()


class OTPValidateSerializer(serializers.Serializer):
    number = PhoneNumberField()
    code = serializers.CharField()
