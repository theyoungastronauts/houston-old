// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginFormModel {
  bool get processing => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginFormModelCopyWith<LoginFormModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginFormModelCopyWith<$Res> {
  factory $LoginFormModelCopyWith(
          LoginFormModel value, $Res Function(LoginFormModel) then) =
      _$LoginFormModelCopyWithImpl<$Res, LoginFormModel>;
  @useResult
  $Res call({bool processing, String email, String password});
}

/// @nodoc
class _$LoginFormModelCopyWithImpl<$Res, $Val extends LoginFormModel>
    implements $LoginFormModelCopyWith<$Res> {
  _$LoginFormModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? processing = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      processing: null == processing
          ? _value.processing
          : processing // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginFormModelCopyWith<$Res>
    implements $LoginFormModelCopyWith<$Res> {
  factory _$$_LoginFormModelCopyWith(
          _$_LoginFormModel value, $Res Function(_$_LoginFormModel) then) =
      __$$_LoginFormModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool processing, String email, String password});
}

/// @nodoc
class __$$_LoginFormModelCopyWithImpl<$Res>
    extends _$LoginFormModelCopyWithImpl<$Res, _$_LoginFormModel>
    implements _$$_LoginFormModelCopyWith<$Res> {
  __$$_LoginFormModelCopyWithImpl(
      _$_LoginFormModel _value, $Res Function(_$_LoginFormModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? processing = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_LoginFormModel(
      processing: null == processing
          ? _value.processing
          : processing // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginFormModel extends _LoginFormModel {
  _$_LoginFormModel(
      {this.processing = false, this.email = "", this.password = ""})
      : super._();

  @override
  @JsonKey()
  final bool processing;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;

  @override
  String toString() {
    return 'LoginFormModel(processing: $processing, email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginFormModel &&
            (identical(other.processing, processing) ||
                other.processing == processing) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, processing, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginFormModelCopyWith<_$_LoginFormModel> get copyWith =>
      __$$_LoginFormModelCopyWithImpl<_$_LoginFormModel>(this, _$identity);
}

abstract class _LoginFormModel extends LoginFormModel {
  factory _LoginFormModel(
      {final bool processing,
      final String email,
      final String password}) = _$_LoginFormModel;
  _LoginFormModel._() : super._();

  @override
  bool get processing;
  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_LoginFormModelCopyWith<_$_LoginFormModel> get copyWith =>
      throw _privateConstructorUsedError;
}
