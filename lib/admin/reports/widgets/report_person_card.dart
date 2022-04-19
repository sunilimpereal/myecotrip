import 'package:flutter/material.dart';
import 'package:myecotrip/constants/config.dart';

class ReportPersonCard extends StatefulWidget {
  const ReportPersonCard({Key? key}) : super(key: key);

  @override
  State<ReportPersonCard> createState() => _ReportPersonCardState();
}

class _ReportPersonCardState extends State<ReportPersonCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      profileCircle(),
                      Container(
                        width: Config().deviceWidth(context) * 0.8,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [name(), type(), age()],
                            ),
                            SizedBox(
                              height: Config().deviceHeight(context) * 0.010,
                            ),
                            Container(
                              width: Config().deviceWidth(context) * 0.8,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [ticketid(), location()],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget profileCircle() {
    return Material(
      borderRadius: BorderRadius.circular(100),
      color: Colors.blue.shade100,
      elevation: 4,
      child: Container(
        width: 48,
        height: 48,
        child: Center(
          child: Text(
            "DI",
            style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget name() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: Config().deviceWidth(context) * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Dinesh Sam",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget type() {
    return Container(
      child: Row(
        children: [
          Container(
              height: 6,
              width: 6,
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(100),
              )),
          SizedBox(
            width: 8,
          ),
          Text(
            "Adult",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          ),
          SizedBox(
            width: 8,
          ),
          Container(
            height: 6,
            width: 6,
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(100),
            ),
          )
        ],
      ),
    );
  }

  Widget age() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          // const Text(
          //   "age",
          //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
          // ),
          const Text(
            "28",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }

  location() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        alignment: Alignment.centerRight,
        width: Config().deviceWidth(context) * 0.45,
        child: const Text(
          "Kada view point",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.end,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  ticketid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        alignment: Alignment.center,
        width: Config().deviceWidth(context) * 0.25,
        child: const Text(
          "4058910235",
          overflow: TextOverflow.fade,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
