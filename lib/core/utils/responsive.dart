import 'package:flutter/widgets.dart';

class Responsive{

  static double width(BuildContext context)=> MediaQuery.of(context).size.width;
  static double height(BuildContext context)=> MediaQuery.of(context).size.height;

static double wp(BuildContext context, double percent) =>
      width(context) * (percent / 100);

  static double hp(BuildContext context, double percent) =>
      height(context) * (percent / 100);

  static double sp(BuildContext context, double size) =>
      wp(context, size);

}