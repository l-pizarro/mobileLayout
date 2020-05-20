import 'package:flutter/material.dart';

class ThemeColors {
  ThemeColors._(); // this basically makes it so you can instantiate this class

  static const _grayPrimary = 0xff9DA6BB;
  static const _purplePrimary = 0xff6764A1;
  static const _greenPrimary = 0xff48BB78;

  static const MaterialColor gray = const MaterialColor(
    _grayPrimary,
    const <int, Color>{
      100: const Color(0xffEBEDF1),
      200: const Color(0xffD8DBE4),
      300: const Color(0xffC4C9D6),
      400: const Color(0xffB1B8C9),
      500: const Color(_grayPrimary),
      600: const Color(0xff7E8596),
      700: const Color(0xff5E6370),
      800: const Color(0xff3F424B),
      900: const Color(0xff1F2125),
    },
  );

  static const MaterialColor purple = const MaterialColor(
    _purplePrimary,
    const <int, Color>{
      100: const Color(0xffE1E0EC),
      200: const Color(0xffC2C1D9),
      300: const Color(0xffA4A2C7),
      400: const Color(0xff8583B4),
      500: const Color(_purplePrimary),
      600: const Color(0xff525081),
      700: const Color(0xff3E3C61),
      800: const Color(0xff292840),
      900: const Color(0xff151420),
    },
  );

  static const MaterialColor green = const MaterialColor(
    _greenPrimary,
    const <int, Color>{
      100: const Color(0xffF0FFF4),
      200: const Color(0xffC6F6D5),
      300: const Color(0xff9AE6B4),
      400: const Color(0xff68D391),
      500: const Color(_greenPrimary),
      600: const Color(0xff38A169),
      700: const Color(0xff2F855A),
      800: const Color(0xff276749),
      900: const Color(0xff22543D),
    },
  );
}