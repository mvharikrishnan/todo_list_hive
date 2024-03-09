import 'package:flutter/material.dart';
import 'package:to_do_list_hive/app_config/theme.dart';

class Styles {
  //BuildContext will be needed in the future for making the UI responsive
  static BuildContext? _context;
  static Styles? _styles;

  final TextStyle _mainFont = const TextStyle(fontFamily: 'Nunito');

  static Styles of(BuildContext context) {
    _styles ??= Styles();
    _context = context;
    return _styles!;
  }

  // headStyle 1
  TextStyle get headStyle1 {
    return _mainFont.copyWith(
      color: AppColours.black,
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
    );
  }

  // bodyStyle 3
  TextStyle get bodyStyle3 {
    return _mainFont.copyWith(
      color: AppColours.black,
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
    );
  }
}
