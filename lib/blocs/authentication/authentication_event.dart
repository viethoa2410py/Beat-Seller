part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.login(
      {required String email, required String password}) = Login;
  const factory AuthenticationEvent.register(
      {required String email, required String password}) = Register;
  const factory AuthenticationEvent.logout() = Logout;
}

String? verifyLogin(String email, String password) {
  if (email.isEmpty) {
    return AppErrorString.emptyEmailAddress;
  }

  if (!email.isValidEmail()) {
    return AppErrorString.unvalidEmailAddress;
  }

  if (password.isEmpty) {
    return AppErrorString.emptyPassword;
  }

  if (password.length < 6) {
    return AppErrorString.notEnoughPasswordLength;
  }
}
