import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:myecotrip/admin/reports/screens/natureGuidereport.dart';
import 'package:myecotrip/admin/reports/screens/reports_screen.dart';
import 'package:myecotrip/constants/config.dart';

class DashDrawer extends StatefulWidget {
  const DashDrawer({Key? key}) : super(key: key);

  @override
  State<DashDrawer> createState() => _DashDrawerState();
}

class _DashDrawerState extends State<DashDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Container(
        color: Color(0xfff8d9a4).withOpacity(0.1),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createHeader(),
            _createDrawerItem(
                icon: Icons.dashboard,
                text: 'Dashboard',
                onTap: () {
                  log("adsd");
                }),
            _createDrawerItem(
                icon: Icons.list_alt_rounded,
                text: 'Ticket Report',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Reports(),
                    ),
                  );
                }),
            _createDrawerItem(
                icon: Icons.library_books_sharp,
                text: 'Nature Guide Report',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NatureGuideReport(),
                    ),
                  );
                }),
            Divider(),
            _createDrawerItem(icon: Icons.settings_rounded, text: 'Settings'),
            _createDrawerItem(icon: Icons.logout, text: 'Logout'),
            ListTile(
              title: Text('0.0.1'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('path/to/header_background.png'))),
      child: Stack(children: <Widget>[
        const Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text("Eco Tourism",
                style: TextStyle(
                    color: Color(0xff10461D), fontSize: 20.0, fontWeight: FontWeight.w500))),
      ]),
    );
  }

  Widget _createDrawerItem(
      {required IconData icon, required String text, GestureTapCallback? onTap}) {
    return ListTile(
      selectedColor: Colors.green,
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Color(0xff10461D),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: TextStyle(color: Color(0xff10461D  ),
              fontFamily: Nunito,
              fontWeight:FontWeight.bold
              ),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
