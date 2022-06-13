import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/blocs/bloc.dart';

class AppBloc {
  static final beatBloc = BeatBloc();
  static final audioPlayerBloc = AudioPlayerBloc();
  static final authenticationBloc = AuthenticationBloc();
  static final cartBloc = CartBloc();
  static final List<BlocProvider> provides = [
    BlocProvider<BeatBloc>(
      create: (context) => beatBloc,
    ),
    BlocProvider<AudioPlayerBloc>(
      create: (context) => audioPlayerBloc,
    ),
    BlocProvider<AuthenticationBloc>(
      create: (context) => authenticationBloc,
    ),
    BlocProvider<CartBloc>(
      create: (context) => cartBloc,
    ),
  ];

  ///Singleton factory
  static final AppBloc _instance = AppBloc._internal();

  factory AppBloc() {
    return _instance;
  }

  AppBloc._internal();
}
