import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColours {
  static const primary = Color(0XFF006836);
  static const secondary = Color(0XFF006837);
  static const textBoxColor = Color(0XFFF7F8F8);
  static const white = Color(0XFFFFFFFF);
  static const black = Color(0XFF000000);
  static const textGrey = Color(0XFF9B9B9B);
  static const textFieldBackground = Color(0XFFF2FAFD);
  static const hintTextColor = Color(0XFF9fa7a4);
  static const orange = Color(0XFFFFA308);
  static const redColor = Color(0XFFff0000);
  static const cancelButtonColor = Color(0xFFFF8080);
  static const grey1 = Color(0xFFECECEC);
  static const grey2 = Color(0xFFE1E1E1);
  static const lightGreen2 = Color(0xFFCCFFD4);
  static const lightBlack = Color(0xFF444444);
  static const lightBlue1 = Color(0xFF57B9F0);
  static const splashBackgroundColor = Color(0xFFffb214);
}

class AppTheme {
  static ThemeData of(context) {
    var theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: AppColours.primary,
      appBarTheme: theme.appBarTheme.copyWith(
        color: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.transparent,
        titleSpacing: 0,
        titleTextStyle: Theme.of(context)
            .textTheme
            .button
            ?.copyWith(color: AppColours.primary, fontSize: 18),
        iconTheme: const IconThemeData(color: AppColours.primary),
      ),
      textTheme: theme.textTheme
          .copyWith(
            subtitle1: GoogleFonts.inter(
                color: AppColours.black,
                fontSize: 16,
                letterSpacing: 0.15,
                fontWeight: FontWeight.bold),
          )
          .apply(),
    );
  }

  TextStyle customTextNormal(Color color, double fontSize) {
    return GoogleFonts.inter(
        color: color,
        fontSize: fontSize,
        letterSpacing: 0.4,
        fontWeight: FontWeight.normal);
  }
}
