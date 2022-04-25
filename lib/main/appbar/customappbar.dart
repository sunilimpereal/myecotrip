import 'package:flutter/material.dart';
import 'package:myecotrip/constants/config.dart';
import 'package:myecotrip/main/About_Us_page/Screens/aboutus_page.dart';
import 'package:myecotrip/main/Trekking_Details_page/Widgets/back_button.dart';
import 'package:myecotrip/main/navpage/main_page.dart';

class AppBarMain extends StatefulWidget {
  String title;
  AppBarMain({Key? key, required this.title}) : super(key: key);

  @override
  State<AppBarMain> createState() => _AppBarMainState();
}

class _AppBarMainState extends State<AppBarMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Config().deviceHeight(context) * 0.08,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomBackButton(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainPage(),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20.0),
            child: Text(
              widget.title,
              style: const TextStyle(
                  fontSize: 24, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic),
            ),
          )
        ],
      ),
    );
  }
}
