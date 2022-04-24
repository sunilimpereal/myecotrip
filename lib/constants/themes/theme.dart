
import 'package:flutter/material.dart';
import 'package:myecotrip/constants/config.dart';

ThemeData get Theme1 {
  Color primary = Color(0xFF048998);
  Color secondary = Color(0xFF3BB4C1);
  Color background = Color(0xFFE3E3E3);
  Color backGroundSecondary = Color(0xFFF6F5F5);
  Color textColor = Color(0xFF152D35);
  String themeFont = Montserrat;

  return ThemeData(
      //colors.
      primaryColor: primary,
      backgroundColor: background,
      scaffoldBackgroundColor: background,

      //hover Color
      hoverColor: Color(0xffe5e5e5).withOpacity(0.2),
      highlightColor: primary.withOpacity(0.2),
      splashColor: secondary.withOpacity(0.4),
      cardColor: Color(0xFF404656).withOpacity(0.1),

      // icons
      iconTheme: IconThemeData(color: primary),

      //button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: OutlinedButton.styleFrom(
            primary: Color(0xFFFFFFFF),
            backgroundColor: Color(0xFF048998),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
            padding: EdgeInsets.all(8),
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

        )
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: primary,
        iconTheme: IconThemeData(color: Color(0xFFffffff), size: 16),
        titleTextStyle: TextStyle(color: Color(0xFFE3E3E3), fontFamily: themeFont),
        actionsIconTheme: IconThemeData(color: Color(0xFFffffff).withOpacity(0.8)),
      ),
      cardTheme: CardTheme(),
      inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: textColor),
          hintStyle: TextStyle(color: textColor.withOpacity(0.3)),
          focusColor: primary,
          hoverColor: primary),
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
