import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  leading: CustomBackButton(
                    onTap: () {Navigator.pop(context);},
                  ),
                  title: const Text(
                    "Payments",
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                  ),
                ),
                title("Kada view point"),
                title("Tuesday, April 12, 2022"),
                title("Morning Slot 9:00 AM"),
                Row(
                  children: [
                    dataCell("Location", "Bangalore"),
                    dataCell("Length", "1.30 KM"),
                  ],
                ),
                dataCell("Start", "Main Gate Of  Kaiwara Tapovana at Shamaraohosapete Village"),
                dataCell("Ends", "Mylapurabetta View Point"),
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

  title(String s) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 18),
      child: Text(
        s,
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
      ),
    );
  }

  dataCell(String title, String info) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            info,
            style:
                TextStyle(fontSize: 18, color: Colors.green.shade900, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 14),
          )
        ],
      ),
    );
  }

  list() {
    return DataTable(
        columnSpacing: 30,
        // dataRowColor: MaterialColor(Colors, ref, swatch),
        dataRowHeight: Config().deviceHeight(context) * 0.05,
        columns: [
          header("Type"),
          header("Amount"),
        ],
        rows: [
          data("Visitor Charges (Adults) (R250 x 2)", 500.00),
          data("Visitor Charges (Children) (R125 x 0)", 0),
          data("Visitor Charges (Students) (125 x 0)", 0),
          data("Online Facility Charge", 0),
          data("GST", 0),
          data("Total", 600),
        ]);
  }

  header(String title) {
    return DataColumn(
      label: Text(
        title,
        style: const TextStyle(fontStyle: FontStyle.italic),
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
          style: const TextStyle(fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),
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
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        )),
        DataCell(Text(
          price.toString(),
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
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
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => AdminDashboard(),
              ),
            );
          },
          text: "Confirm and Pay",
          color: Colors.green.shade700,
        ),
      ],
    );
  }
}
