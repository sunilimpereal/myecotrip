// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myecotrip/admin/dashboard/data/cardModel.dart';
import 'package:myecotrip/admin/dashboard/data/dashboardRepository.dart';
import 'package:myecotrip/admin/dashboard/screens/widgets/adbutton.dart';
import 'package:myecotrip/admin/dashboard/screens/widgets/dashboardAppBar.dart';
import 'package:myecotrip/admin/dashboard/screens/widgets/dashboard_card.dart';
import 'package:myecotrip/admin/dashboard/screens/widgets/dashcard.dart';
import 'package:myecotrip/admin/dashboard/screens/widgets/drawer.dart';
import 'package:myecotrip/admin/issue_ticket/data/repository/ticketDoemRepository.dart';
import 'package:myecotrip/admin/issue_ticket/screens/select_landscape.dart';
import 'package:myecotrip/admin/issue_ticket/screens/tickcet_form.dart';
import 'package:myecotrip/admin/reports/screens/reports_screen.dart';
import 'package:myecotrip/admin/ticket_scan/screen/scan_screen.dart';
import 'package:myecotrip/constants/config.dart';
import 'package:myecotrip/main/Trekking_Details_page/Widgets/app_bar.dart';
import 'package:myecotrip/main/Trekking_Details_page/Widgets/back_button.dart';

import '../../issue_ticket/data/models/landScapeMode.dart';
import '../../issue_ticket/data/models/trekinfoModel.dart';

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
  ScrollController bodyScrollController = ScrollController();
  bool minisedAppbar = false;
  bool showTopPart = true;
  List<CardDataModel> cardDataList = [];
  DateTime selectedDate = DateTime.now();
  bool loading = false;
  getCardList() async {
    setState(() {
      loading = true;
    });
    List<CardDataModel> cardDataListT = await DashboardRepository().getCardData(
      context: context,
      date: selectedDate,
    );
    setState(() {
      loading = false;
      cardDataList = cardDataListT;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      print("WidgetsBinding");
      getCardList();
    });
    bodyScrollController.addListener(() {
      if (bodyScrollController.offset < 100) {
        Future.delayed(Duration(milliseconds: 600)).then((value) {
          setState(() {
            showTopPart = true;
          });
        });
      }

      if (bodyScrollController.offset > 100) {
        setState(() {
          minisedAppbar = true;
          //Future.delayed(Duration(seconds: 1)).then((value) {
          showTopPart = false;
          //  / });
        });
      } else {
        setState(() {
          minisedAppbar = false;
        });
      }
    });
    super.initState();
  }

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
                  AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastOutSlowIn,
                      padding: EdgeInsets.only(
                          top: Config().deviceHeight(context) * (minisedAppbar ? 0.05 : 0.138)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TrekDetails(),
                          // Reportcard(),
                        ],
                      )),
                  DashboardAppBar(
                    bodyScrollController: bodyScrollController,
                    minmised: minisedAppbar,
                    showtopPart: showTopPart,
                    selectedDate: selectedDate,
                    changeDate: (date) {
                      setState(() {
                        selectedDate = date;
                        log(date.toIso8601String());
                        getCardList();
                      });
                    },
                    onMenuTap: () {
                      _key.currentState?.openDrawer();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget TrekDetails() {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      height: Config().deviceHeight(context) * (minisedAppbar ? 0.8 : 0.76),
      child: SingleChildScrollView(
        controller: bodyScrollController,
        dragStartBehavior: DragStartBehavior.start,
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 80.0),
          child: loading
              ? Column(
                  children: [LoadingDashboardCard(colors: colors[0])],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: cardDataList
                      .map(
                        (e) => DashCard(
                          colors: colors[cardDataList.indexOf(e)],
                          cardDataModel: e,
                        ),
                      )
                      .toList(),
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
