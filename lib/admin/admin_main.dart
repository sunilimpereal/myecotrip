import 'package:flutter/material.dart';
import 'package:myecotrip/admin/dashboard/screens/dashboard.dart';
import 'package:myecotrip/admin/dashboard/screens/navbar.dart';
import 'package:myecotrip/constants/themes/admin_theme.dart';

class AdminApp extends StatelessWidget {
  const AdminApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecotourism',
      debugShowCheckedModeBanner: false,
      theme: AdminTheme,
      home: const AdminMainPage(),
    );
  }
}
