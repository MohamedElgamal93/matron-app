import 'package:flutter/cupertino.dart';

class SizeConfig {
  static double width({required BuildContext context, required int pixels}) {
    final width = MediaQuery.of(context).size.width;
    return width * pixels / 390;
  }

 static double  height({required BuildContext context, required int pixels}) {
    final height = MediaQuery.of(context).size.height;
    return height * pixels / 844 ;
  }
}
