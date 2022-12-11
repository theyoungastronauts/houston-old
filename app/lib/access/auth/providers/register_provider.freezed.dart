// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'register_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterFormModel {
  bool get processing => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterFormModelCopyWith<RegisterFormModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterFormModelCopyWith<$Res> {
  factory $RegisterFormModelCopyWith(
          RegisterFormModel value, $Res Function(RegisterFormModel) then) =
      _$RegisterFormModelCopyWithImpl<$Res, RegisterFormModel>;
  @useResult
  $Res call(
      {bool processing,
      String email,
      String password,
      String phoneNumber,
      String name});
}

/// @nodoc
class _$RegisterFormModelCopyWithImpl<$Res, $Val extends RegisterFormModel>
    implements $RegisterFormModelCopyWith<$Res> {
  _$RegisterFormModelCopyWithImpl(this._value, this._then);

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
    Object? phoneNumber = null,
    Object? name = null,
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
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegisterFormModelCopyWith<$Res>
    implements $RegisterFormModelCopyWith<$Res> {
  factory _$$_RegisterFormModelCopyWith(_$_RegisterFormModel value,
          $Res Function(_$_RegisterFormModel) then) =
      __$$_RegisterFormModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool processing,
      String email,
      String password,
      String phoneNumber,
      String name});
}

/// @nodoc
class __$$_RegisterFormModelCopyWithImpl<$Res>
    extends _$RegisterFormModelCopyWithImpl<$Res, _$_RegisterFormModel>
    implements _$$_RegisterFormModelCopyWith<$Res> {
  __$$_RegisterFormModelCopyWithImpl(
      _$_RegisterFormModel _value, $Res Function(_$_RegisterFormModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? processing = null,
    Object? email = null,
    Object? password = null,
    Object? phoneNumber = null,
    Object? name = null,
  }) {
    return _then(_$_RegisterFormModel(
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
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RegisterFormModel extends _RegisterFormModel {
  _$_RegisterFormModel(
      {this.processing = false,
      this.email = "",
      this.password = "",
      this.phoneNumber = "",
      this.name = ""})
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
  @JsonKey()
  final String phoneNumber;
  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'RegisterFormModel(processing: $processing, email: $email, password: $password, phoneNumber: $phoneNumber, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterFormModel &&
            (identical(other.processing, processing) ||
                other.processing == processing) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, processing, email, password, phoneNumber, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterFormModelCopyWith<_$_RegisterFormModel> get copyWith =>
      __$$_RegisterFormModelCopyWithImpl<_$_RegisterFormModel>(
          this, _$identity);
}

abstract class _RegisterFormModel extends RegisterFormModel {
  factory _RegisterFormModel(
      {final bool processing,
      final String email,
      final String password,
      final String phoneNumber,
      final String name}) = _$_RegisterFormModel;
  _RegisterFormModel._() : super._();

  @override
  bool get processing;
  @override
  String get email;
  @override
  String get password;
  @override
  String get phoneNumber;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterFormModelCopyWith<_$_RegisterFormModel> get copyWith =>
      throw _privateConstructorUsedError;
}
