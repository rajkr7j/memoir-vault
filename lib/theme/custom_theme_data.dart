import 'package:flutter/material.dart';

import 'package:memoir_vault/theme/custom_color_class.dart';

class CustomThemeData {
  final ThemeData baseTheme;
  final CustomColors customColors;
  final String bgImage;
  final String bannerImage;

  CustomThemeData(
      {required this.baseTheme,
      required this.customColors,
      required this.bannerImage,
      required this.bgImage});
}
