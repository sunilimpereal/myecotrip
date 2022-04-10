import 'package:flutter/cupertino.dart';
import 'package:myecotrip/utils/shared_pref.dart';

String API_ROOT = 'https://karnatakaecotourism.com/api/mobile/';
String API_ROOTV1 = '' + 'api/v1/';
String ICON_ROOT = 'https://zts.afroaves.com/icons/';
String IMAGES = 'assets/images/';
String ICONS = 'assets/icons/';

class Config {
  


  double deviceHeight(BuildContext context){
    return MediaQuery.of(context).size.height;

  }
  double deviceWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

}
