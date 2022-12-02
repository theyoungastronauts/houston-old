// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'me_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MeUser _$MeUserFromJson(Map<String, dynamic> json) {
  return _MeUser.fromJson(json);
}

/// @nodoc
mixin _$MeUser {
  String get uuid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;
  @JsonKey(name: "liked_posts")
  List<int> get likes => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeUserCopyWith<MeUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeUserCopyWith<$Res> {
  factory $MeUserCopyWith(MeUser value, $Res Function(MeUser) then) =
      _$MeUserCopyWithImpl<$Res, MeUser>;
  @useResult
  $Res call(
      {String uuid,
      String name,
      String image,
      String bio,
      @JsonKey(name: "liked_posts") List<int> likes,
      @JsonKey(name: "created_at") DateTime createdAt});
}

/// @nodoc
class _$MeUserCopyWithImpl<$Res, $Val extends MeUser>
    implements $MeUserCopyWith<$Res> {
  _$MeUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? image = null,
    Object? bio = null,
    Object? likes = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<int>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MeUserCopyWith<$Res> implements $MeUserCopyWith<$Res> {
  factory _$$_MeUserCopyWith(_$_MeUser value, $Res Function(_$_MeUser) then) =
      __$$_MeUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String name,
      String image,
      String bio,
      @JsonKey(name: "liked_posts") List<int> likes,
      @JsonKey(name: "created_at") DateTime createdAt});
}

/// @nodoc
class __$$_MeUserCopyWithImpl<$Res>
    extends _$MeUserCopyWithImpl<$Res, _$_MeUser>
    implements _$$_MeUserCopyWith<$Res> {
  __$$_MeUserCopyWithImpl(_$_MeUser _value, $Res Function(_$_MeUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? image = null,
    Object? bio = null,
    Object? likes = null,
    Object? createdAt = null,
  }) {
    return _then(_$_MeUser(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _value._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<int>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MeUser extends _MeUser {
  _$_MeUser(
      {required this.uuid,
      this.name = "",
      this.image = "",
      this.bio = "",
      @JsonKey(name: "liked_posts") required final List<int> likes,
      @JsonKey(name: "created_at") required this.createdAt})
      : _likes = likes,
        super._();

  factory _$_MeUser.fromJson(Map<String, dynamic> json) =>
      _$$_MeUserFromJson(json);

  @override
  final String uuid;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String image;
  @override
  @JsonKey()
  final String bio;
  final List<int> _likes;
  @override
  @JsonKey(name: "liked_posts")
  List<int> get likes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likes);
  }

  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;

  @override
  String toString() {
    return 'MeUser(uuid: $uuid, name: $name, image: $image, bio: $bio, likes: $likes, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MeUser &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            const DeepCollectionEquality().equals(other._likes, _likes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, name, image, bio,
      const DeepCollectionEquality().hash(_likes), createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MeUserCopyWith<_$_MeUser> get copyWith =>
      __$$_MeUserCopyWithImpl<_$_MeUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MeUserToJson(
      this,
    );
  }
}

abstract class _MeUser extends MeUser {
  factory _MeUser(
          {required final String uuid,
          final String name,
          final String image,
          final String bio,
          @JsonKey(name: "liked_posts") required final List<int> likes,
          @JsonKey(name: "created_at") required final DateTime createdAt}) =
      _$_MeUser;
  _MeUser._() : super._();

  factory _MeUser.fromJson(Map<String, dynamic> json) = _$_MeUser.fromJson;

  @override
  String get uuid;
  @override
  String get name;
  @override
  String get image;
  @override
  String get bio;
  @override
  @JsonKey(name: "liked_posts")
  List<int> get likes;
  @override
  @JsonKey(name: "created_at")
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_MeUserCopyWith<_$_MeUser> get copyWith =>
      throw _privateConstructorUsedError;
}
