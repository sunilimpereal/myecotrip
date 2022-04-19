import 'package:flutter/material.dart';
import 'package:myecotrip/admin/issue_ticket/screens/tickcet_form.dart';
import 'package:myecotrip/constants/config.dart';
import 'package:myecotrip/main/Trekking_Details_page/Widgets/app_bar.dart';
import 'package:myecotrip/main/Trekking_Details_page/Widgets/back_button.dart';

class IssueTicketLandScape extends StatefulWidget {
  const IssueTicketLandScape({Key? key}) : super(key: key);

  @override
  State<IssueTicketLandScape> createState() => _IssueTicketLandScapeState();
}

class _IssueTicketLandScapeState extends State<IssueTicketLandScape> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              leading: CustomBackButton(
                onTap: () {},
              ),
              title: const Text(
                "Landscape",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
              ),
            ),
            Column(
              children: [landscapeCard()],
            )
          ],
        ),
      ),
    );
  }

  Widget landscapeCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.hardEdge,
        child: Ink(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IssueTicketForm(),
                ),
              );
            },
            child: Container(
              height: Config().deviceHeight(context) * 0.25,
              width: Config().deviceWidth(context),
              decoration: BoxDecoration(
                // color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage(IMAGES + 'crousal3.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Landscape Name",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "8:00 AM",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
