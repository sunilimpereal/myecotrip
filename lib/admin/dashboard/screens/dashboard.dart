import 'package:flutter/material.dart';
import 'package:myecotrip/admin/dashboard/screens/widgets/adbutton.dart';
import 'package:myecotrip/admin/ticket_scan/screen/scan_screen.dart';
import 'package:myecotrip/constants/config.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            //body
            Container(
              child: Center(
                child: Text("Dashboard"),
              ),
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
                      onPressed: () {},
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
}
