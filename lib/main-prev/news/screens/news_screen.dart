import 'package:flutter/material.dart';
import 'package:myecotrip/main/home/screens/widgets/home_box2img.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   leading: IconButton(
        //     icon: const Icon(Icons.arrow_back_ios),
        //     onPressed: () {},
        //   ),
        //   title: Text(
        //     "our Latest News",
        //     // TODO : use heading 1 style
        //     style: TextStyle(),
        //   ),
        // ),
        body: Center(
      child: Text("news"),
    ));
  }
}
