import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData primaryTheme = ThemeData(
    fontFamily: AppColor.appFontRegular,
    primaryColor: AppColor.primarySwatch,
    primarySwatch: AppColor.primarySwatch,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColor.primarySwatch,
      primary: AppColor.primarySwatch,
      error: AppColor.errorColor,
    ),
    iconTheme: IconThemeData(color: AppColor.iconColor),
    backgroundColor: AppColor.whiteColor,
    scaffoldBackgroundColor: AppColor.whiteColor,
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 16, color: AppColor.textPrimaryColor, fontFamily: AppColor.appFontRegular),
      bodyText1: TextStyle(fontSize: 14, color: AppColor.textPrimaryColor, fontFamily: AppColor.appFontLight),
      bodyText2: TextStyle(fontSize: 14, color: AppColor.textPrimaryColor.withOpacity(0.70), fontFamily: AppColor.appFontLight),
      subtitle1: TextStyle(fontSize: 14, color: AppColor.textPrimaryColor, fontFamily: AppColor.appFontRegular),
      subtitle2: TextStyle(fontSize: 14, color: AppColor.textPrimaryColor, fontFamily: AppColor.appFontLight),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: false,
      backgroundColor: AppColor.primaryColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColor.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      iconTheme: IconThemeData(color: AppColor.whiteColor),
      titleTextStyle: TextStyle(
        fontSize: 18,
        color: AppColor.whiteColor,
        fontFamily: AppColor.appFontRegular,
      ),
      actionsIconTheme: IconThemeData(
        size: 22,
        color: AppColor.textPrimaryColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(AppColor.whiteColor),
        side: MaterialStateProperty.all<BorderSide>(BorderSide(color: AppColor.primaryColor)),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    ),
    cardTheme: CardTheme(
      margin: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      contentPadding: EdgeInsets.only(left: 15, top: 5, right: 20, bottom: 5),
      labelStyle: TextStyle(
        fontSize: 14,
        color: AppColor.textPrimaryColor.withOpacity(0.70),
        fontFamily: AppColor.appFontLight,
      ),
      fillColor: Colors.white,
      filled: true,
      hintStyle: TextStyle(
        fontSize: 14,
        color: AppColor.textPrimaryColor.withOpacity(0.70),
        fontFamily: AppColor.appFontLight,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.errorColor),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.primaryColor),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.grayColor),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.primaryColor),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.grayColor),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.grayColor),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      errorStyle: TextStyle(height: 0),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all<Color>(AppColor.primaryColor),
    )
  );
}

class AppColor {
  static Map<int, Color> colorSwatch = {
    50: Color(0xFFe4edff),
    100: Color(0xFFd0e0ff),
    200: Color(0xFFbcd3ff),
    300: Color(0xFFa9c5ff),
    400: Color(0xFF95b8ff),
    500: Color(0xFF81abff),
    600: Color(0xFF6e9eff),
    700: Color(0xFF5a91ff),
    800: Color(0xFF4784ff),
    900: Color(0xFF0040C1),
  };

  static MaterialColor primarySwatch = MaterialColor(0xFF0040C1, AppColor.colorSwatch);

  static var appFontLight = GoogleFonts.prompt(fontWeight: FontWeight.w300).fontFamily;
  static var appFontRegular = GoogleFonts.prompt(fontWeight: FontWeight.w400).fontFamily;

  static Color iconColor = Colors.white;
  static Color primaryColor = Color(0xFF0040C1);
  static Color secondaryColor = Color(0x33007BFF);
  static Color errorColor = Color(0xFFFB4E4E);
  static Color successColor = Color(0xFF7AC796);

  static Color textPrimaryColor = Color(0xFF222B48);
  static Color textSecondaryColor = Color(0xFF7788A7);
  static Color bgColor = Color(0xFFF6F9FE);

  static Color whiteColor = Color(0xFFFFFFFF);
  static Color grayColor = Color(0xFFF2F2F5);
}
