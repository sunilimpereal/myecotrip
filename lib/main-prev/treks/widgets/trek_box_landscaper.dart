import 'package:flutter/material.dart';

class TrekBoxLandscape extends StatefulWidget {
  String title;
  String location;
  String image;
  Function onPressed;
  TrekBoxLandscape({ Key? key,required this.image,required this.location,required this.onPressed,required this.title }) : super(key: key);

  @override
  State<TrekBoxLandscape> createState() => _TrekBoxLandscapeState();
}

class _TrekBoxLandscapeState extends State<TrekBoxLandscape> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              widget.image
            )
          )
        ),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(widget.title),
                    Row(
                      children: [
                        Icon(Icons.location_city),
                        Text(widget.location),
                      ],
                    ),
                    Container(
                      child: Column(
                        children: [
                          IconButton(onPressed: (){
                            widget.onPressed();
                          }, icon: Icon(Icons.arrow_right_alt)),
                        ],
                      ),
                    )

                  ],
                )
              ],
            )
          ],
        ),
      ),
      
    );
  }
}