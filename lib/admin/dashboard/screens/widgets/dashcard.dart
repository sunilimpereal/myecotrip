import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:myecotrip/constants/config.dart';
import 'package:myecotrip/utils/svg_icon.dart';

import '../../../../utils/printer/printer.dart';

class GradientColors {
  Color color1;
  Color color2;
  GradientColors({required this.color1, required this.color2});
}

class DashCard extends StatefulWidget {
  GradientColors colors;
  String name;
  String location;
  String slot;
  String total;
  String visitors;

  DashCard({
    Key? key,
    required this.colors,
    required this.location,
    required this.name,
    required this.slot,
    required this.total,
    required this.visitors,
  }) : super(key: key);

  @override
  State<DashCard> createState() => _DashCardState();
}

class _DashCardState extends State<DashCard> {
  late double CardHeight;
  late double CardWidth;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    CardHeight = Config().deviceHeight(context) * 0.2;
    CardWidth = Config().deviceWidth(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Container(
            height: CardHeight,
            width: CardWidth,
            decoration: BoxDecoration(
              // color: widget.color,
              gradient: LinearGradient(colors: [
                widget.colors.color1.withOpacity(0.6),
                widget.colors.color2.withOpacity(0.6)
              ]),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Ink(
              child: InkWell(
                splashColor: Colors.green[50]!.withOpacity(0.5),
                highlightColor: Colors.transparent,
                onTap: () {},
                child: totalStack(),
              ),
            ),
          ),
        ),
        Positioned(bottom: 20, right: 20, child: addbutton()),
        Positioned(top: 30, right: 30, child: slot()),
        Positioned(bottom: 30, left: 35, child: availability()),
      ],
    );
  }

  ///  Stack it on the top of everything for the layout
  /// overlaps all the widgets with inkwell
  Widget totalStack() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [title()],
              ),
              // bottombar(),
            ],
          ),

          // Positioned(top: 10, right: 10, child: bookingsNumber())
        ],
      ),
    );
  }

  Widget title() {
    return Container(
      height: CardHeight * 0.7 - 2,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: Nunito,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              const Icon(
                Icons.location_on_sharp,
                size: 16,
              ),
              Text(
                widget.location,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontFamily: Montserrat,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  //border
  Widget addbutton() {
    return Material(
      elevation: 3,
      shadowColor: widget.colors.color1.withOpacity(0.5),
      color: widget.colors.color1,
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(20),
      child: Ink(
        child: InkWell(
          splashColor: widget.colors.color2,
          onTap: () async {
            Printer printer = Printer();
            Map<String, dynamic> data = {
              'bookingId': 'ECOTRIP67020220225015403',
              'noOfTickets': 3,
              'bookingDate': '2022-02-25',
              'trekkingDate': '2022-02-26',
              'timeSlot': '04:00 AM',
              'total': 'Rs. 129.38',
              'names': ['name1', 'name2', 'first  last'],
              'age': ['23', '23', '24'],
              'sex': ['female', 'male', 'male'],
              'trailName': 'Skandagiri / Bangalore',
              'startingPoint': 'Kalwara Village',
              'endPoint': 'Skandagiri Hilltop',
              'contactNo': '+91918722254201',
              'qrcode': '918722254201',
              'isExitTicket': false,
            };
            final result = await printer.printReceipt(data);
            log(result.toString());
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  height: 32,
                  width: 32,
                  child: SvgIcon(color: Colors.white, path: 'tickets.svg'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget slot() {
    return Container(
        child: Row(
      children: [
        Container(
          width: 30,
          height: 30,
          child: SvgIcon(
            color: Colors.white,
            path: widget.slot != "6:00 AM" ? 'sunrise1.svg' : 'sunrise2.svg',
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Column(
          children: [
            Text(
              widget.slot,
              style: TextStyle(
                fontFamily: Montserrat,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              "Morning Slot",
              style: TextStyle(
                fontFamily: Nunito,
                fontSize: 11,
              ),
            )
          ],
        )
      ],
    ));
  }

  Widget availability() {
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  "60 / ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "100",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget bookingsNumber() {
    return Container(
      child: Row(
        children: [
          numValueText(number: 19, name: "Bookings"),
          numValueText(number: 30, name: "Visitors"),
        ],
      ),
    );
  }

  Widget numValueText({required int number, required String name}) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Column(
        children: [
          // number text
          Text(
            number.toString(),
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontFamily: Montserrat,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.italic,
              color: Colors.grey,
              fontFamily: Roboto,
            ),
          ),
        ],
      ),
    );
  }
}
