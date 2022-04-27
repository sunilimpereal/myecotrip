import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myecotrip/constants/config.dart';
import 'package:date_util/date_util.dart';
import 'package:myecotrip/main/Trekking_Details_page/Widgets/app_bar.dart';

import '../../../../main/Trekking_Details_page/Widgets/back_button.dart';

class DashboardAppBar extends StatefulWidget {
  Function onMenuTap;
  ScrollController bodyScrollController;
  bool minmised;
  bool showtopPart;
  DashboardAppBar(
      {Key? key,
      required this.bodyScrollController,
      required this.minmised,
      required this.showtopPart,
      required this.onMenuTap})
      : super(key: key);

  @override
  State<DashboardAppBar> createState() => _DashboardAppBarState();
}

class _DashboardAppBarState extends State<DashboardAppBar> {
  DateTime selectedDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  List<DateTime> dates = [];
  List<DateTime> getDates() {
    final daysCount = DateUtil().daysInMonth(DateTime.now().month, DateTime.now().year);
    List<DateTime> days = [];
    for (int i = 1; i < daysCount + 1; i++) {
      days.add(DateTime(DateTime.now().year, DateTime.now().month, i));
    }
    return days;
  }

  ontap(DateTime a) {
    setState(() {
      selectedDate = a;
    });
  }

  late ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      double onePos = scrollController.position.maxScrollExtent / dates.length;
      Future.delayed(Duration(seconds: 0)).then((value) {
        scrollController.animateTo((onePos * (dates.indexOf(selectedDate) + 2.2)),
            duration: Duration(milliseconds: 500), curve: Curves.fastLinearToSlowEaseIn);
      });
    });
    dates = getDates();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      fit: StackFit.loose,
      children: [
        AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          height: Config().deviceHeight(context) * (widget.minmised ? 0.11 : 0.18),
          color: Colors.transparent,
          child: Column(
            children: [
              Material(
                elevation: 10,
                shadowColor: Colors.white.withOpacity(0.5),
                color: Colors.green[50],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.zero,
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                  height: Config().deviceHeight(context) * (widget.minmised ? 0.10 : 0.165),
                  width: Config().deviceWidth(context),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      !widget.showtopPart ? Container() : profile1(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: datesRow(),
        ),
      ],
    );
  }

  Widget profile1() {
    return Container(
        child: Row(
      children: [
        CustomIconButton(size: 36, onTap: () {
          widget.onMenuTap();
        }, iconData: Icons.sort),
        SizedBox(
          width: 16,
        ),
        Text(
          "Dashboard",
          style: TextStyle(color: Colors.black, fontFamily: Montserrat, fontSize: 18),
        ),
      ],
    ));
  }

  Widget profile() {
    return Container(
      child: Row(
        children: [
          Container(
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
            child: Column(
              children: [Text("Sunil@gamil.com")],
            ),
          )
        ],
      ),
    );
  }

  Widget datesRow() {
    return Container(
      width: Config().deviceWidth(context),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: scrollController,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:
                dates.map((e) => date(date: e, selectedDate: selectedDate, ontap: ontap)).toList()),
      ),
    );
  }

  Widget date(
      {required DateTime date, required DateTime selectedDate, required Function(DateTime) ontap}) {
    return GestureDetector(
        onTap: () {
          ontap(date);
        },
        child: date == selectedDate
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.green),
                child: Column(
                  children: [
                    Text(
                      date.day.toString(),
                      style: TextStyle(fontFamily: Montserrat, fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      width: Config().deviceWidth(context) * 0.09,
                      child: Center(
                        child: Text(
                          DateFormat('EEEE').format(date).substring(0, 3),
                          style: TextStyle(
                            fontFamily: Montserrat,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Config().deviceWidth(context) * 0.085, vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.transparent),
                child: Column(
                  children: [
                    Text(
                      date.day.toString(),
                      style: TextStyle(
                        fontFamily: Montserrat,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                  ],
                ),
              ));
  }
}
