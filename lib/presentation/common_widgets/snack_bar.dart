import 'package:environment/util/constants/colors.dart';
import 'package:flutter/material.dart';

enum StatusRequest { error, success }

void createSnackBar(String message, BuildContext context,
    {StatusRequest? statusRequest = StatusRequest.error}) {
  final snackBar = SnackBar(
    content: Text(message,
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: ConstColors.whiteColor)),
    backgroundColor: statusRequest == StatusRequest.error
        ? ConstColors.errorColor
        : ConstColors.successColor,
    duration: const Duration(seconds: 4),
  );

  // Find the Scaffold in the Widget tree and use it to show a SnackBar!
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
