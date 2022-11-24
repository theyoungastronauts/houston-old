// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'new_comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewComment {
  String get postUuid => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  Comment? get parent => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewCommentCopyWith<NewComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewCommentCopyWith<$Res> {
  factory $NewCommentCopyWith(
          NewComment value, $Res Function(NewComment) then) =
      _$NewCommentCopyWithImpl<$Res, NewComment>;
  @useResult
  $Res call({String postUuid, String body, Comment? parent});

  $CommentCopyWith<$Res>? get parent;
}

/// @nodoc
class _$NewCommentCopyWithImpl<$Res, $Val extends NewComment>
    implements $NewCommentCopyWith<$Res> {
  _$NewCommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postUuid = null,
    Object? body = null,
    Object? parent = freezed,
  }) {
    return _then(_value.copyWith(
      postUuid: null == postUuid
          ? _value.postUuid
          : postUuid // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as Comment?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CommentCopyWith<$Res>? get parent {
    if (_value.parent == null) {
      return null;
    }

    return $CommentCopyWith<$Res>(_value.parent!, (value) {
      return _then(_value.copyWith(parent: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NewCommentCopyWith<$Res>
    implements $NewCommentCopyWith<$Res> {
  factory _$$_NewCommentCopyWith(
          _$_NewComment value, $Res Function(_$_NewComment) then) =
      __$$_NewCommentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String postUuid, String body, Comment? parent});

  @override
  $CommentCopyWith<$Res>? get parent;
}

/// @nodoc
class __$$_NewCommentCopyWithImpl<$Res>
    extends _$NewCommentCopyWithImpl<$Res, _$_NewComment>
    implements _$$_NewCommentCopyWith<$Res> {
  __$$_NewCommentCopyWithImpl(
      _$_NewComment _value, $Res Function(_$_NewComment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postUuid = null,
    Object? body = null,
    Object? parent = freezed,
  }) {
    return _then(_$_NewComment(
      postUuid: null == postUuid
          ? _value.postUuid
          : postUuid // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as Comment?,
    ));
  }
}

/// @nodoc

class _$_NewComment extends _NewComment {
  _$_NewComment({required this.postUuid, required this.body, this.parent})
      : super._();

  @override
  final String postUuid;
  @override
  final String body;
  @override
  final Comment? parent;

  @override
  String toString() {
    return 'NewComment(postUuid: $postUuid, body: $body, parent: $parent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewComment &&
            (identical(other.postUuid, postUuid) ||
                other.postUuid == postUuid) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.parent, parent) || other.parent == parent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postUuid, body, parent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewCommentCopyWith<_$_NewComment> get copyWith =>
      __$$_NewCommentCopyWithImpl<_$_NewComment>(this, _$identity);
}

abstract class _NewComment extends NewComment {
  factory _NewComment(
      {required final String postUuid,
      required final String body,
      final Comment? parent}) = _$_NewComment;
  _NewComment._() : super._();

  @override
  String get postUuid;
  @override
  String get body;
  @override
  Comment? get parent;
  @override
  @JsonKey(ignore: true)
  _$$_NewCommentCopyWith<_$_NewComment> get copyWith =>
      throw _privateConstructorUsedError;
}
