part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState(
      {@Default(AuthStatus.unknown) AuthStatus status,
      String? errorString}) = _AuthenticationState;

  factory AuthenticationState.initial() => const AuthenticationState();
}
enum AuthStatus { unknown, error, logged, loading }