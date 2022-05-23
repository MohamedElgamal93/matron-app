import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/show_log.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:flutter/material.dart';

class CommonLinearProgress extends StatelessWidget {
  final double value;
  const CommonLinearProgress(this.value,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    showLog('progress', value);
    return Container(
      height: SizeConfig.height(context: context, pixels: 2),
      width: MediaQuery.of(context).size.width * value,
      color: ConstColors.primaryColor,
    );
  }
}