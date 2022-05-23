import 'package:environment/util/applocalizations.dart';
import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:environment/util/constants/string_translate.dart';
import 'package:flutter/material.dart';

enum InfoType { irr, faq }

class InfoBottomSheet extends StatefulWidget {
  final InfoType infoType;

  const InfoBottomSheet({Key? key, required this.infoType}) : super(key: key);

  @override
  State<InfoBottomSheet> createState() => _InfoBottomSheetState();
}

class _InfoBottomSheetState extends State<InfoBottomSheet> {
  AppLocalizations? localizations;

  String _getTitle() {
    switch (widget.infoType) {
      case InfoType.irr:
        return localizations!.translate(irrInfoTitle);
      case InfoType.faq:
        return localizations!.translate(faqInfoTitle);
      default:
        return '';
    }
  }

  String _getSubTitle() {
    switch (widget.infoType) {
      case InfoType.irr:
        return localizations!.translate(irrInfoBody);
      case InfoType.faq:
        return localizations!.translate(irrInfoBody);
      default:
        return '';
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    localizations = AppLocalizations.of(context);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          _getTitle(),
          style: textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: SizeConfig.height(context: context, pixels: 16)),
        Text(_getSubTitle(), style: textTheme.subtitle2),
        SizedBox(height: SizeConfig.height(context: context, pixels: 32)),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(  width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(15),
            child: Text(
              localizations!.translate(close),
              style: textTheme.bodyText1
                  ?.copyWith(color: ConstColors.fiveGreyBlue),
            ),
          ),
        )
      ],
    );
  }
}
