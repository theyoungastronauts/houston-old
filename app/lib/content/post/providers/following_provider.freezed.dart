// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'following_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserFollowingModel {
  List<int> get followers => throw _privateConstructorUsedError;
  List<int> get following => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserFollowingModelCopyWith<UserFollowingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFollowingModelCopyWith<$Res> {
  factory $UserFollowingModelCopyWith(
          UserFollowingModel value, $Res Function(UserFollowingModel) then) =
      _$UserFollowingModelCopyWithImpl<$Res, UserFollowingModel>;
  @useResult
  $Res call({List<int> followers, List<int> following});
}

/// @nodoc
class _$UserFollowingModelCopyWithImpl<$Res, $Val extends UserFollowingModel>
    implements $UserFollowingModelCopyWith<$Res> {
  _$UserFollowingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followers = null,
    Object? following = null,
  }) {
    return _then(_value.copyWith(
      followers: null == followers
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<int>,
      following: null == following
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserFollowingModelCopyWith<$Res>
    implements $UserFollowingModelCopyWith<$Res> {
  factory _$$_UserFollowingModelCopyWith(_$_UserFollowingModel value,
          $Res Function(_$_UserFollowingModel) then) =
      __$$_UserFollowingModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int> followers, List<int> following});
}

/// @nodoc
class __$$_UserFollowingModelCopyWithImpl<$Res>
    extends _$UserFollowingModelCopyWithImpl<$Res, _$_UserFollowingModel>
    implements _$$_UserFollowingModelCopyWith<$Res> {
  __$$_UserFollowingModelCopyWithImpl(
      _$_UserFollowingModel _value, $Res Function(_$_UserFollowingModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followers = null,
    Object? following = null,
  }) {
    return _then(_$_UserFollowingModel(
      followers: null == followers
          ? _value._followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<int>,
      following: null == following
          ? _value._following
          : following // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$_UserFollowingModel extends _UserFollowingModel {
  _$_UserFollowingModel(
      {final List<int> followers = const [],
      final List<int> following = const []})
      : _followers = followers,
        _following = following,
        super._();

  final List<int> _followers;
  @override
  @JsonKey()
  List<int> get followers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_followers);
  }

  final List<int> _following;
  @override
  @JsonKey()
  List<int> get following {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_following);
  }

  @override
  String toString() {
    return 'UserFollowingModel(followers: $followers, following: $following)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserFollowingModel &&
            const DeepCollectionEquality()
                .equals(other._followers, _followers) &&
            const DeepCollectionEquality()
                .equals(other._following, _following));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_followers),
      const DeepCollectionEquality().hash(_following));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserFollowingModelCopyWith<_$_UserFollowingModel> get copyWith =>
      __$$_UserFollowingModelCopyWithImpl<_$_UserFollowingModel>(
          this, _$identity);
}

abstract class _UserFollowingModel extends UserFollowingModel {
  factory _UserFollowingModel(
      {final List<int> followers,
      final List<int> following}) = _$_UserFollowingModel;
  _UserFollowingModel._() : super._();

  @override
  List<int> get followers;
  @override
  List<int> get following;
  @override
  @JsonKey(ignore: true)
  _$$_UserFollowingModelCopyWith<_$_UserFollowingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
