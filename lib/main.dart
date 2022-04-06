import 'package:flutter/material.dart';
import 'package:myecotrip/authentication/screens/login_screen.dart';
import 'package:myecotrip/constants/app_fonts.dart';
import 'package:myecotrip/constants/app_styles.dart';
import 'package:myecotrip/constants/config.dart';
import 'package:myecotrip/utils/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPref.init();
  runApp(const MyApp());
}

AppStyles appStyles = AppStyles();
AppFonts appFonts = AppFonts();
Config config = Config();
SharedPref sharedPref = SharedPref();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
