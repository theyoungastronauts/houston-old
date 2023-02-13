// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Asset _$AssetFromJson(Map<String, dynamic> json) {
  return _Asset.fromJson(json);
}

/// @nodoc
mixin _$Asset {
  @JsonKey(name: "content_length")
  int get contentLength => throw _privateConstructorUsedError;
  @JsonKey(name: "content_type")
  String get contentType => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool get exists => throw _privateConstructorUsedError;
  @JsonKey(name: "is_blocked")
  bool get isBlocked => throw _privateConstructorUsedError;
  @JsonKey(name: "is_verified")
  bool get isVerified => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: {})
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssetCopyWith<Asset> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetCopyWith<$Res> {
  factory $AssetCopyWith(Asset value, $Res Function(Asset) then) =
      _$AssetCopyWithImpl<$Res, Asset>;
  @useResult
  $Res call(
      {@JsonKey(name: "content_length") int contentLength,
      @JsonKey(name: "content_type") String contentType,
      @JsonKey(name: "created_at") DateTime createdAt,
      bool exists,
      @JsonKey(name: "is_blocked") bool isBlocked,
      @JsonKey(name: "is_verified") bool isVerified,
      String key,
      @JsonKey(defaultValue: {}) Map<String, dynamic> metadata,
      String path,
      String uuid});
}

/// @nodoc
class _$AssetCopyWithImpl<$Res, $Val extends Asset>
    implements $AssetCopyWith<$Res> {
  _$AssetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentLength = null,
    Object? contentType = null,
    Object? createdAt = null,
    Object? exists = null,
    Object? isBlocked = null,
    Object? isVerified = null,
    Object? key = null,
    Object? metadata = null,
    Object? path = null,
    Object? uuid = null,
  }) {
    return _then(_value.copyWith(
      contentLength: null == contentLength
          ? _value.contentLength
          : contentLength // ignore: cast_nullable_to_non_nullable
              as int,
      contentType: null == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      exists: null == exists
          ? _value.exists
          : exists // ignore: cast_nullable_to_non_nullable
              as bool,
      isBlocked: null == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AssetCopyWith<$Res> implements $AssetCopyWith<$Res> {
  factory _$$_AssetCopyWith(_$_Asset value, $Res Function(_$_Asset) then) =
      __$$_AssetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "content_length") int contentLength,
      @JsonKey(name: "content_type") String contentType,
      @JsonKey(name: "created_at") DateTime createdAt,
      bool exists,
      @JsonKey(name: "is_blocked") bool isBlocked,
      @JsonKey(name: "is_verified") bool isVerified,
      String key,
      @JsonKey(defaultValue: {}) Map<String, dynamic> metadata,
      String path,
      String uuid});
}

/// @nodoc
class __$$_AssetCopyWithImpl<$Res> extends _$AssetCopyWithImpl<$Res, _$_Asset>
    implements _$$_AssetCopyWith<$Res> {
  __$$_AssetCopyWithImpl(_$_Asset _value, $Res Function(_$_Asset) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentLength = null,
    Object? contentType = null,
    Object? createdAt = null,
    Object? exists = null,
    Object? isBlocked = null,
    Object? isVerified = null,
    Object? key = null,
    Object? metadata = null,
    Object? path = null,
    Object? uuid = null,
  }) {
    return _then(_$_Asset(
      contentLength: null == contentLength
          ? _value.contentLength
          : contentLength // ignore: cast_nullable_to_non_nullable
              as int,
      contentType: null == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      exists: null == exists
          ? _value.exists
          : exists // ignore: cast_nullable_to_non_nullable
              as bool,
      isBlocked: null == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Asset extends _Asset {
  _$_Asset(
      {@JsonKey(name: "content_length") required this.contentLength,
      @JsonKey(name: "content_type") required this.contentType,
      @JsonKey(name: "created_at") required this.createdAt,
      required this.exists,
      @JsonKey(name: "is_blocked") required this.isBlocked,
      @JsonKey(name: "is_verified") required this.isVerified,
      required this.key,
      @JsonKey(defaultValue: {}) required final Map<String, dynamic> metadata,
      required this.path,
      required this.uuid})
      : _metadata = metadata,
        super._();

  factory _$_Asset.fromJson(Map<String, dynamic> json) =>
      _$$_AssetFromJson(json);

  @override
  @JsonKey(name: "content_length")
  final int contentLength;
  @override
  @JsonKey(name: "content_type")
  final String contentType;
  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @override
  final bool exists;
  @override
  @JsonKey(name: "is_blocked")
  final bool isBlocked;
  @override
  @JsonKey(name: "is_verified")
  final bool isVerified;
  @override
  final String key;
  final Map<String, dynamic> _metadata;
  @override
  @JsonKey(defaultValue: {})
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  final String path;
  @override
  final String uuid;

  @override
  String toString() {
    return 'Asset(contentLength: $contentLength, contentType: $contentType, createdAt: $createdAt, exists: $exists, isBlocked: $isBlocked, isVerified: $isVerified, key: $key, metadata: $metadata, path: $path, uuid: $uuid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Asset &&
            (identical(other.contentLength, contentLength) ||
                other.contentLength == contentLength) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.exists, exists) || other.exists == exists) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.key, key) || other.key == key) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      contentLength,
      contentType,
      createdAt,
      exists,
      isBlocked,
      isVerified,
      key,
      const DeepCollectionEquality().hash(_metadata),
      path,
      uuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AssetCopyWith<_$_Asset> get copyWith =>
      __$$_AssetCopyWithImpl<_$_Asset>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AssetToJson(
      this,
    );
  }
}

abstract class _Asset extends Asset {
  factory _Asset(
      {@JsonKey(name: "content_length") required final int contentLength,
      @JsonKey(name: "content_type") required final String contentType,
      @JsonKey(name: "created_at") required final DateTime createdAt,
      required final bool exists,
      @JsonKey(name: "is_blocked") required final bool isBlocked,
      @JsonKey(name: "is_verified") required final bool isVerified,
      required final String key,
      @JsonKey(defaultValue: {}) required final Map<String, dynamic> metadata,
      required final String path,
      required final String uuid}) = _$_Asset;
  _Asset._() : super._();

  factory _Asset.fromJson(Map<String, dynamic> json) = _$_Asset.fromJson;

  @override
  @JsonKey(name: "content_length")
  int get contentLength;
  @override
  @JsonKey(name: "content_type")
  String get contentType;
  @override
  @JsonKey(name: "created_at")
  DateTime get createdAt;
  @override
  bool get exists;
  @override
  @JsonKey(name: "is_blocked")
  bool get isBlocked;
  @override
  @JsonKey(name: "is_verified")
  bool get isVerified;
  @override
  String get key;
  @override
  @JsonKey(defaultValue: {})
  Map<String, dynamic> get metadata;
  @override
  String get path;
  @override
  String get uuid;
  @override
  @JsonKey(ignore: true)
  _$$_AssetCopyWith<_$_Asset> get copyWith =>
      throw _privateConstructorUsedError;
}
