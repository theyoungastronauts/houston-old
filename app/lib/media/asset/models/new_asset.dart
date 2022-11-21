import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_asset.freezed.dart';
part 'new_asset.g.dart';

@freezed
class NewAsset with _$NewAsset {
  const NewAsset._();

  factory NewAsset({
    required String url,
    required Map<String, dynamic> fields,
    required bool exists,
  }) = _NewAsset;

  factory NewAsset.fromJson(Map<String, dynamic> json) => _$NewAssetFromJson(json);

  String get key {
    return fields['key'] ?? '';
  }
}
