import 'package:another_flushbar/flushbar.dart';
import 'package:environment/util/constants/colors.dart';
import 'package:flutter/material.dart';

enum MessageType { error, success }

Future<dynamic> showMessage(
  BuildContext context, {
  MessageType messageType = MessageType.error,
  String? title,
  required String message,
}) {
  final Color backgroundColor = messageType == MessageType.error
      ? ConstColors.errorColor
      : ConstColors.successColor;
  return Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    title: title,
    isDismissible: true,
    endOffset: const Offset(0, -.15),
    duration: const Duration(seconds: 6),
    messageText: Text(
      message,
      style: Theme.of(context).textTheme.caption?.copyWith(
            fontWeight: FontWeight.bold,
            color: ConstColors.whiteColor,
          ),
    ),
    padding: const EdgeInsets.only(
        top: kToolbarHeight * 1.25, bottom: 16, left: 16, right: 16),
    // margin: const EdgeInsets.all(12),
    // borderRadius: BorderRadius.circular(8),
    backgroundColor: backgroundColor,
    // boxShadows: [
    //   BoxShadow(
    //     color: backgroundColor,
    //     offset: const Offset(0.0, 2.0),
    //     blurRadius: 1.0,
    //   )
    // ],
  ).show(context);
}
