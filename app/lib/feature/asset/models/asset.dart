import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:houston_app/core/utils/env.dart';

part 'asset.freezed.dart';
part 'asset.g.dart';

@freezed
class Asset with _$Asset {
  const Asset._();

  factory Asset({
    @JsonKey(name: "content_length") required int contentLength,
    @JsonKey(name: "content_type") required String contentType,
    @JsonKey(name: "created_at") required DateTime createdAt,
    required bool exists,
    @JsonKey(name: "is_blocked") required bool isBlocked,
    @JsonKey(name: "is_verified") required bool isVerified,
    required String key,
    @JsonKey(defaultValue: {}) required Map<String, dynamic> metadata,
    required String path,
    required String uuid,
  }) = _Asset;

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);

  String get url {
    return "${Env.mediaBaseUrl}/$key";
  }
}
