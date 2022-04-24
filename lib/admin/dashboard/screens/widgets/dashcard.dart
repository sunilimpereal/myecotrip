import 'package:flutter/material.dart';
import 'package:myecotrip/constants/config.dart';

class DashCard extends StatefulWidget {
  const DashCard({Key? key}) : super(key: key);

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
      child: Material(
        elevation: 2,
        shadowColor: Colors.white,
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.hardEdge,
        color: Colors.white,
        child: Container(
          height: CardHeight,
          width: CardWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Color(0xff24A645),
              width: 1.0,
            ),
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
    );
  }

  ///  Stack it on the top of everything for the layout
  /// overlaps all the widgets with inkwell
  Widget totalStack() {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Stack(
        children: [
          Column(
            children: [
              title(),
              bottombar(),
            ],
          ),
          Positioned(bottom: 0, right: 0, child: addbutton()),
          Positioned(top: 10, right: 10, child: bookingsNumber())
        ],
      ),
    );
  }

  Widget title() {
    return Container(
      height: CardHeight * 0.7 - 2,
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Text(
                  'Madikere',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    fontFamily: Montserrat,
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
                size: 18,
              ),
              Text(
                'Bengaluru',
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

  Widget bottombar() {
    return Material(
      color: Color(0xff24A645),
      child: Container(
        width: CardWidth,
        height: CardHeight * 0.3,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            const Text(
              " MORNING SLOT 6:00 AM",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(
              width: 32,
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.green[900],),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "20/30",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // bookins
  // visitores

  //border

  Widget addbutton() {
    return Material(
        elevation: 10,
        shadowColor: Colors.green,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(0.0),
          bottomRight: Radius.circular(16.0),
          topLeft: Radius.circular(18.0),
          bottomLeft: Radius.circular(0.0),
        ),
        color: Colors.green[900],
        clipBehavior: Clip.hardEdge,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(0.0),
              bottomRight: Radius.circular(16.0),
              topLeft: Radius.circular(18.0),
              bottomLeft: Radius.circular(0.0),
            ),
            border: Border.all(
              color: Colors.white,
              width: 2.0,
            ),
          ),
          child: Ink(
            child: InkWell(
              splashColor: Colors.green,
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.all(6.0),
                child: Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                  size: 34,
                ),
              ),
            ),
          ),
        ));
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
