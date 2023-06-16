// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthenticationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function(String email) sendCode,
    required TResult Function(String email, String code, String newPass)
        updatePass,
    required TResult Function(String email, String password, String displayName)
        register,
    required TResult Function() logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? login,
    TResult? Function(String email)? sendCode,
    TResult? Function(String email, String code, String newPass)? updatePass,
    TResult? Function(String email, String password, String displayName)?
        register,
    TResult? Function()? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(String email)? sendCode,
    TResult Function(String email, String code, String newPass)? updatePass,
    TResult Function(String email, String password, String displayName)?
        register,
    TResult Function()? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Login value) login,
    required TResult Function(SendCode value) sendCode,
    required TResult Function(UpdatePass value) updatePass,
    required TResult Function(Register value) register,
    required TResult Function(Logout value) logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Login value)? login,
    TResult? Function(SendCode value)? sendCode,
    TResult? Function(UpdatePass value)? updatePass,
    TResult? Function(Register value)? register,
    TResult? Function(Logout value)? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Login value)? login,
    TResult Function(SendCode value)? sendCode,
    TResult Function(UpdatePass value)? updatePass,
    TResult Function(Register value)? register,
    TResult Function(Logout value)? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationEventCopyWith<$Res> {
  factory $AuthenticationEventCopyWith(
          AuthenticationEvent value, $Res Function(AuthenticationEvent) then) =
      _$AuthenticationEventCopyWithImpl<$Res, AuthenticationEvent>;
}

/// @nodoc
class _$AuthenticationEventCopyWithImpl<$Res, $Val extends AuthenticationEvent>
    implements $AuthenticationEventCopyWith<$Res> {
  _$AuthenticationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoginCopyWith<$Res> {
  factory _$$LoginCopyWith(_$Login value, $Res Function(_$Login) then) =
      __$$LoginCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$LoginCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$Login>
    implements _$$LoginCopyWith<$Res> {
  __$$LoginCopyWithImpl(_$Login _value, $Res Function(_$Login) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$Login(
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

class _$Login implements Login {
  const _$Login({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthenticationEvent.login(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Login &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginCopyWith<_$Login> get copyWith =>
      __$$LoginCopyWithImpl<_$Login>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function(String email) sendCode,
    required TResult Function(String email, String code, String newPass)
        updatePass,
    required TResult Function(String email, String password, String displayName)
        register,
    required TResult Function() logout,
  }) {
    return login(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? login,
    TResult? Function(String email)? sendCode,
    TResult? Function(String email, String code, String newPass)? updatePass,
    TResult? Function(String email, String password, String displayName)?
        register,
    TResult? Function()? logout,
  }) {
    return login?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(String email)? sendCode,
    TResult Function(String email, String code, String newPass)? updatePass,
    TResult Function(String email, String password, String displayName)?
        register,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Login value) login,
    required TResult Function(SendCode value) sendCode,
    required TResult Function(UpdatePass value) updatePass,
    required TResult Function(Register value) register,
    required TResult Function(Logout value) logout,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Login value)? login,
    TResult? Function(SendCode value)? sendCode,
    TResult? Function(UpdatePass value)? updatePass,
    TResult? Function(Register value)? register,
    TResult? Function(Logout value)? logout,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Login value)? login,
    TResult Function(SendCode value)? sendCode,
    TResult Function(UpdatePass value)? updatePass,
    TResult Function(Register value)? register,
    TResult Function(Logout value)? logout,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class Login implements AuthenticationEvent {
  const factory Login(
      {required final String email, required final String password}) = _$Login;

  String get email;
  String get password;
  @JsonKey(ignore: true)
  _$$LoginCopyWith<_$Login> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendCodeCopyWith<$Res> {
  factory _$$SendCodeCopyWith(
          _$SendCode value, $Res Function(_$SendCode) then) =
      __$$SendCodeCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$SendCodeCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$SendCode>
    implements _$$SendCodeCopyWith<$Res> {
  __$$SendCodeCopyWithImpl(_$SendCode _value, $Res Function(_$SendCode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$SendCode(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendCode implements SendCode {
  const _$SendCode({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'AuthenticationEvent.sendCode(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendCode &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendCodeCopyWith<_$SendCode> get copyWith =>
      __$$SendCodeCopyWithImpl<_$SendCode>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function(String email) sendCode,
    required TResult Function(String email, String code, String newPass)
        updatePass,
    required TResult Function(String email, String password, String displayName)
        register,
    required TResult Function() logout,
  }) {
    return sendCode(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? login,
    TResult? Function(String email)? sendCode,
    TResult? Function(String email, String code, String newPass)? updatePass,
    TResult? Function(String email, String password, String displayName)?
        register,
    TResult? Function()? logout,
  }) {
    return sendCode?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(String email)? sendCode,
    TResult Function(String email, String code, String newPass)? updatePass,
    TResult Function(String email, String password, String displayName)?
        register,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (sendCode != null) {
      return sendCode(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Login value) login,
    required TResult Function(SendCode value) sendCode,
    required TResult Function(UpdatePass value) updatePass,
    required TResult Function(Register value) register,
    required TResult Function(Logout value) logout,
  }) {
    return sendCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Login value)? login,
    TResult? Function(SendCode value)? sendCode,
    TResult? Function(UpdatePass value)? updatePass,
    TResult? Function(Register value)? register,
    TResult? Function(Logout value)? logout,
  }) {
    return sendCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Login value)? login,
    TResult Function(SendCode value)? sendCode,
    TResult Function(UpdatePass value)? updatePass,
    TResult Function(Register value)? register,
    TResult Function(Logout value)? logout,
    required TResult orElse(),
  }) {
    if (sendCode != null) {
      return sendCode(this);
    }
    return orElse();
  }
}

abstract class SendCode implements AuthenticationEvent {
  const factory SendCode({required final String email}) = _$SendCode;

  String get email;
  @JsonKey(ignore: true)
  _$$SendCodeCopyWith<_$SendCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePassCopyWith<$Res> {
  factory _$$UpdatePassCopyWith(
          _$UpdatePass value, $Res Function(_$UpdatePass) then) =
      __$$UpdatePassCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String code, String newPass});
}

/// @nodoc
class __$$UpdatePassCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$UpdatePass>
    implements _$$UpdatePassCopyWith<$Res> {
  __$$UpdatePassCopyWithImpl(
      _$UpdatePass _value, $Res Function(_$UpdatePass) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? code = null,
    Object? newPass = null,
  }) {
    return _then(_$UpdatePass(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      newPass: null == newPass
          ? _value.newPass
          : newPass // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdatePass implements UpdatePass {
  const _$UpdatePass(
      {required this.email, required this.code, required this.newPass});

  @override
  final String email;
  @override
  final String code;
  @override
  final String newPass;

  @override
  String toString() {
    return 'AuthenticationEvent.updatePass(email: $email, code: $code, newPass: $newPass)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePass &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.newPass, newPass) || other.newPass == newPass));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, code, newPass);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePassCopyWith<_$UpdatePass> get copyWith =>
      __$$UpdatePassCopyWithImpl<_$UpdatePass>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function(String email) sendCode,
    required TResult Function(String email, String code, String newPass)
        updatePass,
    required TResult Function(String email, String password, String displayName)
        register,
    required TResult Function() logout,
  }) {
    return updatePass(email, code, newPass);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? login,
    TResult? Function(String email)? sendCode,
    TResult? Function(String email, String code, String newPass)? updatePass,
    TResult? Function(String email, String password, String displayName)?
        register,
    TResult? Function()? logout,
  }) {
    return updatePass?.call(email, code, newPass);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(String email)? sendCode,
    TResult Function(String email, String code, String newPass)? updatePass,
    TResult Function(String email, String password, String displayName)?
        register,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (updatePass != null) {
      return updatePass(email, code, newPass);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Login value) login,
    required TResult Function(SendCode value) sendCode,
    required TResult Function(UpdatePass value) updatePass,
    required TResult Function(Register value) register,
    required TResult Function(Logout value) logout,
  }) {
    return updatePass(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Login value)? login,
    TResult? Function(SendCode value)? sendCode,
    TResult? Function(UpdatePass value)? updatePass,
    TResult? Function(Register value)? register,
    TResult? Function(Logout value)? logout,
  }) {
    return updatePass?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Login value)? login,
    TResult Function(SendCode value)? sendCode,
    TResult Function(UpdatePass value)? updatePass,
    TResult Function(Register value)? register,
    TResult Function(Logout value)? logout,
    required TResult orElse(),
  }) {
    if (updatePass != null) {
      return updatePass(this);
    }
    return orElse();
  }
}

abstract class UpdatePass implements AuthenticationEvent {
  const factory UpdatePass(
      {required final String email,
      required final String code,
      required final String newPass}) = _$UpdatePass;

  String get email;
  String get code;
  String get newPass;
  @JsonKey(ignore: true)
  _$$UpdatePassCopyWith<_$UpdatePass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterCopyWith<$Res> {
  factory _$$RegisterCopyWith(
          _$Register value, $Res Function(_$Register) then) =
      __$$RegisterCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password, String displayName});
}

/// @nodoc
class __$$RegisterCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$Register>
    implements _$$RegisterCopyWith<$Res> {
  __$$RegisterCopyWithImpl(_$Register _value, $Res Function(_$Register) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? displayName = null,
  }) {
    return _then(_$Register(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Register implements Register {
  const _$Register(
      {required this.email, required this.password, required this.displayName});

  @override
  final String email;
  @override
  final String password;
  @override
  final String displayName;

  @override
  String toString() {
    return 'AuthenticationEvent.register(email: $email, password: $password, displayName: $displayName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Register &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password, displayName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterCopyWith<_$Register> get copyWith =>
      __$$RegisterCopyWithImpl<_$Register>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function(String email) sendCode,
    required TResult Function(String email, String code, String newPass)
        updatePass,
    required TResult Function(String email, String password, String displayName)
        register,
    required TResult Function() logout,
  }) {
    return register(email, password, displayName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? login,
    TResult? Function(String email)? sendCode,
    TResult? Function(String email, String code, String newPass)? updatePass,
    TResult? Function(String email, String password, String displayName)?
        register,
    TResult? Function()? logout,
  }) {
    return register?.call(email, password, displayName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(String email)? sendCode,
    TResult Function(String email, String code, String newPass)? updatePass,
    TResult Function(String email, String password, String displayName)?
        register,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(email, password, displayName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Login value) login,
    required TResult Function(SendCode value) sendCode,
    required TResult Function(UpdatePass value) updatePass,
    required TResult Function(Register value) register,
    required TResult Function(Logout value) logout,
  }) {
    return register(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Login value)? login,
    TResult? Function(SendCode value)? sendCode,
    TResult? Function(UpdatePass value)? updatePass,
    TResult? Function(Register value)? register,
    TResult? Function(Logout value)? logout,
  }) {
    return register?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Login value)? login,
    TResult Function(SendCode value)? sendCode,
    TResult Function(UpdatePass value)? updatePass,
    TResult Function(Register value)? register,
    TResult Function(Logout value)? logout,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(this);
    }
    return orElse();
  }
}

abstract class Register implements AuthenticationEvent {
  const factory Register(
      {required final String email,
      required final String password,
      required final String displayName}) = _$Register;

  String get email;
  String get password;
  String get displayName;
  @JsonKey(ignore: true)
  _$$RegisterCopyWith<_$Register> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogoutCopyWith<$Res> {
  factory _$$LogoutCopyWith(_$Logout value, $Res Function(_$Logout) then) =
      __$$LogoutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$Logout>
    implements _$$LogoutCopyWith<$Res> {
  __$$LogoutCopyWithImpl(_$Logout _value, $Res Function(_$Logout) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Logout implements Logout {
  const _$Logout();

  @override
  String toString() {
    return 'AuthenticationEvent.logout()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Logout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function(String email) sendCode,
    required TResult Function(String email, String code, String newPass)
        updatePass,
    required TResult Function(String email, String password, String displayName)
        register,
    required TResult Function() logout,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? login,
    TResult? Function(String email)? sendCode,
    TResult? Function(String email, String code, String newPass)? updatePass,
    TResult? Function(String email, String password, String displayName)?
        register,
    TResult? Function()? logout,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(String email)? sendCode,
    TResult Function(String email, String code, String newPass)? updatePass,
    TResult Function(String email, String password, String displayName)?
        register,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Login value) login,
    required TResult Function(SendCode value) sendCode,
    required TResult Function(UpdatePass value) updatePass,
    required TResult Function(Register value) register,
    required TResult Function(Logout value) logout,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Login value)? login,
    TResult? Function(SendCode value)? sendCode,
    TResult? Function(UpdatePass value)? updatePass,
    TResult? Function(Register value)? register,
    TResult? Function(Logout value)? logout,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Login value)? login,
    TResult Function(SendCode value)? sendCode,
    TResult Function(UpdatePass value)? updatePass,
    TResult Function(Register value)? register,
    TResult Function(Logout value)? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class Logout implements AuthenticationEvent {
  const factory Logout() = _$Logout;
}

/// @nodoc
mixin _$AuthenticationState {
  AuthStatus get status => throw _privateConstructorUsedError;
  String? get errorString => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthenticationStateCopyWith<AuthenticationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res, AuthenticationState>;
  @useResult
  $Res call({AuthStatus status, String? errorString});
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res, $Val extends AuthenticationState>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorString = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      errorString: freezed == errorString
          ? _value.errorString
          : errorString // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthenticationStateCopyWith<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  factory _$$_AuthenticationStateCopyWith(_$_AuthenticationState value,
          $Res Function(_$_AuthenticationState) then) =
      __$$_AuthenticationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthStatus status, String? errorString});
}

/// @nodoc
class __$$_AuthenticationStateCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$_AuthenticationState>
    implements _$$_AuthenticationStateCopyWith<$Res> {
  __$$_AuthenticationStateCopyWithImpl(_$_AuthenticationState _value,
      $Res Function(_$_AuthenticationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorString = freezed,
  }) {
    return _then(_$_AuthenticationState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      errorString: freezed == errorString
          ? _value.errorString
          : errorString // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AuthenticationState implements _AuthenticationState {
  const _$_AuthenticationState(
      {this.status = AuthStatus.unknown, this.errorString});

  @override
  @JsonKey()
  final AuthStatus status;
  @override
  final String? errorString;

  @override
  String toString() {
    return 'AuthenticationState(status: $status, errorString: $errorString)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthenticationState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorString, errorString) ||
                other.errorString == errorString));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorString);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthenticationStateCopyWith<_$_AuthenticationState> get copyWith =>
      __$$_AuthenticationStateCopyWithImpl<_$_AuthenticationState>(
          this, _$identity);
}

abstract class _AuthenticationState implements AuthenticationState {
  const factory _AuthenticationState(
      {final AuthStatus status,
      final String? errorString}) = _$_AuthenticationState;

  @override
  AuthStatus get status;
  @override
  String? get errorString;
  @override
  @JsonKey(ignore: true)
  _$$_AuthenticationStateCopyWith<_$_AuthenticationState> get copyWith =>
      throw _privateConstructorUsedError;
}
