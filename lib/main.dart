import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myecotrip/admin/admin_main.dart';
import 'package:myecotrip/admin/dashboard/screens/dashboard.dart';
import 'package:myecotrip/admin/reports/screens/reports_screen.dart';
import 'package:myecotrip/admin/ticket_scan/screen/process_scan.dart';
import 'package:myecotrip/admin/ticket_scan/screen/scan_screen.dart';
import 'package:myecotrip/authentication/data/bloc/login_bloc.dart';
import 'package:myecotrip/authentication/data/bloc/signup_bloc.dart';
import 'package:myecotrip/authentication/screens/auth_background.dart';
import 'package:myecotrip/authentication/screens/login_screen.dart';
import 'package:myecotrip/constants/app_fonts.dart';
import 'package:myecotrip/constants/app_styles.dart';
import 'package:myecotrip/constants/config.dart';
import 'package:myecotrip/constants/themes/theme.dart';
import 'package:myecotrip/main/navpage/main_page.dart';
import 'package:myecotrip/utils/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPref.init();
  runApp(const AppWrapperProvider());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
}
late int printerStatus;

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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription subscription;
  late StreamSubscription printStatusSubscribtion;

  @override
  void initState() {
      const EventChannel _stream = EventChannel('printingStatus');
    _stream.receiveBroadcastStream().listen((event) {
      printerStatus = event;
      print("Printer status: $event");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecotourism',
      debugShowCheckedModeBanner: false,
      theme: MainTheme,
      //  home: const AuthenticationScreen(),
      home: const AdminApp(),
    );
  }
}
