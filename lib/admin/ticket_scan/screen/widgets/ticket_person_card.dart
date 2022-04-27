import 'package:flutter/material.dart';
import 'package:myecotrip/admin/ticket_scan/data/models/scanResponse.dart';
import 'package:myecotrip/constants/config.dart';

class TicketPersonCard extends StatefulWidget {
  Visitor visitor;
  Color? color;
   TicketPersonCard({Key? key,required this.visitor,this.color}) : super(key: key);

  @override
  State<TicketPersonCard> createState() => _TicketPersonCardState();
}

class _TicketPersonCardState extends State<TicketPersonCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
          color: widget.color??Colors.green.shade100.withOpacity(0.8),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [profileCircle(), name(), type(), age()],
              ),
            ),
          )),
    );
  }

  Widget profileCircle() {
    return Material(
      borderRadius: BorderRadius.circular(100),
      color: Colors.blue.shade100,
      elevation: 6,
      shadowColor: Colors.grey[100],
      child: Container(
        width: 48,
        height: 48,
        child: Center(
          child: Text(
             widget.visitor.tvtFname.substring(0,2).toUpperCase(),
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
        width: Config().deviceWidth(context) * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.visitor.tvtFname,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              widget.visitor.tvtMobile,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            )
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
                color: Colors.black,
                borderRadius: BorderRadius.circular(100),
              )),
          SizedBox(
            width: 8,
          ),
          Text(
            widget.visitor.tvtType,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 8,
          ),
          Container(
              height: 6,
              width: 6,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(100),
              ))
        ],
      ),
    );
  }

  Widget age() {
    return Container(
      padding: EdgeInsets.only(left: 16),
      child: Column(
        children: [
          Text(
            widget.visitor.tvtAge,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Text(
            "age",
            style: TextStyle(),
          )
        ],
      ),
    );
  }
}
