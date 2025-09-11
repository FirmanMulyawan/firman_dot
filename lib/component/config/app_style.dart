import 'package:flutter/material.dart';

class AppStyle {
  static Color textColor = const Color(0xff333333);
  static Color grey1 = const Color(0xff4F4F4F);
  static Color grey3 = const Color(0xff828282);
  static Color blue = const Color(0xff0A97B0);
  static Color blue1 = const Color(0xff2F80ED);
  static Color blue2 = const Color(0xff2D9CDB);
  static Color blue3 = const Color(0xff56CCF2);
  static Color whiteColor = Colors.white;
  static Color teal = const Color(0xff46B5A7);
  static Color yellow = const Color(0xffF2C94C);
  static Color orange = const Color(0xffF2994A);
  static Color red = const Color(0xffEB5757);
  static Color purple1 = const Color(0xff9B51E0);
  static Color purple2 = const Color(0xffBB6BD9);
  static Color green2 = const Color(0xff27AE60);

//
  static Color hintColor = const Color(0xffD7E3DF);
  static Color errorTextColor = const Color(0xffFF5252);
  static Color borderColor = const Color(0xff669585);
  static Color buttonDisabledColor = const Color(0xffCCDBD6);
  static Color buttonDisabledShadowColor = const Color(0xff99A3A0);

  static Color mainGreen = const Color(0xff90BE6D);
  static Color hoverGreen = const Color(0xff43AA8B);
  static Color green = const Color(0xff418E83);
  static Color pressedGreen = const Color(0xff40807E);

  static Color borderBlue = const Color(0xff81DEF0);
  static Color mainBlue = const Color(0xff25C7E8);
  static Color hoverBlue = const Color(0xff17AEC4);
  static Color pressedBlue = const Color(0xff2C8DB0);

  static Color hoverYellow = const Color(0xffEDAD14);
  static Color pressedYellow = const Color(0xffC38C06);
  static Color yellowBackground = const Color(0xfffcd51b);
  static Color yellowShadow = const Color(0xffffbb25);

  static Color hoverOrange = const Color(0xffE27B02);
  static Color pressedOrange = const Color(0xffF66A03);

  static Color mainRed = const Color(0xffFF5252);
  static Color hoverRed = const Color(0xffE31A37);
  static Color pressedRed = const Color(0xffA40219);

  static Color progressBarTopBlue = const Color(0xff8EE3F4);
  static Color progressBarBottomBlue = const Color(0xff1DC7E9);

  static Color homeLearnGreen = const Color(0xff62AA8F);
  static Color homeLearnHover = const Color(0xff507E7D);

  static Color homeAssessmentOrange = const Color(0xffEB8D34);
  static Color homeAssessmentHover = const Color(0xffE5732E);

  static Color homeArabicBlue = const Color(0xff3EBDEA);
  static Color homeArabicHover = const Color(0xff359CC1);

  static Color homePrayerGreen = const Color(0xff4FD371);
  static Color homePrayerHover = const Color(0xff3B9E55);

  static Color homeYoutubeRed = const Color(0xffFD4D43);
  static Color homeYoutubeHover = const Color(0xffBE3A32);
  static Color homeYoutubeButton = const Color(0xffF3CB2E);
  static Color homeYoutubeShadow = const Color(0xffF68400);

  static Color dialogBgColor = const Color(0xff014F34).withValues(alpha: 0.4);

  // static const int _appthemePrimaryValue = 0xff5B6E96;
  // static const MaterialColor appTheme = MaterialColor(_appthemePrimaryValue, <int, Color>{
  //   50: Color(0xFFFCE4E5),
  //   100: Color(0xFFF8BCBF),
  //   200: Color(0xFFF39094),
  //   300: Color(0xFFEE6469),
  //   400: Color(0xFFEA4249),
  //   500: Color(_appthemePrimaryValue),
  //   600: Color(0xFFE31D24),
  //   700: Color(0xFFDF181F),
  //   800: Color(0xFFDB1419),
  //   900: Color(0xFFD50B0F),
  // });

  static OutlineInputBorder inputBorderTheme() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: 1.5),
      borderRadius: const BorderRadius.all(Radius.circular(15)),
    );
  }

  static OutlineInputBorder errorBorderTheme() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: errorTextColor, width: 1.5),
      borderRadius: const BorderRadius.all(Radius.circular(15)),
    );
  }

  static OutlineInputBorder disabledBorderTheme() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: 1.5),
      borderRadius: const BorderRadius.all(Radius.circular(15)),
    );
  }

  // static BorderRadius borderRadiusVerySmall() => BorderRadius.circular(4.0);
  // static BorderRadius borderRadiusSmall() => BorderRadius.circular(8.0);
  // static BorderRadius borderRadiusMedium() => BorderRadius.circular(20.0);

  static ThemeData themeData(BuildContext context) {
    return ThemeData(
        useMaterial3: false,
        fontFamily: 'SourceSansPro',
        // primarySwatch: AppStyle.appTheme,
        textTheme: TextTheme(
            titleMedium: regular(
          textColor: AppStyle.pressedGreen,
          size: 15,
        )),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.zero,
          enabledBorder: inputBorderTheme(),
          border: inputBorderTheme(),
          focusedBorder: inputBorderTheme(),
          focusedErrorBorder: errorBorderTheme(),
          errorBorder: errorBorderTheme(),
          disabledBorder: disabledBorderTheme(),
          errorStyle: regular(
            textColor: AppStyle.errorTextColor,
            size: 12,
          ),
          floatingLabelStyle: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
          labelStyle: TextStyle(
            color: AppStyle.pressedGreen,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle: regular(
            textColor: hintColor,
            size: 15,
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            minimumSize: const Size.fromHeight(44),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            disabledForegroundColor: AppStyle.whiteColor,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            side: BorderSide(color: borderColor, width: 0.5),
            foregroundColor: textColor,
            minimumSize: const Size.fromHeight(44),
            disabledForegroundColor: AppStyle.whiteColor,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            disabledForegroundColor: buttonDisabledColor,
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppStyle.pressedGreen,
        ));
  }

  static TextStyle light({
    Color? textColor,
    double size = 14,
    fontStyle = FontStyle.normal,
  }) {
    return TextStyle(
      fontSize: size,
      color: textColor ?? AppStyle.textColor,
      letterSpacing: 0,
      fontFamily: 'SourceSansPro',
      fontWeight: FontWeight.w400,
      fontStyle: fontStyle,
    );
  }

  static TextStyle regular({
    Color? textColor,
    double size = 14,
    double? height,
    fontStyle = FontStyle.normal,
  }) {
    return TextStyle(
      fontSize: size,
      color: textColor ?? AppStyle.textColor,
      letterSpacing: 0,
      height: height ?? 1.2,
      fontFamily: 'SourceSansPro',
      fontWeight: FontWeight.w500,
      fontStyle: fontStyle,
    );
  }

  static TextStyle medium({
    Color? textColor,
    double size = 14,
    fontStyle = FontStyle.normal,
  }) {
    return TextStyle(
      fontSize: size,
      color: textColor ?? AppStyle.textColor,
      letterSpacing: 0,
      fontFamily: 'SourceSansPro',
      fontWeight: FontWeight.w600,
      fontStyle: fontStyle,
    );
  }

  static TextStyle bold({
    Color? textColor,
    double size = 14,
    FontStyle fontStyle = FontStyle.normal,
  }) {
    return TextStyle(
      fontSize: size,
      color: textColor ?? AppStyle.textColor,
      letterSpacing: 0,
      fontFamily: 'SourceSansPro',
      fontWeight: FontWeight.bold,
      fontStyle: fontStyle,
    );
  }
}
