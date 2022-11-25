// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
mixin _$Comment {
  String get uuid => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  User get owner => throw _privateConstructorUsedError;
  List<Comment>? get children => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res, Comment>;
  @useResult
  $Res call(
      {String uuid,
      String body,
      User owner,
      List<Comment>? children,
      @JsonKey(name: 'created_at') DateTime createdAt});

  $UserCopyWith<$Res> get owner;
}

/// @nodoc
class _$CommentCopyWithImpl<$Res, $Val extends Comment>
    implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? body = null,
    Object? owner = null,
    Object? children = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as User,
      children: freezed == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
abstract class _$$_CommentCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$$_CommentCopyWith(
          _$_Comment value, $Res Function(_$_Comment) then) =
      __$$_CommentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String body,
      User owner,
      List<Comment>? children,
      @JsonKey(name: 'created_at') DateTime createdAt});

  @override
  $UserCopyWith<$Res> get owner;
}

/// @nodoc
class __$$_CommentCopyWithImpl<$Res>
    extends _$CommentCopyWithImpl<$Res, _$_Comment>
    implements _$$_CommentCopyWith<$Res> {
  __$$_CommentCopyWithImpl(_$_Comment _value, $Res Function(_$_Comment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? body = null,
    Object? owner = null,
    Object? children = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$_Comment(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as User,
      children: freezed == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Comment extends _Comment {
  _$_Comment(
      {required this.uuid,
      required this.body,
      required this.owner,
      final List<Comment>? children,
      @JsonKey(name: 'created_at') required this.createdAt})
      : _children = children,
        super._();

  factory _$_Comment.fromJson(Map<String, dynamic> json) =>
      _$$_CommentFromJson(json);

  @override
  final String uuid;
  @override
  final String body;
  @override
  final User owner;
  final List<Comment>? _children;
  @override
  List<Comment>? get children {
    final value = _children;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'Comment(uuid: $uuid, body: $body, owner: $owner, children: $children, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Comment &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, body, owner,
      const DeepCollectionEquality().hash(_children), createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentCopyWith<_$_Comment> get copyWith =>
      __$$_CommentCopyWithImpl<_$_Comment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentToJson(
      this,
    );
  }
}

abstract class _Comment extends Comment {
  factory _Comment(
          {required final String uuid,
          required final String body,
          required final User owner,
          final List<Comment>? children,
          @JsonKey(name: 'created_at') required final DateTime createdAt}) =
      _$_Comment;
  _Comment._() : super._();

  factory _Comment.fromJson(Map<String, dynamic> json) = _$_Comment.fromJson;

  @override
  String get uuid;
  @override
  String get body;
  @override
  User get owner;
  @override
  List<Comment>? get children;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_CommentCopyWith<_$_Comment> get copyWith =>
      throw _privateConstructorUsedError;
}
