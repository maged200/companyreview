import 'package:flutter/material.dart';

class DefaultTheme {
  static Color get primaryColor => Colors.black;
  static Color get lightSecondaryColor => Color(0xFFA9BDBE);
  static Color get lightColor => Colors.white;
  static Color get rustyLightColor => Color(0xFFEFFFFF);
  static Color get ghostColor => Colors.transparent;
  static Color get successColor => Color(0xFF009845);
  static Color get darksuccessColor => Color(0xFF0A7746);
  static Color get lightSuccessColor => Color(0xFF23FF8A);
  static Color get lightopasetySuccessColor => Color(0xFF81E77A);
  static Color get lightSkyColor => Color(0xFF57B6B2);
  static Color get darkSkyColor => Color(0xFF6FB1C8);
  static Color get deepPerpelColor => Color(0xFF888AB4);
  static Color get copySuccessColor => Color(0xFF6CCA98);
  static Color get lightWoodColor => Color(0xFFAAC27F);
  static Color get rejectColor => Colors.red[700];
  static Color get backGround => Color(0xFF40A0DE);
  static Color get darkerSecondaryBrandColor => Colors.pink[500];
  static Color get darkBorderColor => Color(0xFF707070);
  static Color get ratingColor => Color(0xFFFDD676);
  static Color get titleColor => Color(0xFF013133);
  static Color get cardopasetyColor => Color(0xFFF1F1F1);
  static Color get btn => Color(0xFFF57B6B2);

  //font family
  static String get fontFamily => 'Cairo';
  // text input
  static Color get textInputBorderColor => Color(0xFF99A7B0);
  static Color get textSelectionColor => Color(0x90CA59E6);

  // primary theme
  static ThemeData get theme => ThemeData(
        dividerColor: lightSecondaryColor,
        unselectedWidgetColor: lightSecondaryColor,
        // ignore: deprecated_member_use
        cursorColor: textInputBorderColor,
        // ignore: deprecated_member_use
        textSelectionColor: textSelectionColor,
        // ignore: deprecated_member_use
        textSelectionHandleColor: primaryColor,
        fontFamily: fontFamily,

        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
        primaryColor: lightColor,
        highlightColor: lightSecondaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: darkerSecondaryBrandColor, width: 1),
          ),
        ),
        primaryColorDark: primaryColor,
        primaryColorLight: lightSecondaryColor,
      );
  //hint and tour
  static Color get hintTextColor => Color(0xFFFFFFFF);
  static Color get hintTargetColor => Color(0xFFFFFFFF);
  static Color get hintBackgroundColor => Colors.deepPurple[600];
  static Color get hintIconColor => Colors.black;
}
