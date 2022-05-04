import 'package:flutter/material.dart';
import 'package:myecotrip/admin/reports/data/bloc/reports_bloc.dart';
import 'package:myecotrip/admin/reports/widgets/DateTile.dart';
import 'package:myecotrip/admin/reports/widgets/dropdown.dart';

import '../../../constants/config.dart';
import '../../issue_ticket/screens/widgets/dropdownTextField.dart';

class ReportsFilter extends StatefulWidget {
  ReportsBloc reportsBloc;
  ReportsFilter({Key? key, required this.reportsBloc}) : super(key: key);

  @override
  State<ReportsFilter> createState() => _ReportsFilterState();
}

class _ReportsFilterState extends State<ReportsFilter> {
  late DateTime startDate;
  late DateTime endDate;
  DateTime now = DateTime.now();
  TextEditingController typeController = TextEditingController();
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      typeController.text = ReportsProvider.of(context).selectedType;
    });

    startDate = widget.reportsBloc.startDate;
    endDate = widget.reportsBloc.endDate;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DateTile(
                  title: 'From',
                  date: startDate,
                  onTap: () => selectDate(
                      date: startDate,
                      context: context,
                      onSelected: (selected) {
                        setState(() {
                          widget.reportsBloc.changeDate(startDatet: selected, endDatet: endDate);
                          startDate = selected;
                        });
                      })),
              Container(
                padding: EdgeInsets.only(top: 24),
                child: const Text(
                  "TO",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DateTile(
                  title: 'To',
                  date: endDate,
                  onTap: () => selectDate(
                      date: endDate,
                      context: context,
                      onSelected: (selected) {
                        setState(() {
                          widget.reportsBloc.changeDate(startDatet: startDate, endDatet: selected);
                          endDate = selected;
                        });
                      })),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text(
                  "Type",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DropdownTextField(
                    width: Config().deviceWidth(context) * 0.35,
                    options: ReportsProvider.of(context).type,
                    searchable: false,
                    onSelected: (e) {
                      setState(() {
                        typeController.text = e;
                      });
                      ReportsProvider.of(context).changeType(text: e);
                    },
                    labelText: "",
                    controller: typeController,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
