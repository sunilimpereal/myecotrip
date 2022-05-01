import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:lottie/lottie.dart';
import 'package:myecotrip/admin/ticket_scan/data/scan_repository.dart';
import 'package:myecotrip/admin/ticket_scan/screen/process_scan.dart';
import 'package:myecotrip/constants/config.dart';
import 'package:myecotrip/main/Trekking_Details_page/Widgets/app_bar.dart';
import 'package:myecotrip/main/Trekking_Details_page/Widgets/back_button.dart';

import '../../dashboard/screens/widgets/drawer.dart';

// scan screen 1
class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  late bool loading = false;
  late String qrCode = "";

  clear() {
    setState(() {
      loading = false;
      qrCode = "";
    });
  }
 final GlobalKey<ScaffoldState> _key = GlobalKey(); //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
          drawer: Drawer(child: DashDrawer()),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              CustomAppBar(
                  leading: CustomIconButton(
                      size: 36,
                      onTap: () {
                        _key.currentState?.openDrawer();
                      },
                      iconData: Icons.sort),
                title: Container(
                  child: Text(
                    "Scan",
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                  ),
                ),
                end: CustomIconButton(
                    size: 36,
                    onTap: () {
                      FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR)
                          .then((value) {
                        qrCodeScan(context: context, qrCode1: cleanQr(value.trim()), clear: clear);
                      });
                    },
                    iconData: Icons.camera_alt),
              ),
              Container(
                child: Center(
                  child: Stack(
                    children: [
                      Container(
                        width: Config().deviceWidth(context),
                        height: Config().deviceHeight(context) * 0.75,
                        child: Lottie.asset(LOTTIE + 'qr_scan.json'),
                      ),
                      Positioned(
                        bottom: 10,
                        child: Container(
                          width: Config().deviceWidth(context),
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
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => ScanProcessScreen(),
                                      //   ),
                                      // );
                                    },
                                    child: Container(
                                      padding:const EdgeInsets.all(16),
                                      decoration: const BoxDecoration(
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
            ],
          ),
        ));
  }

  void qrCodeScan(
      {required BuildContext context, required String qrCode1, required Function clear}) async {
    setState(() {
      loading = true;
    });
    ScannerRepository.scanTicket(context: context, ticketNumber: qrCode1).then((value) {
      if (value != null) {
        //TODO : Dialog box
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScanProcessScreen(ticketModel: value),
          ),
        ).then((value) {
          loading = false;
          clear();
        });
      } else {
        setState(() {
          loading = false;
          clear();
        });
      }
    });
  }

  cleanQr(String qr) {
    String output = "";
    for (int i = 0; i < qr.length; i++) {
      if (RegExp(r'^[A-Za-z0-9_.]+$').hasMatch(qr[i])) {
        output = output + qr[i];
      }
    }
    return output;
  }
}
