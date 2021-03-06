import 'dart:developer';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:myecotrip/admin/reports/data/bloc/reports_bloc.dart';
import 'package:myecotrip/admin/reports/data/models/trekBookings_model.dart';
import 'package:myecotrip/admin/reports/widgets/DateTile.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../constants/config.dart';

import '../../../main/Trekking_Details_page/Widgets/app_bar.dart';
import '../../../main/Trekking_Details_page/Widgets/back_button.dart';
import '../../ticket_scan/screen/widgets/ticket_person_card.dart';
import '../widgets/reportCard.dart';
import '../widgets/report_person_card.dart';
import 'report_slide.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReportsProvider(
      context: context,
      child: Reports(),
    );
  }
}

class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  State<Reports> createState() => ReportsState();
}

class ReportsState extends State<Reports> {
  @override
  int i = 0;
  bool open = false;
  late DateTime amSycDtTm;
  DateTime now = DateTime.now();

  @override
  void initState() {
    amSycDtTm = now;
    super.initState();
  }

  late PanelController panelController = PanelController();
  Widget build(BuildContext context) {
    ReportsBloc reportsBloc = ReportsProvider.of(context);
    var date;
    return SlidingUpPanel(
      isDraggable: true,
      color: Colors.green[200]!,
      controller: panelController,
      borderRadius:
          const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      minHeight: Config().deviceHeight(context) * 0.06,
      maxHeight: MediaQuery.of(context).size.height * 0.7,
      panel: ReportFilter(
        onclose: () {
          setState(() {
            i = 0;
          });
          panelController.close();
        },
        ontapFilter: () {
          setState(() {
            i = 1;
          });
          panelController.open();
        },
        ontapSort: () {
          setState(() {
            i = 2;
          });
          panelController.open();
        },
        i: i,
        reportBloc: reportsBloc,
      ),
      header: headerui(context),
      body: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: Color(0xfff8d9a4).withOpacity(0.1),
          child: SafeArea(
            child: Stack(children: [
              Column(
                children: [
                  CustomAppBar(
                    leading: CustomBackButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    title: const Text(
                      "Reports",
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                    ),
                    end: Container(
                        child: CustomIconButton(
                      onTap: () {},
                      iconData: Icons.search_rounded,
                    )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 80.0),
                      child: StreamBuilder<List<TrekBookingModel>>(
                          stream: reportsBloc.ticketReportListStream,
                          builder: (context, snapshot) {
                            log("updated screen");
                            if (!snapshot.hasData) {
                              return CircularProgressIndicator();
                            }
                            return Column(
                                children: snapshot.data!.map((e) {
                              return ReportCard(
                                trekBookingModel: e,
                              );
                            }).toList());
                          }),
                    ),
                  ))
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

Widget headerui(BuildContext context) {
  return Container(
    width: Config().deviceWidth(context),
    alignment: Alignment.center,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        width: 50,
        height: 3,
        decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(100)),
      ),
    ),
  );
}
