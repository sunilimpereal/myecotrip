import 'package:flutter/material.dart';
import 'package:myecotrip/admin/ticket_scan/screen/process_scan.dart';
import 'package:myecotrip/admin/ticket_scan/screen/scan_screen.dart';
import 'package:myecotrip/authentication/data/bloc/login_bloc.dart';
import 'package:myecotrip/authentication/data/bloc/signup_bloc.dart';
import 'package:myecotrip/authentication/screens/auth_background.dart';
import 'package:myecotrip/authentication/screens/login_screen.dart';
import 'package:myecotrip/constants/app_fonts.dart';
import 'package:myecotrip/constants/app_styles.dart';
import 'package:myecotrip/constants/config.dart';
import 'package:myecotrip/main/navpage/main_page.dart';
import 'package:myecotrip/utils/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPref.init();
  runApp(const AppWrapperProvider());
}

AppStyles appStyles = AppStyles();
AppFonts appFonts = AppFonts();

SharedPref sharedPref = SharedPref();

class AppWrapperProvider extends StatelessWidget {
  const AppWrapperProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginProvider(
      child: SignUpProvider(child: MyApp()),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecotourism',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthenticationScreen(),
    );
  }
}
