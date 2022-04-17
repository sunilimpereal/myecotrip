import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:myecotrip/admin/dashboard/screens/widgets/adbutton.dart';
import 'package:myecotrip/admin/ticket_scan/screen/widgets/ticket_person_card.dart';
import 'package:myecotrip/constants/config.dart';
import 'package:myecotrip/main/Trekking_Details_page/Widgets/back_button.dart';

import '../../../main/Trekking_Details_page/Widgets/app_bar.dart';

class ScanProcessScreen extends StatefulWidget {
  const ScanProcessScreen({Key? key}) : super(key: key);

  @override
  State<ScanProcessScreen> createState() => _ScanProcessScreenState();
}

class _ScanProcessScreenState extends State<ScanProcessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Container(
          height: Config().deviceHeight(context),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    CustomAppBar(
                      leading: CustomBackButton(
                        onTap: () {},
                      ),
                      title: Container(
                        child: Text(
                          "Ticket Detail",
                          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                        ),
                      ),
                    ),
                    //body
                    Column(
                      children: [
                        //title
                        firstBox(),
                        membersBox(),
                        natureGuide()
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  child: Row(
                    children: [
                      AdButton(
                        icon: Icons.close,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: "Cancel",
                        color: Colors.red.shade400,
                      ),
                      AdButton(
                          icon: Icons.check,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          text: "Confirm"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget firstBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Material(
          color: Colors.white,
          child: Center(
            child: Container(
              height: Config().deviceHeight(context) * 0.2,
              width: Config().deviceWidth(context),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Kada View",
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            timeslotText(
                                iconData: Icons.schedule_rounded, text: "Morning Slot 9:00 AM"),
                            timeslotText(
                                iconData: Icons.calendar_month_outlined,
                                text: "April 12,2022 Tuesday"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget membersBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Material(
        color: Colors.white,
        child: Container(
          // height: Config().deviceHeight(context) * 0.35,
          width: Config().deviceWidth(context),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Members",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              TicketPersonCard(),
              TicketPersonCard(),
            ],
          ),
        ),
      ),
    );
  }

  final List<String> natureGuideList = [
    'Nature Guide 1',
    'Nature Guide 2',
    'Nature Guide 3',
    'Nature Guide 4',
  ];
  String? selectedValue;

  Widget natureGuide() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Material(
        color: Colors.white,
        child: Container(
          // height: Config().deviceHeight(context) * 0.35,
          width: Config().deviceWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Natur Guide",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: Config().deviceWidth(context) * 0.7,
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: DropdownButtonFormField2(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    //Add more decoration as you want here
                    //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                  ),
                  isExpanded: true,
                  hint: const Text(
                    'Nature Guide',
                    style: TextStyle(fontSize: 14),
                  ),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                  iconSize: 30,
                  buttonHeight: 42,
                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  items: natureGuideList
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select gender.';
                    }
                  },
                  onChanged: (value) {
                    //Do something when changing the item if you want.
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
                ),
              ),
              SizedBox(
                height: 8,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget timeslotText({
    required IconData iconData,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.green,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
