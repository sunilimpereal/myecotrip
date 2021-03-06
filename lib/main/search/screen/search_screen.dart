import 'package:flutter/material.dart';
import 'package:myecotrip/main/appbar/customappbar.dart';

import '../../../admin/issue_ticket/screens/widgets/dropdownTextField.dart';
import '../../../admin/reports/widgets/DateTile.dart';
import '../../../constants/config.dart';
import '../../treks_page/widgets/trek_tile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController locationController = TextEditingController();

  TextEditingController trekController = TextEditingController();

  TextEditingController slotController = TextEditingController();

  late DateTime date;
  DateTime now = DateTime.now();
  @override
  void initState() {
    date = now;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        AppBarMain(title: "Search"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownTextField(
              width: Config().deviceWidth(context) * 0.9,
              options: ['madikere', 'bengaluru', 'dsadsdsa'],
              onSelected: (e) {
                setState(() {
                  locationController.text = e;
                });
              },
              labelText: "Select Location",
              controller: locationController,
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DateTile(
                title: '',
                date: date,
                onTap: () => selectDate(
                    date: date,
                    context: context,
                    onSelected: (selected) {
                      setState(() {
                        date = selected;
                      });
                    })),
            Padding(
              padding: const EdgeInsets.only(top : 8.0),
              child: DropdownTextField(
                width: Config().deviceWidth(context) * 0.45,
                options: ['6:00 AM', '4 :00 PM'],
                searchable: false,
                onSelected: (e) {
                  setState(() {
                    slotController.text = e;
                  });
                },
                labelText: "Select Slot",
                controller: slotController,
              ),
            ),
          ],
        ),
        Expanded(
          child: GridView(
            physics: BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            children: [
              TrekTile(
                title: "Makalidurga",
                location: "Bangalore",
                imgUrl: "assets/images/trek1.webp",
              ),
            ],
          ),
        ),
      ],
    )));
  }
}
