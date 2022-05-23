import 'package:environment/util/applocalizations.dart';
import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:environment/util/constants/string_translate.dart';
import 'package:flutter/material.dart';

class AfterUploadFile extends StatelessWidget {
  final String? title;
  final String? header;
  final VoidCallback? onTab;

  const AfterUploadFile({
    Key? key,
    required this.title,
    required this.header,
    this.onTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: Text(
                  "$header",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: ConstColors.blackColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal),
                ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: SizeConfig.height(context: context, pixels: 42),
                  width: SizeConfig.width(context: context, pixels: 88),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(color: ConstColors.lightRed, width: 1.5),
                  ),
                  child: InkWell(
                      onTap: onTab,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            localizations.translate(delete),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: ConstColors.lightRed,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  width: SizeConfig.height(context: context, pixels: 12),
                ),
                InkWell(
                  child: Container(
                    height: SizeConfig.height(context: context, pixels: 56),
                    width: SizeConfig.width(context: context, pixels: 227),
                    padding: EdgeInsets.only(
                        left: SizeConfig.width(context: context, pixels: 8),
                        right: SizeConfig.width(context: context, pixels: 8)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(color: ConstColors.g4, width: 1.5),
                    ),
                    child: Center(
                        child: Text(
                      "$title",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: ConstColors.g4,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                    )),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
