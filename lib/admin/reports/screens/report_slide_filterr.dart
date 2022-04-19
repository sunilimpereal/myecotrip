import 'package:flutter/material.dart';
import 'package:myecotrip/admin/reports/widgets/DateTile.dart';
import 'package:myecotrip/admin/reports/widgets/dropdown.dart';

class ReportsFilter extends StatefulWidget {
  const ReportsFilter({Key? key}) : super(key: key);

  @override
  State<ReportsFilter> createState() => _ReportsFilterState();
}

class _ReportsFilterState extends State<ReportsFilter> {
  late DateTime amSycDtTm;
  DateTime now = DateTime.now();
  @override
  void initState() {
    amSycDtTm = now;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DateTile(
                  title: 'From',
                  date: amSycDtTm,
                  onTap: () => selectDate(
                      date: amSycDtTm,
                      context: context,
                      onSelected: (selected) {
                        setState(() {
                          amSycDtTm = selected;
                        });
                      })),
              Text("TO",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              DateTile(
                  title: 'To',
                  date: amSycDtTm,
                  onTap: () => selectDate(
                      date: amSycDtTm,
                      context: context,
                      onSelected: (selected) {
                        setState(() {
                          amSycDtTm = selected;
                        });
                      })),
            ],
          ),
        ],
      ),
    );
  }
}
