import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myecotrip/constants/config.dart';
import 'package:myecotrip/main/home/screens/widgets/float_couralSlider.dart';
import 'package:myecotrip/main/news/widgets/news_tile.dart';

import '../../treks_page/widgets/trek_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                ClipPath(
                  clipper: CurveClipper(),
                  child: Container(
                    color: Colors.green[900]!.withOpacity(0.8),
                    height: Config().deviceHeight(context) * 0.53,
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // logo
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: Config().deviceHeight(context) * 0.1,
                                width: Config().deviceWidth(context) * 0.35,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage(IMAGES + 'logo.png'))),
                              )
                            ],
                          ),
                          // text
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: const [
                                    Text(
                                      "Explore Karnataka",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Ecotrails Landscape",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),

                          FloatingCouraslSlider(),
                        ],
                      ),
                    ),
                  ),
                ),
                title(title: "Popular Treks", ontap: () {}),
                Container(
                  height: 200,
                  child: GridView(
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 0.8,
                    ),
                    children: [
                      TrekTile(
                        fit: BoxFit.fill,
                        title: "Makalidurga",
                        location: "Bangalore",
                        imgUrl: "assets/images/trek1.webp",
                      ),
                      TrekTile(
                        fit: BoxFit.fill,
                        title: "Anthargange",
                        location: "Bellary",
                        imgUrl: "assets/images/aboutus.jpg",
                      ),
                      TrekTile(
                        fit: BoxFit.fill,
                        title: "Ramadevara betta",
                        location: "Bangalore",
                        imgUrl: "assets/images/trek3.webp",
                      ),
                      TrekTile(
                        fit: BoxFit.fill,
                        title: "Makalidurga",
                        location: "Bangalore",
                        imgUrl: "assets/images/trek4.webp",
                      ),
                    ],
                  ),
                ),
                title(title: "Latest News", ontap: () {}),
                NewsTile(
                  title: "Ecotrails Landscape",
                  description:
                      "The Karnataka Forest Department has come out with a Coffee Table book. The book focuses on the lives of the ",
                  imgurl: IMAGES + "news1.jpeg",
                ),
                SizedBox(
                  height: Config().deviceHeight(context) * 0.1,
                )
              ],
            )),
      ),
    );
  }

  title({required String title, required void Function()? ontap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
          ),
          GestureDetector(
            onTap: ontap,
            child: Text(
              "See all",
              style: TextStyle(
                  color: Colors.green.shade800,
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    int curveHeight = 15;
    Offset controlPoint = Offset(size.width / 2, size.height + curveHeight);
    Offset endPoint = Offset(size.width, size.height - curveHeight);

    Path path = Path()
      ..lineTo(0, size.height - curveHeight)
      ..quadraticBezierTo(
          controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
