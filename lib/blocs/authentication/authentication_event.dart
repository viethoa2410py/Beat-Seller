part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.login(
      {required String email, required String password}) = Login;
  const factory AuthenticationEvent.sendCode({required String email}) =
      SendCode;
  const factory AuthenticationEvent.updatePass(
      {required String email,
      required String code,
      required String newPass}) = UpdatePass;
  const factory AuthenticationEvent.register(
      {required String email,
      required String password,
      required String displayName}) = Register;
  const factory AuthenticationEvent.logout() = Logout;
}

String? verifyLogin(String email, String password, {String? displayName}) {
  if (email.isEmpty) {
    return AppErrorString.emptyEmailAddress;
  }

  if (!email.isValidEmail()) {
    return AppErrorString.unvalidEmailAddress;
  }
  if (displayName != null) if (displayName.isEmpty) {
    return AppErrorString.emptyEmailAddress;
  }

  if (password.isEmpty) {
    return AppErrorString.emptyPassword;
  }

  if (password.length < 6) {
    return AppErrorString.notEnoughPasswordLength;
  }
  return null;
}
