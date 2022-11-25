// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  String get uuid => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  User get owner => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_assets')
  int get numAssets => throw _privateConstructorUsedError;
  List<String> get assets => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_published')
  bool get isPublished => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {String uuid,
      String title,
      User owner,
      String body,
      @JsonKey(name: 'num_assets') int numAssets,
      List<String> assets,
      @JsonKey(name: "created_at") DateTime createdAt,
      @JsonKey(name: 'is_published') bool isPublished});

  $UserCopyWith<$Res> get owner;
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? title = null,
    Object? owner = null,
    Object? body = null,
    Object? numAssets = null,
    Object? assets = null,
    Object? createdAt = null,
    Object? isPublished = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as User,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      numAssets: null == numAssets
          ? _value.numAssets
          : numAssets // ignore: cast_nullable_to_non_nullable
              as int,
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isPublished: null == isPublished
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get owner {
    return $UserCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$_PostCopyWith(_$_Post value, $Res Function(_$_Post) then) =
      __$$_PostCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String title,
      User owner,
      String body,
      @JsonKey(name: 'num_assets') int numAssets,
      List<String> assets,
      @JsonKey(name: "created_at") DateTime createdAt,
      @JsonKey(name: 'is_published') bool isPublished});

  @override
  $UserCopyWith<$Res> get owner;
}

/// @nodoc
class __$$_PostCopyWithImpl<$Res> extends _$PostCopyWithImpl<$Res, _$_Post>
    implements _$$_PostCopyWith<$Res> {
  __$$_PostCopyWithImpl(_$_Post _value, $Res Function(_$_Post) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? title = null,
    Object? owner = null,
    Object? body = null,
    Object? numAssets = null,
    Object? assets = null,
    Object? createdAt = null,
    Object? isPublished = null,
  }) {
    return _then(_$_Post(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as User,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      numAssets: null == numAssets
          ? _value.numAssets
          : numAssets // ignore: cast_nullable_to_non_nullable
              as int,
      assets: null == assets
          ? _value._assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isPublished: null == isPublished
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Post extends _Post {
  _$_Post(
      {required this.uuid,
      required this.title,
      required this.owner,
      this.body = "",
      @JsonKey(name: 'num_assets') this.numAssets = 0,
      final List<String> assets = const [],
      @JsonKey(name: "created_at") required this.createdAt,
      @JsonKey(name: 'is_published') required this.isPublished})
      : _assets = assets,
        super._();

  factory _$_Post.fromJson(Map<String, dynamic> json) => _$$_PostFromJson(json);

  @override
  final String uuid;
  @override
  final String title;
  @override
  final User owner;
  @override
  @JsonKey()
  final String body;
  @override
  @JsonKey(name: 'num_assets')
  final int numAssets;
  final List<String> _assets;
  @override
  @JsonKey()
  List<String> get assets {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @override
  @JsonKey(name: 'is_published')
  final bool isPublished;

  @override
  String toString() {
    return 'Post(uuid: $uuid, title: $title, owner: $owner, body: $body, numAssets: $numAssets, assets: $assets, createdAt: $createdAt, isPublished: $isPublished)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Post &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.numAssets, numAssets) ||
                other.numAssets == numAssets) &&
            const DeepCollectionEquality().equals(other._assets, _assets) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isPublished, isPublished) ||
                other.isPublished == isPublished));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      title,
      owner,
      body,
      numAssets,
      const DeepCollectionEquality().hash(_assets),
      createdAt,
      isPublished);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostCopyWith<_$_Post> get copyWith =>
      __$$_PostCopyWithImpl<_$_Post>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostToJson(
      this,
    );
  }
}

abstract class _Post extends Post {
  factory _Post(
          {required final String uuid,
          required final String title,
          required final User owner,
          final String body,
          @JsonKey(name: 'num_assets') final int numAssets,
          final List<String> assets,
          @JsonKey(name: "created_at") required final DateTime createdAt,
          @JsonKey(name: 'is_published') required final bool isPublished}) =
      _$_Post;
  _Post._() : super._();

  factory _Post.fromJson(Map<String, dynamic> json) = _$_Post.fromJson;

  @override
  String get uuid;
  @override
  String get title;
  @override
  User get owner;
  @override
  String get body;
  @override
  @JsonKey(name: 'num_assets')
  int get numAssets;
  @override
  List<String> get assets;
  @override
  @JsonKey(name: "created_at")
  DateTime get createdAt;
  @override
  @JsonKey(name: 'is_published')
  bool get isPublished;
  @override
  @JsonKey(ignore: true)
  _$$_PostCopyWith<_$_Post> get copyWith => throw _privateConstructorUsedError;
}
