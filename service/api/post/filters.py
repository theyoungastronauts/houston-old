from api import filters
from content.models.post import Post


class PostFilter(filters.FilterSet):
    owner = filters.NumberInFilter(field_name="owner")

    class Meta:
        model = Post
        fields = ["owner"]
