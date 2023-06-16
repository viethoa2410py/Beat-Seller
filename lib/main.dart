import 'package:beatSeller/screens/auth/login_page.dart';
import 'package:beatSeller/screens/root_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:beatSeller/blocs/app_bloc.dart';
import 'package:beatSeller/global/constant/app_route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'repository/user_repository.dart';
import 'theme/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isLogin;
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      initRoute();
    });
  }

  initRoute() async {
    await UserRepository.init();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var result = prefs.getBool('isLogin');
    setState(() {
      isLogin = result ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBloc.provides,
      child: MaterialApp(
        title: 'X Studio',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: primary,
        ),
        navigatorObservers: [FlutterSmartDialog.observer],
        onGenerateRoute: AppRoute().onGenerateRoute,
        builder: FlutterSmartDialog.init(),
        home: Builder(builder: (context) {
          if (isLogin == null) {
            return Container(color: Colors.white);
          }
          return isLogin! ? const RootApp() : const LoginPage();
        }),
      ),
    );
  }
}
