// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'authenticated_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthenticatedUser _$AuthenticatedUserFromJson(Map<String, dynamic> json) {
  return _AuthenticatedUser.fromJson(json);
}

/// @nodoc
mixin _$AuthenticatedUser {
  int get id => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthenticatedUserCopyWith<AuthenticatedUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticatedUserCopyWith<$Res> {
  factory $AuthenticatedUserCopyWith(
          AuthenticatedUser value, $Res Function(AuthenticatedUser) then) =
      _$AuthenticatedUserCopyWithImpl<$Res, AuthenticatedUser>;
  @useResult
  $Res call(
      {int id,
      String uuid,
      String name,
      String image,
      @JsonKey(name: "created_at") DateTime createdAt});
}

/// @nodoc
class _$AuthenticatedUserCopyWithImpl<$Res, $Val extends AuthenticatedUser>
    implements $AuthenticatedUserCopyWith<$Res> {
  _$AuthenticatedUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? name = null,
    Object? image = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthenticatedUserCopyWith<$Res>
    implements $AuthenticatedUserCopyWith<$Res> {
  factory _$$_AuthenticatedUserCopyWith(_$_AuthenticatedUser value,
          $Res Function(_$_AuthenticatedUser) then) =
      __$$_AuthenticatedUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String uuid,
      String name,
      String image,
      @JsonKey(name: "created_at") DateTime createdAt});
}

/// @nodoc
class __$$_AuthenticatedUserCopyWithImpl<$Res>
    extends _$AuthenticatedUserCopyWithImpl<$Res, _$_AuthenticatedUser>
    implements _$$_AuthenticatedUserCopyWith<$Res> {
  __$$_AuthenticatedUserCopyWithImpl(
      _$_AuthenticatedUser _value, $Res Function(_$_AuthenticatedUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? name = null,
    Object? image = null,
    Object? createdAt = null,
  }) {
    return _then(_$_AuthenticatedUser(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthenticatedUser extends _AuthenticatedUser {
  _$_AuthenticatedUser(
      {required this.id,
      required this.uuid,
      this.name = "",
      this.image = "",
      @JsonKey(name: "created_at") required this.createdAt})
      : super._();

  factory _$_AuthenticatedUser.fromJson(Map<String, dynamic> json) =>
      _$$_AuthenticatedUserFromJson(json);

  @override
  final int id;
  @override
  final String uuid;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String image;
  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;

  @override
  String toString() {
    return 'AuthenticatedUser(id: $id, uuid: $uuid, name: $name, image: $image, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthenticatedUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, uuid, name, image, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthenticatedUserCopyWith<_$_AuthenticatedUser> get copyWith =>
      __$$_AuthenticatedUserCopyWithImpl<_$_AuthenticatedUser>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthenticatedUserToJson(
      this,
    );
  }
}

abstract class _AuthenticatedUser extends AuthenticatedUser {
  factory _AuthenticatedUser(
          {required final int id,
          required final String uuid,
          final String name,
          final String image,
          @JsonKey(name: "created_at") required final DateTime createdAt}) =
      _$_AuthenticatedUser;
  _AuthenticatedUser._() : super._();

  factory _AuthenticatedUser.fromJson(Map<String, dynamic> json) =
      _$_AuthenticatedUser.fromJson;

  @override
  int get id;
  @override
  String get uuid;
  @override
  String get name;
  @override
  String get image;
  @override
  @JsonKey(name: "created_at")
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_AuthenticatedUserCopyWith<_$_AuthenticatedUser> get copyWith =>
      throw _privateConstructorUsedError;
}
