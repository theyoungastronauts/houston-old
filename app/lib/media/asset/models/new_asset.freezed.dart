// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_asset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewAsset _$NewAssetFromJson(Map<String, dynamic> json) {
  return _NewAsset.fromJson(json);
}

/// @nodoc
mixin _$NewAsset {
  String get url => throw _privateConstructorUsedError;
  Map<String, dynamic> get fields => throw _privateConstructorUsedError;
  bool get exists => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewAssetCopyWith<NewAsset> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewAssetCopyWith<$Res> {
  factory $NewAssetCopyWith(NewAsset value, $Res Function(NewAsset) then) =
      _$NewAssetCopyWithImpl<$Res, NewAsset>;
  @useResult
  $Res call({String url, Map<String, dynamic> fields, bool exists});
}

/// @nodoc
class _$NewAssetCopyWithImpl<$Res, $Val extends NewAsset>
    implements $NewAssetCopyWith<$Res> {
  _$NewAssetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? fields = null,
    Object? exists = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      exists: null == exists
          ? _value.exists
          : exists // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewAssetCopyWith<$Res> implements $NewAssetCopyWith<$Res> {
  factory _$$_NewAssetCopyWith(
          _$_NewAsset value, $Res Function(_$_NewAsset) then) =
      __$$_NewAssetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url, Map<String, dynamic> fields, bool exists});
}

/// @nodoc
class __$$_NewAssetCopyWithImpl<$Res>
    extends _$NewAssetCopyWithImpl<$Res, _$_NewAsset>
    implements _$$_NewAssetCopyWith<$Res> {
  __$$_NewAssetCopyWithImpl(
      _$_NewAsset _value, $Res Function(_$_NewAsset) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? fields = null,
    Object? exists = null,
  }) {
    return _then(_$_NewAsset(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      fields: null == fields
          ? _value._fields
          : fields // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      exists: null == exists
          ? _value.exists
          : exists // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewAsset extends _NewAsset {
  _$_NewAsset(
      {required this.url,
      required final Map<String, dynamic> fields,
      required this.exists})
      : _fields = fields,
        super._();

  factory _$_NewAsset.fromJson(Map<String, dynamic> json) =>
      _$$_NewAssetFromJson(json);

  @override
  final String url;
  final Map<String, dynamic> _fields;
  @override
  Map<String, dynamic> get fields {
    if (_fields is EqualUnmodifiableMapView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_fields);
  }

  @override
  final bool exists;

  @override
  String toString() {
    return 'NewAsset(url: $url, fields: $fields, exists: $exists)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewAsset &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality().equals(other._fields, _fields) &&
            (identical(other.exists, exists) || other.exists == exists));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, url, const DeepCollectionEquality().hash(_fields), exists);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewAssetCopyWith<_$_NewAsset> get copyWith =>
      __$$_NewAssetCopyWithImpl<_$_NewAsset>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewAssetToJson(
      this,
    );
  }
}

abstract class _NewAsset extends NewAsset {
  factory _NewAsset(
      {required final String url,
      required final Map<String, dynamic> fields,
      required final bool exists}) = _$_NewAsset;
  _NewAsset._() : super._();

  factory _NewAsset.fromJson(Map<String, dynamic> json) = _$_NewAsset.fromJson;

  @override
  String get url;
  @override
  Map<String, dynamic> get fields;
  @override
  bool get exists;
  @override
  @JsonKey(ignore: true)
  _$$_NewAssetCopyWith<_$_NewAsset> get copyWith =>
      throw _privateConstructorUsedError;
}
