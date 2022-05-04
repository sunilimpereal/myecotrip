import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:myecotrip/admin/admin_main.dart';
import 'package:myecotrip/admin/dashboard/screens/dashboard.dart';
import 'package:myecotrip/admin/dashboard/screens/widgets/adbutton.dart';
import 'package:myecotrip/admin/issue_ticket/data/models/tickerPostModelTemp.dart';
import 'package:myecotrip/constants/config.dart';
import 'package:myecotrip/main/Trekking_Details_page/Widgets/app_bar.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'dart:math';
import '../../../main/Trekking_Details_page/Widgets/back_button.dart';

class Payment extends StatefulWidget {
  TicketPostModel ticketPostModel;
  Payment({Key? key, required this.ticketPostModel}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  bool? checkBoxValue = true;
  static const platform = const MethodChannel("razorpay_flutter");

  late Razorpay _razorpay;
  double total = 0;

  List<DataRow> listType = [];
  @override
  void initState() {
    super.initState();
    getList();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_live_kUPmMp4T8fNxgz',
      'amount': total * 100,
      'name': 'Myecotrip',
      'description': '',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {
        'contact': '${widget.ticketPostModel.visitorList[0].tvtMobile}',
        'email': '${widget.ticketPostModel.visitorList[0].tvtEmail}'
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Success Response: $response');
    /*Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
    /* Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
    /* Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(4.0),
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
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    widget.ticketPostModel.landscape!.trkName,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                ),
                Row(
                  children: [
                    // title("Morning Slot 9:00 AM", border: true),
                    // title("Thu 12, April 2022", border: true),
                    title(widget.ticketPostModel.slot!.sltShift, border: true),
                    title(
                        DateFormat('EEE dd , MMM yyyy')
                            .format(widget.ticketPostModel.slot!.sltTrekdate),
                        border: true),
                  ],
                ),
                SizedBox(
                  height: Config().deviceHeight(context) * 0.005,
                ),
                Row(
                  children: [
                    dataCell("Location", widget.ticketPostModel.landscape!.trkLocation),
                    dataCell("Length", widget.ticketPostModel.trekInfoModel!.info.infLength),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    dataCell("Start", widget.ticketPostModel.trekInfoModel!.info.infStartingpoint),
                    dataCell("Ends", widget.ticketPostModel.trekInfoModel!.info.infEndpoint),
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.white,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
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
                        color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 12),
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
      child: Column(
        children: [
          DataTable(
            border: const TableBorder(
                horizontalInside:
                    BorderSide(width: 2, color: Color(0xFFFAF6F0), style: BorderStyle.solid)),
            columnSpacing: 20,
            dataRowHeight: Config().deviceHeight(context) * 0.05,
            columns: [
              header("Type"),
              header("Amount"),
            ],
            rows: listType,
          ),
          // data("GST", 0),
          // Total("Total", 600),
        ],
      ),
    );
  }

  List<DataRow> getList() {
    getTypeCount(String type) {
      return widget.ticketPostModel.visitorList
          .where((element) => element.tvtType == type)
          .toList()
          .length;
    }

    if (getTypeCount("Adult") > 0) {
      double adultPrice = double.parse(widget.ticketPostModel.trekInfoModel!.tarrif.trfAdult);
      total = total + getTypeCount("Adult") * adultPrice;
      listType.add(data("Visitor Charges (Adults)(₹ ${adultPrice} x ${getTypeCount('Adult')})",
          getTypeCount("Adult") * adultPrice));
    }
    if (getTypeCount("Child") > 0) {
      double childrenPrice = double.parse(widget.ticketPostModel.trekInfoModel!.tarrif.trfChild);
      total = total + getTypeCount("Child") * childrenPrice;
      listType.add(data("Visitor Charges (Child)(₹ ${childrenPrice} x ${getTypeCount('Child')})",
          getTypeCount('Child') * childrenPrice));
    }
    // if (getTypeCount("Students") > 0) {
    //   double studentPrice = double.parse(widget.ticketPostModel.trekInfoModel!.tarrif.trfStudent);
    //   total = total + getTypeCount("Children") * studentPrice;
    //   list.add(data("Visitor Charges (Students)(₹ ${studentPrice}  x ${getTypeCount('Students')})", 500.00));
    // }
    double roundDouble(double value, int places) {
      double mod = pow(10.0, places).toDouble();
      return ((value * mod).round().toDouble() / mod);
    }

    double onFAcCharge = roundDouble(0.029 * total, 2);
    double gst = roundDouble((0.18 * (total + onFAcCharge)), 2);
    listType.add(data("Online Facility Charge", onFAcCharge));
    listType.add(data("GST", gst));
    total = roundDouble(total + onFAcCharge + gst, 2);
    listType.add(Total("Total", total));
    return listType;
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
              fontWeight: FontWeight.w400, fontStyle: FontStyle.normal, fontSize: 14),
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
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        )),
        DataCell(Text(
          price.toString(),
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
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
            openCheckout();
            // Navigator.pop(context);
          },
          text: "Confirm and Pay",
          color: Colors.green.shade700,
        ),
      ],
    );
  }
}
