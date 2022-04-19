import 'package:flutter/material.dart';
import 'package:myecotrip/constants/config.dart';

class TrekDetailCard extends StatefulWidget {
  const TrekDetailCard({Key? key}) : super(key: key);

  @override
  State<TrekDetailCard> createState() => TrekDetailCardState();
}

class TrekDetailCardState extends State<TrekDetailCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 1,
        shadowColor: Colors.white,
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: Config().deviceHeight(context) * 0.3,
          width: Config().deviceWidth(context),
          child: Column(
            children: [Text("Trip details")],
          ),
        ),
      ),
    );
  }

  Widget name() {
    return Container(
      child: Column(
        children:const [
          Text(
            "Anthargange",
            style: TextStyle(),
          )
        ],
      ),
    );
  }
}
