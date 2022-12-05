from django.contrib.auth import get_user_model
from rest_framework.generics import GenericAPIView
from rest_framework.mixins import ListModelMixin, RetrieveModelMixin, UpdateModelMixin
from rest_framework import status
from rest_framework.response import Response

from connect.models import Follow
from api.permissions import IsAuthenticated
from api.user.filters import UserFilter
from api.user.querysets import ALL_USERS_QUERYSET
from api.user.serializers import (
    UserPublicSerializer,
    UserSerializer,
    UserFollowSerializer,
)

User = get_user_model()


class UserAPIView(GenericAPIView):
    queryset = ALL_USERS_QUERYSET
    serializer_class = UserPublicSerializer
    permission_classes = [IsAuthenticated]
    filterset_class = UserFilter

    search_fields = ["name"]
    ordering_fields = ["name", "created_at"]
    ordering = ["-created_at"]


class UserRetrieveView(RetrieveModelMixin, UserAPIView):
    def get(self, request, *args, **kwargs):
        return self.retrieve(request, *args, **kwargs)


class UserMeRetrieveUpdateView(RetrieveModelMixin, UpdateModelMixin, UserAPIView):
    serializer_class = UserSerializer

    def get_object(self):
        return self.request.user

    def get(self, request, *args, **kwargs):
        return self.retrieve(request, *args, **kwargs)

    def put(self, request, *args, **kwargs):
        return self.update(request, *args, **kwargs)

    def patch(self, request, *args, **kwargs):
        return self.partial_update(request, *args, **kwargs)


class UserFollowView(GenericAPIView):

    queryset = User.objects.all()
    serializer_class = UserFollowSerializer
    permission_classes = [IsAuthenticated]

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        user = self.get_object()
        owner = serializer.validated_data.get("owner")

        if bool(kwargs.get("will_follow")):
            Follow.objects.get_or_create(user=user, owner=owner)
        else:
            try:
                follow = Follow.objects.get(user=user, owner=owner)
            except Follow.DoesNotExist:
                pass
            else:
                follow.delete()

        return Response({}, status=status.HTTP_204_NO_CONTENT)


class UserListMeFollowersView(ListModelMixin, GenericAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = UserPublicSerializer
    filterset_class = UserFilter

    search_fields = ["name"]
    ordering = ["-follow_owners__created_at"]

    def get_queryset(self):
        return self.request.user.followers.filter(is_active=True)

    def get(self, request, *args, **kwargs):
        return self.list(request, *args, **kwargs)


class UserListMeFollowingView(ListModelMixin, GenericAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = UserPublicSerializer
    filterset_class = UserFilter

    search_fields = ["username"]
    ordering = ["-follow_users__created_at"]

    def get_queryset(self):
        return self.request.user.following.filter(is_active=True)

    def get(self, request, *args, **kwargs):
        return self.list(request, *args, **kwargs)
