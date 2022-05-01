import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myecotrip/admin/admin_main.dart';
import 'package:myecotrip/admin/dashboard/screens/dashboard.dart';
import 'package:myecotrip/admin/dashboard/screens/widgets/adbutton.dart';
import 'package:myecotrip/constants/config.dart';
import 'package:myecotrip/main/Trekking_Details_page/Widgets/app_bar.dart';

import '../../../main/Trekking_Details_page/Widgets/back_button.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  bool? checkBoxValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  leading: CustomBackButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  title: const Text(
                    "Payments",
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Kada view point",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                ),
                Row(
                  children: [
                    title("Morning Slot 9:00 AM", border: true),
                    title("Thu 12, April 2022", border: true),
                  ],
                ),
                SizedBox(
                  height: Config().deviceHeight(context) * 0.005,
                ),
                Row(
                  children: [
                    dataCell("Location", "Bangalore"),
                    dataCell("Length", "1.30 KM"),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    dataCell("Start", "Shamaraohosapet Village"),
                    dataCell("Ends", "Mylapurabetta View Point"),
                  ],
                ),
                list(),
                tnC(),
                confirmButton()
              ],
            ),
          ),
        )),
      ),
    );
  }

  title(String s, {required bool border}) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ActionChip(
        shape: RoundedRectangleBorder(
            side: !border
                ? BorderSide(width: 2, color: Colors.green.shade900)
                : BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(20)),
        pressElevation: 0,
        backgroundColor: border ? Colors.green.shade100 : Colors.transparent,
        onPressed: () {},
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
        label: Text(
          s,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
      ),
    );
  }

  dataCell(String title, String info) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: Config().deviceWidth(context) * 0.45,
        child: Material(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.white,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {},
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    info,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.green.shade900.withOpacity(0.8),
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  list() {
    return Container(
      color: Colors.transparent,
      child: DataTable(
          border: const TableBorder(
              horizontalInside: BorderSide(
                  width: 2,
                  color: Color(0xFFFAF6F0),
                  style: BorderStyle.solid)),
          columnSpacing: 30,
          dataRowHeight: Config().deviceHeight(context) * 0.05,
          columns: [
            header("Type"),
            header("Amount"),
          ],
          rows: [
            data("Visitor Charges (Adults)(R250 x 2)", 500.00),
            data("Visitor Charges (Children)(R125 x 0)", 0),
            data("Visitor Charges (Students)(125 x 0)", 0),
            data("Online Facility Charge", 0),
            data("GST", 0),
            Total("Total", 600),
          ]),
    );
  }

  header(String title) {
    return DataColumn(
      label: Text(
        title,
        style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
      ),
    );
  }

  data(
    String name,
    double price,
  ) {
    return DataRow(
      cells: <DataCell>[
        DataCell(Text(
          name,
          style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 15),
        )),
        DataCell(Text(price.toString())),
      ],
    );
  }

  Total(
    String name,
    double price,
  ) {
    return DataRow(
      cells: <DataCell>[
        DataCell(Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
        )),
        DataCell(Text(
          price.toString(),
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
        )),
      ],
    );
  }

  Widget tnC() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, top: 5),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: <Widget>[
                Checkbox(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    value: checkBoxValue,
                    activeColor: Colors.green,
                    onChanged: (bool? newValue) {
                      setState(() {
                        checkBoxValue = newValue;
                      });
                    }),
              ],
            ),
            const Text(
              'I Accept the Terms & Conditions',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  confirmButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AdButton(
          icon: Icons.check,
          onPressed: () {
            Navigator.pop(context);
          },
          text: "Confirm and Pay",
          color: Colors.green.shade700,
        ),
      ],
    );
  }
}
