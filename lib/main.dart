<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'screens/root_app.dart';
import 'theme/color.dart';

void main() {
=======
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hotel_booking/screens/auth/login_page.dart';
import 'logic/bloc/auth/auth_bloc.dart';
import 'theme/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
>>>>>>> master
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotel Booking',
      theme: ThemeData(
        primaryColor: primary,
      ),
      home: RootApp(),
=======
    return BlocProvider(
      create: (_) => AuthBloc(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hotel Booking',
        theme: ThemeData(
          primaryColor: primary,
        ),
        home: LoginPage(),
        navigatorObservers: [FlutterSmartDialog.observer],
        builder: FlutterSmartDialog.init(),
      ),
>>>>>>> master
    );
  }
}
