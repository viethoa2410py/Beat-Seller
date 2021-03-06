import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hotel_booking/global/constant/error.dart';
import 'package:hotel_booking/repository/repository.dart';
import 'package:hotel_booking/utils/extension.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationState.initial()) {
    _mapEventToState();
  }
  _mapEventToState() {
    on<Login>(_login);
    on<Register>(_register);
    on<Logout>(_logout);
  }

  final FireBaseAuthRepository _fireBaseAuthRepository =
      FireBaseAuthRepository();

  _login(Login event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    String? checkLoginError = verifyLogin(event.email, event.password);
    if (checkLoginError != null) {
      emit(state.copyWith(
          status: AuthStatus.error, errorString: checkLoginError));
    } else {
      try {
        var user = await UserRepository.login(event.email, event.password);

        if (user != null) {
          emit(state.copyWith(status: AuthStatus.logged));
        }
      } on FirebaseAuthException catch (e) {
        emit(state.copyWith(status: AuthStatus.error, errorString: e.code));
      } on Exception catch (e) {
        emit(state.copyWith(
            status: AuthStatus.error, errorString: e.toString()));
      }
    }
  }

  _register(Register event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    String? checkLoginError = verifyLogin(event.email, event.password,
        displayName: event.displayName);
    if (checkLoginError != null) {
      emit(state.copyWith(
          status: AuthStatus.error, errorString: checkLoginError));
    } else {
      try {
        var user = await UserRepository.register(
            event.email, event.password, event.displayName);
        if (user != null) {
          emit(state.copyWith(status: AuthStatus.logged));
        }
      } on FirebaseAuthException catch (e) {
        emit(state.copyWith(status: AuthStatus.error, errorString: e.code));
      } on Exception catch (e) {
        emit(state.copyWith(
            status: AuthStatus.error, errorString: e.toString()));
      }
    }
  }

  _logout(Logout event, Emitter<AuthenticationState> emit) async {
    _fireBaseAuthRepository.signOut();
    UserRepository.currentUser = null;
    emit(state.copyWith(status: AuthStatus.unknown));
  }
}
