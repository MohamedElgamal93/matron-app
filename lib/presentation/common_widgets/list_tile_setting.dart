import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/images.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListTileSetting extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final VoidCallback? onTab;
  final bool showImge;

  const ListTileSetting(
      {Key? key,
      required this.title,
      this.subtitle,
      this.onTab,
      required this.showImge})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return subtitle != null
        ? Container(
            decoration: BoxDecoration(
              borderRadius: showImge == true
                  ? const BorderRadius.all(Radius.circular(8.0))
                  : const BorderRadius.all(Radius.circular(0.0)),
              color: showImge == true
                  ? ConstColors.listTileColor.withOpacity(0.3)
                  : Colors.white,
            ),
            child: ListTile(
                trailing: Localizations.localeOf(context).languageCode == "ar"
                    ? Container(
                        margin: EdgeInsets.only(
                            left:
                                SizeConfig.width(context: context, pixels: 8)),
                        child: SvgPicture.asset(arrowAr))
                    : Container(
                        child: SvgPicture.asset(arrowSvg),
                        margin: EdgeInsets.only(
                            right:
                                SizeConfig.width(context: context, pixels: 8)),
                      ),
                onTap: onTab,
                title: Container(
                  margin: EdgeInsets.only(
                    left: SizeConfig.width(context: context, pixels: 8),
                    right: SizeConfig.width(context: context, pixels: 8),
                  ),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Visibility(
                            visible: showImge,
                            child: Image.asset(professionalImage)),
                        showImge
                            ? const SizedBox(
                                width: 13.3,
                              )
                            : const SizedBox(),
                        Text(
                          "$title",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                fontWeight: subtitle != null
                                    ? FontWeight.bold
                                    : FontWeight.w300,
                              ),
                        ),
                      ]),
                ),
                subtitle: Text(
                  "$subtitle",
                  style: Theme.of(context)
                      .textTheme
                      .overline!
                      .copyWith(color: ConstColors.textTertiaryColor),
                )))
        : Container(
            decoration: BoxDecoration(
              borderRadius: showImge == true
                  ? const BorderRadius.all(Radius.circular(8.0))
                  : const BorderRadius.all(Radius.circular(0.0)),
              color: showImge == true
                  ? ConstColors.listTileColor.withOpacity(0.3)
                  : Colors.white,
            ),
            child: ListTile(
                trailing: Localizations.localeOf(context).languageCode == "ar"
                    ? Container(
                        margin: EdgeInsets.only(
                            left:
                                SizeConfig.width(context: context, pixels: 8)),
                        child: SvgPicture.asset(arrowAr))
                    : Container(
                        child: SvgPicture.asset(arrowSvg),
                        margin: EdgeInsets.only(
                            right:
                                SizeConfig.width(context: context, pixels: 8)),
                      ),
                onTap: onTab,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Visibility(
                        visible: showImge,
                        child: Image.asset(professionalImage)),
                    showImge
                        ? const SizedBox(
                            width: 13.3,
                          )
                        : const SizedBox(
                            width: 12,
                          ),
                    Text(
                      "$title",
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          fontWeight: subtitle != null
                              ? FontWeight.bold
                              : FontWeight.w700,
                          fontStyle: FontStyle.normal),
                    ),
                  ],
                )),
          );
  }
}
