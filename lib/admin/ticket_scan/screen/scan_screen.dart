import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myecotrip/admin/ticket_scan/screen/process_scan.dart';
import 'package:myecotrip/constants/config.dart';
import 'package:myecotrip/main/Trekking_Details_page/Widgets/app_bar.dart';
import 'package:myecotrip/main/Trekking_Details_page/Widgets/back_button.dart';

// scan screen 1
class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              CustomAppBar(
                leading: CustomBackButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                title: Container(
                  child: Text(
                    "Scan",
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.green[300]!.withOpacity(0.5),
                              borderRadius: BorderRadius.all(Radius.circular(16))),
                          width: Config().deviceWidth(context),
                          height: Config().deviceHeight(context) * 0.8,
                          child: Lottie.asset(LOTTIE + 'qr_scan.json'),
                        ),
                        Positioned(
                          bottom: 10,
                          child: Container(
                            width: Config().deviceWidth(context) - 16,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Material(
                                  borderRadius: BorderRadius.all(Radius.circular(100)),
                                  clipBehavior: Clip.hardEdge,
                                  elevation: 5,
                                  child: Ink(
                                    child: InkWell(
                                      splashColor: Colors.green,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ScanProcessScreen(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.qr_code_scanner,
                                          size: 24,
                                          color: Colors.green[800],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
