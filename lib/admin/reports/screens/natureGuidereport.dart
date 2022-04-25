import 'package:flutter/material.dart';
import 'package:myecotrip/admin/reports/widgets/nGreport.dart';

import '../../../main/Trekking_Details_page/Widgets/app_bar.dart';
import '../../../main/Trekking_Details_page/Widgets/back_button.dart';

class NatureGuideReport extends StatefulWidget {
  const NatureGuideReport({Key? key}) : super(key: key);

  @override
  State<NatureGuideReport> createState() => _NatureGuideReportState();
}

class _NatureGuideReportState extends State<NatureGuideReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              CustomAppBar(
                leading: CustomBackButton(
                  onTap: () {  Navigator.pop(context);},
                ),
                title: const Text(
                  "Nature Guide Report",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                ),
                end: Container(
                  child: CustomIconButton(
                    onTap: () {},
                    iconData: Icons.search_rounded,
                  ),
                ),
              ),
              Container(
                // body
                child: Column(
                  children: const [
                    NGReportCard(),
                    NGReportCard(),
                    NGReportCard(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
