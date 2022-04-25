import 'package:flutter/material.dart';
import 'package:myecotrip/constants/config.dart';

ThemeData get MainTheme {
  Color primary = const Color(0xff24A645);
  Color secondary = const Color(0xffFAF6F0);
  Color background = const Color(0xFFFAF6F0);
  Color backGroundSecondary = Colors.white;
  Color textColor = const Color(0xFF031927);
  String themeFont = Montserrat;

  return ThemeData(
      //colors.
      primaryColor: primary,
      backgroundColor: background,
      scaffoldBackgroundColor: background,

      //hover Color
      highlightColor: background.withOpacity(0.2),
      splashColor: primary.withOpacity(0.4),

      // icons
      iconTheme: IconThemeData(color: primary),

      //button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: OutlinedButton.styleFrom(
            // primary: primary,
            backgroundColor: backGroundSecondary,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
            visualDensity: VisualDensity(
              horizontal: 1,
              vertical: 1,
            )),
      ),

      //border
      //drop down
      tabBarTheme: TabBarTheme(
          labelColor: primary,
          unselectedLabelColor: Colors.red,
          labelStyle: TextStyle(
            color: primary,
          )),
          
      inputDecorationTheme: InputDecorationTheme(
        
        border: InputBorder.none,
        contentPadding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
        isDense: false,
        hintStyle: TextStyle(
          fontSize: 14,
          color: textColor.withOpacity(0.2),
          fontFamily: Nunito,
        ),
        labelStyle: TextStyle(
          height: 0.9,
          fontSize: 14,
          fontFamily: Nunito,
          color: textColor,
        ),
      ),
      fontFamily: themeFont,
      textSelectionTheme: TextSelectionThemeData(
          cursorColor: primary,
          selectionColor: primary.withOpacity(0.5),
          selectionHandleColor: primary),
          
      colorScheme: ColorScheme(
          primary: primary,
          primaryVariant: primary.withOpacity(0.5),
          secondary: secondary,
          secondaryVariant: secondary.withOpacity(0.5),
          surface: primary,
          background: backGroundSecondary,
          error: Colors.red,
          onPrimary: Color(0xFFF6F5F5),
          onSecondary: secondary,
          onSurface: Color(0xFFF6F5F5),
          onBackground: primary,
          onError: Colors.red,
          brightness: Brightness.light),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 42,
          color: textColor,
          fontFamily: themeFont,
          fontWeight: FontWeight.bold,
        ),

        ///used in card headings,tile title
        headline2: TextStyle(
          color: textColor,
          fontSize: 32,
          fontFamily: themeFont,
          fontWeight: FontWeight.w500,
        ),
        headline3: TextStyle(
          fontSize: 16,
          fontFamily: Montserrat,
          color: textColor,
        ),
        headline4: TextStyle(
          fontSize: 18,
          color: textColor,
        ),
        headline5: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        headline6: TextStyle(
          color: textColor,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        bodyText1: TextStyle(
          color: textColor,
          fontSize: 16,
          fontFamily: themeFont,
        ),
        bodyText2: TextStyle(
          color: Color(0xFF000000),
          fontSize: 16,
          fontFamily: Montserrat,
        ),
        subtitle1: TextStyle(
          color: Color(0xFF000000),
          fontSize: 12,
          fontFamily: themeFont,
        ),
        subtitle2: TextStyle(
          color: Color(0xFF000000),
        ),
      ));
}
