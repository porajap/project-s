import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  var appFont = GoogleFonts.prompt().fontFamily;

  double radius = 8;

  ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
          backgroundColor: AppColor.write,
          actionsIconTheme: const IconThemeData(
            color: AppColor.icon,
          ),
          iconTheme: const IconThemeData(
            color: AppColor.icon,
          ),
          elevation: 0,
          centerTitle: false,
        ),
        primaryColor: AppColor.primary,
        primarySwatch: AppColor.primarySwatch,
        scaffoldBackgroundColor: AppColor.bg,
        colorScheme: ColorScheme.light(
          primary: AppColor.primarySwatch.shade600,
          secondary: AppColor.primarySwatch.shade100,
          error: AppColor.error,
          surfaceTint: Colors.transparent,
          tertiary: AppColor.primarySwatch,
          outline: AppColor.graySwatch.shade400,
        ),
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            fontFamily: appFont,
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: AppColor.title,
          ),
          titleLarge: TextStyle(
            fontFamily: appFont,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColor.title,
          ),
          titleMedium: TextStyle(
            fontFamily: appFont,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColor.title,
          ),
          titleSmall: TextStyle(
            fontFamily: appFont,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColor.title,
          ),
          bodyLarge: TextStyle(
            fontFamily: appFont,
            fontSize: 16,
            color: AppColor.textBody,
          ),
          bodyMedium: TextStyle(
            fontFamily: appFont,
            fontSize: 14,
            color: AppColor.textBody,
          ),
          bodySmall: TextStyle(
            fontFamily: appFont,
            fontSize: 12,
            color: AppColor.subTitle,
          ),
        ),
        iconTheme: const IconThemeData(
          color: AppColor.icon,
        ),
        listTileTheme: ListTileThemeData(
          titleTextStyle: TextStyle(
            fontFamily: appFont,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColor.title,
          ),
          textColor: AppColor.title,
        ),
        inputDecorationTheme: InputDecorationTheme(
          iconColor: AppColor.primary,
          prefixIconColor: AppColor.primary,
          suffixIconColor: AppColor.primary,
          prefixStyle: const TextStyle(
            color: AppColor.primary,
          ),
          labelStyle: const TextStyle(
            color: AppColor.subTitle,
          ),
          hintStyle: const TextStyle(
            color: AppColor.subTitle,
          ),
          fillColor: AppColor.write,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: AppColor.subTitle.withOpacity(0.2),
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: AppColor.subTitle.withOpacity(0.2),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: AppColor.subTitle.withOpacity(0.2),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(
              color: AppColor.primary,
            ),
          ),
        ),
        cardTheme: CardTheme(
          color: AppColor.write,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius), side: BorderSide.none),
        ),
        dividerTheme: DividerThemeData(color: AppColor.subTitle.withOpacity(0.2), thickness: 0.5),
        dividerColor: AppColor.subTitle.withOpacity(0.3),
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          checkColor: WidgetStateColor.resolveWith(
            (states) => AppColor.write,
          ),
          visualDensity: VisualDensity.compact,
          side: WidgetStateBorderSide.resolveWith(
            (states) {
              if (states.contains(WidgetState.disabled)) {
                return const BorderSide(
                  color: Colors.grey, // Choose your desired color for disabled state
                  width: 1,
                );
              }
              return const BorderSide(
                color: AppColor.primary,
                width: 1,
              );
            },
          ),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            backgroundColor: AppColor.write,
            foregroundColor: AppColor.title,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 0.5, color: Color(0xFFEAECF0)),
              borderRadius: BorderRadius.circular(radius),
            ),
            textStyle: TextStyle(
              fontFamily: appFont,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColor.title,
            ),
            disabledBackgroundColor: Colors.grey,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            backgroundColor: AppColor.primarySwatch,
            foregroundColor: AppColor.write,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            textStyle: TextStyle(
              fontFamily: appFont,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColor.title,
            ),
            disabledBackgroundColor: Colors.grey,
          ),
        ),
        dialogTheme: DialogTheme(
          backgroundColor: AppColor.write,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          actionsPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          titleTextStyle: TextStyle(
            fontFamily: appFont,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColor.title,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColor.primarySwatch.shade500,
            textStyle: TextStyle(
              fontFamily: appFont,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColor.write,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: AppColor.write,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        tabBarTheme: TabBarTheme(
          unselectedLabelColor: AppColor.subTitle,
          labelPadding: const EdgeInsets.symmetric(vertical: 10),
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: AppColor.subTitle.withOpacity(0.2),
        ),
        radioTheme: RadioThemeData(
          fillColor: WidgetStateColor.resolveWith((states) => AppColor.primary),
        ),
        unselectedWidgetColor: AppColor.subTitle,
        disabledColor: AppColor.subTitle,
      );
}

class AppColor {
  //use shade 600

  static const int _primaryValue = 0xFF1570EF;
  static const int _grayValue = 0xFF667085;
  static const int _errorValue = 0xFFFD4438;
  static const int _warningValue = 0xFFF79009;
  static const int _successValue = 0xFF12B76A;

  static const Color primary = Color(_primaryValue);
  static const Color write = Color(0xFFFFFFFF);
  static const Color gray = Color(_grayValue);
  static const Color error = Color(_errorValue);
  static const Color warning = Color(_warningValue);
  static const Color success = Color(_successValue);

  static const Color docSuccess = Color(0xFFF6FEF9);
  static const Color docCancel = Color(0xFFFFFBFA);

  static const Color appBar = Color(0xFFFCFCFD);
  static const Color bg = Color(0xFFF9FAFB);
  static const Color icon = Color(_primaryValue);
  static const Color title = Color(0xFF000000);
  static const Color subTitle = Color(0xFF667082);
  static const Color textBody = Color(0xFF000000);

  static const MaterialColor primarySwatch = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(0xFFEFF8FF),
      100: Color(0xFFD1E9FF),
      200: Color(0xFFB9D4FA),
      300: Color(0xFF8AB8F7),
      400: Color(0xFF5B9BF4),
      500: Color(0xFF3885F1),
      600: Color(_primaryValue),
      700: Color(0xFF0F5DEB),
      800: Color(0xFF0C53E8),
      900: Color(0xFF0641E4),
    },
  );

  static const MaterialColor graySwatch = MaterialColor(
    _grayValue,
    <int, Color>{
      50: Color(0xFFF9FAFB),
      100: Color(0xFFF2F4F7),
      200: Color(0xFFEAECF0),
      300: Color(0xFFD0D5DD),
      400: Color(0xFF98A2B3),
      500: Color(_grayValue),
      600: Color(0xFF475467),
      700: Color(0xFF344054),
      800: Color(0xFF1D2939),
      900: Color(0xFF101828),
    },
  );

  static const MaterialColor errorSwatch = MaterialColor(
    _errorValue,
    <int, Color>{
      50: Color(0xFFFEF3F2),
      100: Color(0xFFFEE4E2),
      200: Color(0xFFFECDCA),
      300: Color(0xFFF3A7B0),
      400: Color(0xFFEF8F9C),
      500: Color(_errorValue),
      600: Color(0xFFD92D20),
      700: Color(0xFFB42318),
      800: Color(0xFF912018),
      900: Color(0xFF7A271A),
    },
  );

  static const MaterialColor warningSwatch = MaterialColor(
    _warningValue,
    <int, Color>{
      50: Color(0xFFFFFAEB),
      100: Color(0xFFFEF0C7),
      200: Color(0xFFFEDF89),
      300: Color(0xFFFEC84B),
      400: Color(0xFFFDBD22),
      500: Color(_warningValue),
      600: Color(0xFFDC6803),
      700: Color(0xFFB5470B),
      800: Color(0xFF93370D),
      900: Color(0xFF7A2E0E),
    },
  );

  static const MaterialColor successSwatch = MaterialColor(
    _successValue,
    <int, Color>{
      50: Color(0xFFECFDF3),
      100: Color(0xFFD1FADF),
      200: Color(0xFFA4F4C5),
      300: Color(0xFF5CE9A6),
      400: Color(0xFF32D583),
      500: Color(_successValue),
      600: Color(0xFF028755),
      700: Color(0xFF027A48),
      800: Color(0xFF05603A),
      900: Color(0xFF054F31),
    },
  );
}
