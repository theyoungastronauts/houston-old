from api import filters
from media.models import Video

class VideoFilter(filters.FilterSet):

    class Meta:
        model = Video
        fields = []
