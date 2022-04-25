import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myecotrip/constants/config.dart';
import 'package:myecotrip/main/Trekking_Details_page/Screens/details_homepage.dart';

/// Floating Courasal Slider that is used
/// in home screen after heading
class FloatingCouraslSlider extends StatefulWidget {
  const FloatingCouraslSlider({Key? key}) : super(key: key);

  @override
  State<FloatingCouraslSlider> createState() => _FloatingCouraslSliderState();
}

class _FloatingCouraslSliderState extends State<FloatingCouraslSlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        CarouselItem(image: "crousal1.png", name: "", ontap: () {}),
        CarouselItem(image: "crousal2.png", name: "", ontap: () {}),
        CarouselItem(image: "crousal3.png", name: "", ontap: () {}),
        CarouselItem(image: "crousal1.png", name: "", ontap: () {})
      ],
      options: CarouselOptions(
        height: Config().deviceHeight(context) * 0.25,
        autoPlay: true,
        autoPlayCurve: Curves.ease,
        enlargeCenterPage: true,
      ),
    );
  }
}

class CarouselItem extends StatelessWidget {
  String image;
  String name;
  Function ontap;
  CarouselItem({Key? key, required this.image, required this.name, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      clipBehavior: Clip.hardEdge,
      color: Colors.white,
      elevation: 0,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TrekDetailslMainpage(),
            ),
          );
        },
        splashColor: Colors.red,
        child: Ink(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  image: DecorationImage(
                    image: AssetImage(IMAGES + '$image'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: double.maxFinite,
                    height: Config().deviceHeight(context) * 0.3 * 0.3,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.green.withOpacity(0.5),
                      Colors.transparent,
                    ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
