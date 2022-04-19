import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:myecotrip/admin/reports/screens/report_slide_filterr.dart';
import 'package:myecotrip/admin/reports/screens/report_slide_sort.dart';
import 'package:myecotrip/admin/reports/widgets/DateTile.dart';
import 'package:myecotrip/admin/reports/widgets/dropdown.dart';
import 'package:myecotrip/constants/config.dart';

class ReportFilter extends StatefulWidget {
  Function ontapFilter;
  Function ontapSort;
  Function onclose;
  int i;
  ReportFilter({
    Key? key,
    required this.ontapFilter,
    required this.ontapSort,
    required this.onclose,
    required this.i,
  }) : super(key: key);

  @override
  State<ReportFilter> createState() => ReportFilterState();
}

class ReportFilterState extends State<ReportFilter> with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime date;
    return Container(
      child: Material(
        color: Colors.green[100],
        child: Column(
          children: [
            Container(
              child: TabBar(
                indicatorColor: Colors.green,
                labelColor: Colors.green[800],
                controller: _controller,
                padding: EdgeInsets.all(0),
                onTap: (int i) {
                  log("tits");
                  widget.ontapFilter();

                },
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.filter_alt_sharp,
                      color: Colors.green.shade800,
                    ),
                    text: 'Filter',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.sort,
                      color: Colors.green.shade800,
                    ),
                    text: 'Sort',
                  ),
                ],
              ),
            ),
            Container(
              height: Config().deviceHeight(context) * 0.4,
              child: TabBarView(
                controller: _controller,
                children: const [
                  ReportsFilter(),
                  ReportSort(),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    //  Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Material(
    //     color: Colors.transparent,
    //     child: Column(
    //       children: [
    //         SizedBox(
    //           height: 10,
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             sliderButton("Filter", ontap: widget.ontapFilter, onclose: widget.onclose),
    //             sliderButton("Sort", ontap: widget.ontapSort, onclose: widget.onclose),
    //           ],
    //         ),
    //         if (widget.i == 1)
    //           ReportsFilter()
    //         else if (widget.i == 2)
    //           ReportSort()
    //         else
    //           ReportsFilter()
    //       ],
    //     ),
    //   ),
    // );
  }

  sliderButton(String name, {Function()? ontap, Function()? onclose}) {
    bool a = true;
    if (widget.i == 2 && name == "Filter") {
      a = false;
    } else if (widget.i == 1 && name == "Sort") {
      a = false;
    }
    return Material(
      color: a ? Colors.green.withOpacity(0.8) : Colors.green.shade900,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: a ? ontap : onclose,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          alignment: Alignment.center,
          height: Config().deviceWidth(context) * 0.1,
          width: Config().deviceWidth(context) * 0.4,
          child: Text(
            a ? name : "Apply",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
