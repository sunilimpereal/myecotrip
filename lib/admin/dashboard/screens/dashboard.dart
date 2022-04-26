// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myecotrip/admin/dashboard/screens/widgets/adbutton.dart';
import 'package:myecotrip/admin/dashboard/screens/widgets/dashboardAppBar.dart';
import 'package:myecotrip/admin/dashboard/screens/widgets/dashboard_card.dart';
import 'package:myecotrip/admin/dashboard/screens/widgets/dashcard.dart';
import 'package:myecotrip/admin/dashboard/screens/widgets/drawer.dart';
import 'package:myecotrip/admin/issue_ticket/screens/select_landscape.dart';
import 'package:myecotrip/admin/issue_ticket/screens/tickcet_form.dart';
import 'package:myecotrip/admin/reports/screens/reports_screen.dart';
import 'package:myecotrip/admin/ticket_scan/screen/scan_screen.dart';
import 'package:myecotrip/constants/config.dart';
import 'package:myecotrip/main/Trekking_Details_page/Widgets/app_bar.dart';
import 'package:myecotrip/main/Trekking_Details_page/Widgets/back_button.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  List<GradientColors> colors = [
    GradientColors(
      color1: Color(0xffBFF3BF),
      color2: Color(0xffB3E3B3),
    ),
    GradientColors(
      color1: Color(0xffDEDEFF),
      color2: Color(0xffC3C3E1),
    ),
    GradientColors(
      color1: Color(0xffF2BFBF),
      color2: Color(0xffE3B3B3),
    ),
    GradientColors(
      color1: Color(0xffF2EDBF),
      color2: Color(0xffE3E1B3),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _key,
        drawer: Drawer(child: DashDrawer()),
        body: SafeArea(
          child: Stack(
            children: [
              //body
              Stack(
                children: [
                  Container(
                      padding: EdgeInsets.only(top: Config().deviceHeight(context) * 0.148),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TrekDetails(),
                          // Reportcard(),
                        ],
                      )),
                  DashboardAppBar(),
                ],
              ),

              // bottom buttons
              // Positioned(
              //   bottom: 0,
              //   child: Container(
              //     width: Config().deviceWidth(context),
              //     color: Colors.white,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         AdButton(
              //           width: Config().deviceWidth(context) * 0.5,
              //           icon: Icons.calendar_view_day_rounded,
              //           color: Colors.white,
              //           textColor: Colors.green,
              //           onPressed: () {
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) => IssueTicketForm(),
              //               ),
              //             );
              //           },
              //           text: 'Ticket',
              //         ),
              //         AdButton(
              //           width: Config().deviceWidth(context) * 0.5,
              //           icon: Icons.qr_code,
              //           onPressed: () {
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) => ScanScreen(),
              //               ),
              //             );
              //           },
              //           text: 'Scan',
              //         ),
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget TrekDetails() {
    return Container(
      height: Config().deviceHeight(context) * 0.78,
      child: SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.start,
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DashCard(
                colors: colors[0],
                location: 'Bengaluru',
                visitors: '15',
                total: '30',
                slot: '6:30 AM',
                name: 'Makalidurga',
              ),
              DashCard(
                colors: colors[1],
                location: 'Bengaluru',
                visitors: '15',
                total: '30',
                slot: '6:00 AM',
                name: 'Kaiwara Betta',
              ),
              DashCard(
                colors: colors[2],
                location: 'Bengaluru',
                visitors: '15',
                total: '30',
                slot: '6:30 AM',
                name: 'Skandagiri',
              ),
              DashCard(
                colors: colors[3],
                location: 'Bengaluru',
                visitors: '15',
                total: '30',
                slot: '6:30 AM',
                name: 'Madikere',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Reportcard() {
    return Material(
      elevation: 5,
      shadowColor: Colors.white10,
      child: Ink(
        child: Center(
          child: InkWell(
            splashColor: Colors.green[50],
            highlightColor: Colors.transparent,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Reports(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Material(
                        elevation: 5,
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                        clipBehavior: Clip.hardEdge,
                        child: Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            // color: Colors.blue,
                            image: DecorationImage(
                              image: AssetImage(IMAGES + 'report_icon_img.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "Report",
                          style: TextStyle(
                              color: Colors.green[800], fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                  CustomIconButton(
                    onTap: () {},
                    iconData: Icons.keyboard_arrow_right_rounded,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget trekTitle() {
    return Container(
      width: Config().deviceWidth(context),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Text(
              'Treks',
              style: TextStyle(
                  color: Colors.green[900],
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: Nunito),
            ),
            SizedBox(
              width: 8,
            ),
            Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.green[500]!,
                    width: 1,
                  )),
              padding: EdgeInsets.all(2),
              child: const Center(
                  child: const Text(
                "4",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )),
            ),
          ]),
          Container(
            padding: EdgeInsets.all(2),
            child: Row(
              children: [
                Text(
                  "21-04-2021",
                  style: TextStyle(
                    color: Colors.green[900],
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.green[900],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
