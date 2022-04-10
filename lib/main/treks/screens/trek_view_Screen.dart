import 'package:flutter/material.dart';

class TrekViewScreen extends StatefulWidget {
  String title;
  String location;
  String content;
   TrekViewScreen({ Key? key,required this.content,required this.location,required this.title }) : super(key: key);

  @override
  State<TrekViewScreen> createState() => _TrekViewScreenState();
}

class _TrekViewScreenState extends State<TrekViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bring app bar from other screen
      appBar: AppBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //contiaenr with fade AT BOTTOM
              Container(
                child: Column(
                  children: [
                    //TITLE of trek
                    Text(widget.title),
                    // new row 
                    Text(widget.content)
                    // check availbility button
                    
                    
                    
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      
    );
  }
}