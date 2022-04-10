import 'package:flutter/material.dart';

class TreksScreen extends StatefulWidget {
  const TreksScreen({ Key? key }) : super(key: key);

  @override
  State<TreksScreen> createState() => _TreksScreenState();
}

class _TreksScreenState extends State<TreksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bring app bar from other screen 
        appBar: AppBar(),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // add the rolling scroll items in the screen
              ],
            ),
          ),
        ),
      );
      
    
  }
}