import 'package:flutter/material.dart';
import 'package:myecotrip/admin/dashboard/screens/widgets/adbutton.dart';
import 'package:myecotrip/admin/dashboard/screens/widgets/dashboard_card.dart';
import 'package:myecotrip/admin/issue_ticket/screens/select_landscape.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            //body
            Column(
              children: [
                CustomAppBar(
                  leading: CustomIconButton(
                    onTap: () {},
                    iconData: Icons.sort_rounded,
                  ),
                  title: const Text(
                    "Dashboard",
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                  ),
                  end: Container(
                      child: CustomIconButton(
                    onTap: () {},
                    iconData: Icons.search_rounded,
                  )),
                ),
                Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TrekDetailCard(),
                    Reportcard(),
                  ],
                )),
              ],
            ),

            // bottom buttons
            Positioned(
              bottom: 0,
              child: Container(
                width: Config().deviceWidth(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // scan button
                    AdButton(
                      icon: Icons.qr_code,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScanScreen(),
                          ),
                        );
                      },
                      text: 'Scan',
                    ),
                    AdButton(
                      icon: Icons.calendar_view_day_rounded,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IssueTicketLandScape(),
                          ),
                        );
                      },
                      text: 'Ticket',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Widget Dashcard(){
  //   return
  // }

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
}
