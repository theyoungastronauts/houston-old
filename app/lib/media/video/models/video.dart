import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../access/user/models/user.dart';

part 'video.freezed.dart';
part 'video.g.dart';

@freezed
class Video with _$Video {
  const Video._();

  factory Video({
    required int id,
    required String uuid,
    required String title,
    String? description,
    @JsonKey(defaultValue: "https://google.com") required String? url,
    @JsonKey(name: "view_count", defaultValue: 0) required int viewCount,
    User? owner,
  }) = _Video;

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
}
