import 'package:flutter/material.dart';

class ReportSort extends StatefulWidget {
  const ReportSort({Key? key}) : super(key: key);

  @override
  State<ReportSort> createState() => _ReportSortState();
}

class _ReportSortState extends State<ReportSort> {
  @override
  TextStyle style = TextStyle(color: Colors.green[900], fontWeight: FontWeight.bold);

  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          ListTile(
            tileColor: Colors.green[200],
            title: Text(
              "Sort By Name",
              style: style,
            ),
            onTap: () {},
          ),
          ListTile(
            tileColor: Colors.green[100],
            title: Text("Sort By Date", style: style),
            onTap: () {},
          ),
          ListTile(
            tileColor: Colors.green[100],
            title: Text("Sort By Age", style: style),
            onTap: () {},
          )
        ]),
      ),
    );
  }
}
