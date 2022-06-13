import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:hotel_booking/blocs/app_bloc.dart';
import 'package:hotel_booking/global/constant/app_route.dart';
import 'screens/auth/login_page.dart';
import 'theme/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBloc.provides,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hotel Booking',
        theme: ThemeData(
          primaryColor: primary,
        ),
        initialRoute: LoginPage.id,
        navigatorObservers: [FlutterSmartDialog.observer],
        onGenerateRoute: AppRoute().onGenerateRoute,
        builder: FlutterSmartDialog.init(),
      ),
    );
  }
}
