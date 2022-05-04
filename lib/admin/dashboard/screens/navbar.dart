import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:myecotrip/admin/dashboard/screens/dashboard.dart';
import 'package:myecotrip/admin/issue_ticket/screens/tickcet_form.dart';
import 'package:myecotrip/constants/config.dart';
import 'package:myecotrip/main/home/screens/home_screen.dart';
import 'package:myecotrip/main/news/screens/news_screen.dart';
import 'package:myecotrip/main/profile/screen/profile_screen.dart';
import 'package:myecotrip/main/search/screen/search_screen.dart';
import 'package:myecotrip/utils/svg_icon.dart';

import '../../ticket_scan/screen/scan_screen.dart';

class AdminMainPage extends StatefulWidget {
  const AdminMainPage({Key? key}) : super(key: key);

  @override
  State<AdminMainPage> createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage> {
  int currentindex = 0;
  List pages = const [
    AdminDashboard(),
    AdminDashboard(),
    AdminDashboard(),
    AdminDashboard(),
  ];
  getScreen() {
    switch (selected) {
      case 'scan':
        return ScanScreen();
      case 'home-filled':
        return AdminDashboard();
      case 'tickets':
        return IssueTicketForm();
      default:
    }
  }

  void onTap(int index) {
    setState(() {
      currentindex = index;
    });
  }

  void onSelected(String sel) {
    setState(() {
      selected = sel;
    });
  }

  String selected = 'home-filled';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Container(
              height: Config().deviceHeight(context),
              child: getScreen(),
            ),
            Positioned(
              bottom: 0,
              child: KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
                log("keyboard ${isKeyboardVisible}");
                if (WidgetsBinding.instance!.window.viewInsets.bottom > 0.0) {
                  // Keyboard is visible.
                  return Container();
                } else {
                  // Keyboard is not visible.
                  return Stack(
                    children: [
                      ClipPath(
                        clipper: ClipPathClass(),
                        child: Container(
                          height: 65,
                          width: Config().deviceWidth(context),
                          color: Colors.black,
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        child: Container(
                          width: Config().deviceWidth(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              icon(
                                icon: 'scan',
                                selected: selected,
                                onSelected: onSelected,
                                name: 'Scan',
                              ),
                              icon(
                                icon: 'home-filled',
                                selected: selected,
                                onSelected: onSelected,
                                name: 'Home',
                              ),
                              icon(
                                icon: 'tickets',
                                selected: selected,
                                onSelected: onSelected,
                                name: 'Ticket',
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget icon({
    required String icon,
    required String selected,
    required String name,
    required Function(String) onSelected,
  }) {
    return GestureDetector(
      onTap: () {
        onSelected(icon);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected == icon ? Colors.green[500]?.withOpacity(0.8) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SvgIcon(
              size: 24,
              color: Colors.white,
              path: '${icon}.svg',
            ),
            selected == icon
                ? Row(
                    children: [
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        name,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold, fontFamily: Nunito),
                      )
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double curveRadiusx = 20;
    double curveRadiusy = 10;
    var path = Path();
    path.lineTo(0.0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.arcToPoint(Offset(size.width - curveRadiusx, curveRadiusy), radius: Radius.circular(30));
    path.lineTo(curveRadiusx, curveRadiusy);
    path.arcToPoint(Offset(0, 0), radius: Radius.circular(30));

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

BottomNavigationBarItem navItem({
  required int index,
  required int currentIndex,
  required String name,
}) {
  return BottomNavigationBarItem(
    icon: SvgIcon(color: currentIndex == index ? Colors.green : Colors.grey, path: "${name}.svg"),
    label: name,
  );
}
