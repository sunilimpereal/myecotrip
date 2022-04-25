import 'package:flutter/material.dart';
import 'package:myecotrip/constants/config.dart';
import 'package:myecotrip/main/home/screens/home_screen.dart';
import 'package:myecotrip/main/news/screens/news_screen.dart';
import 'package:myecotrip/main/profile/screen/profile_screen.dart';
import 'package:myecotrip/main/search/screen/search_screen.dart';
import 'package:myecotrip/utils/svg_icon.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentindex = 0;
  List pages = const [
    HomeScreen(),
    SearchScreen(),
    NewsScreen(),
    ProfileScreen(),
  ];

  void onTap(int index) {
    setState(() {
      currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              height: Config().deviceHeight(context),
              child: pages[currentindex],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 70,
                width: Config().deviceWidth(context),
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.transparent,
                    clipBehavior: Clip.hardEdge,
                    child: BottomNavigationBar(
                      currentIndex: currentindex,
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.green,
                      unselectedItemColor: Colors.grey.withOpacity(0.5),
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      elevation: 0,
                      onTap: onTap,
                      items: [
                        navItem(
                            currentIndex: currentindex, index: 0, name: "home"),
                        navItem(
                            currentIndex: currentindex,
                            index: 1,
                            name: "search"),
                        navItem(
                            currentIndex: currentindex, index: 2, name: "news"),
                        navItem(
                            currentIndex: currentindex,
                            index: 3,
                            name: "profile"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

BottomNavigationBarItem navItem({
  required int index,
  required int currentIndex,
  required String name,
}) {
  return BottomNavigationBarItem(
    icon: SvgIcon(
        color: currentIndex == index ? Colors.green : Colors.grey,
        path: "${name}.svg"),
    label: name,
  );
}
