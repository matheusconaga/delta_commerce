import 'package:delta_commerce/core/constants/appColors.dart';
import 'package:delta_commerce/core/constants/appText.dart';
import 'package:flutter/material.dart';

class Apptheme {

  static ThemeData theme = ThemeData(

    appBarTheme: AppBarTheme(
    backgroundColor: Appcolors.primary,
    titleTextStyle: Apptext.Heading2.copyWith(color: Appcolors.light),
    actionsIconTheme: IconThemeData(
      color: Appcolors.light,
    )
    ),

  );

}