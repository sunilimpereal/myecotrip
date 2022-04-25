import 'package:flutter/material.dart';
import 'package:myecotrip/constants/config.dart';
import 'package:myecotrip/main/Trekking_Details_page/Widgets/app_bar.dart';
import 'package:myecotrip/main/Trekking_Details_page/Widgets/back_button.dart';
import 'package:myecotrip/main/appbar/customappbar.dart';
import 'package:myecotrip/main/home/screens/widgets/home_box2img.dart';
import 'package:myecotrip/main/news/widgets/news_tile.dart';
import 'package:myecotrip/main/news/widgets/scroll_behaviour.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarMain(title: "Our Latest News"),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    NewsTile(
                      title: "Ecotrails Landscape",
                      description:
                          "The Karnataka Forest Department has come out with a Coffee Table book. The book focuses on the lives of the ",
                      imgurl: IMAGES + "news1.jpeg",
                    ),
                    NewsTile(
                      title: "BIRD FESTIVAL 2020",
                      description:
                          "Nandi never ceases to spring surprises to birdwatchers with more than 200 species of birds. From spotting unusual birds like...",
                      imgurl: IMAGES + "news2.jpg",
                    ),
                    NewsTile(
                      title: "Ecotrails Landscape",
                      description:
                          "The Karnataka Forest Department has come out with a Coffee Table book. The book focuses on the lives of the ",
                      imgurl: IMAGES + "news1.jpeg",
                    ),
                    NewsTile(
                      title: "BIRD FESTIVAL 2020",
                      description:
                          "Nandi never ceases to spring surprises to birdwatchers with more than 200 species of birds. From spotting unusual birds like...",
                      imgurl: IMAGES + "news2.jpg",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
