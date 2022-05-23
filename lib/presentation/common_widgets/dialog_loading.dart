import 'package:environment/util/applocalizations.dart';
import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:environment/util/constants/string_translate.dart';
import 'package:flutter/material.dart';

void showLoading(BuildContext context) {
  final AppLocalizations localizations = AppLocalizations.of(context)!;
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        contentPadding: const EdgeInsets.only(top: 10.0),
        content: Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff0A002C3E), width: 1.0),
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Color(0xff0A002C3E),
                blurRadius: 24.0,
                offset: Offset(0.0, 2.0),
                spreadRadius: 5,
              ),
            ],
          ),
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(
                color: ConstColors.primaryColor,
              ),
              SizedBox(
                height: SizeConfig.height(context: context, pixels: 32),
              ),
              Text(localizations.translate(loading)),
            ],
          ),
        ),
      );
    },
  );
}
