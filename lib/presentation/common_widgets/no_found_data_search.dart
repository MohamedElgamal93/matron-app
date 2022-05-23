import 'package:environment/util/applocalizations.dart';
import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/images.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:environment/util/constants/string_translate.dart';
import 'package:environment/util/constants/strings.dart';

import 'package:flutter/material.dart';

class NoFoundDataToSearch extends StatelessWidget {
  NoFoundDataToSearch({Key? key}) : super(key: key);
  late AppLocalizations localizations;
  @override
  Widget build(BuildContext context) {
    localizations = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          noFoundData,
          width: SizeConfig.width(context: context, pixels: 148),
          height: SizeConfig.height(context: context, pixels: 148),
        ),
        SizedBox(
          height: SizeConfig.height(context: context, pixels: 43),
        ),
        Text(
          localizations.translate(noResultsToShow),
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
              color: ConstColors.textSecondaryColor,
              fontSize: 20,
              fontWeight: FontWeight.normal),
        ),
        SizedBox(
          height: SizeConfig.height(context: context, pixels: 12),
        ),
        Text(
          localizations.translate(pleaseCheckSpelling),
          style: Theme.of(context).textTheme.caption!.copyWith(
              color: ConstColors.textTertiaryColor,
              fontSize: 14,
              fontWeight: FontWeight.normal,
              ),
        ),
        SizedBox(
          height: SizeConfig.height(context: context, pixels: 70),
        ),
      ],
    );
  }
}
