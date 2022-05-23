import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:flutter/material.dart';

Future<T?> showDefaultSheet<T>(BuildContext context, {required Widget child}) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: ConstColors.whiteColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    builder: (_) => Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.width(context: context, pixels: 24),
        vertical: SizeConfig.height(context: context, pixels: 24),
      ),
      child: child,
    ),
  );
}
