import 'package:environment/util/applocalizations.dart';
import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/string_translate.dart';
import 'package:environment/util/download_file.dart';
import 'package:flutter/material.dart';

class ListTilePerformance extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final VoidCallback? onTab;
  final bool showImge;

  final TextStyle? subtileStyle;
  final TextStyle? subtileOtherStyle;

  final String? number;
  final String? date;
  final DownloadInfo? downloadInfo;
  final bool? textIsRitch;
  final bool? shapImageboarder;
  late AppLocalizations localizations;
  ListTilePerformance(
      {Key? key,
      required this.title,
      this.subtitle,
      this.onTab,
      required this.showImge,
      this.subtileStyle,
      this.number,
      this.downloadInfo,
      this.textIsRitch,
      required this.shapImageboarder,
      required this.subtileOtherStyle,
      this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    localizations = AppLocalizations.of(context)!;
    return subtitle != null
        ? Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(0.0)),
              color: Colors.white,
            ),
            child: ListTile(
              trailing: shapImageboarder == false
                  ? const SizedBox()
                  : Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ConstColors.primaryColor,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 0, right: 0, top: 10, bottom: 10),
                        child: Text(localizations.translate(withdrow),
                            style: Theme.of(context)
                                .textTheme
                                .overline!
                                .copyWith(
                                    color: ConstColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14)),
                      )),
              onTap: onTab,
              title: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "$title",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontWeight: subtitle != null
                              ? FontWeight.bold
                              : FontWeight.w300,
                          color: ConstColors.textPrimaryColor),
                    ),
                  ]),
              subtitle: textIsRitch == false
                  ? Text("$subtitle", style: subtileOtherStyle)
                  : Text.rich(
                      TextSpan(
                          style: subtileStyle,
                          text: "$number%",
                          children: [
                            TextSpan(text: " $date", style: subtileOtherStyle)
                          ]),
                    ),
            ))
        : Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(0.0)),
              color: Colors.white,
            ),
            child: ListTile(
                trailing: showImge == true
                    ? DownloadConfiguration(
                  isFileGenerated: false,
                        downloadInfo: downloadInfo!,
                        platform: platform,
                      )
                    : GestureDetector(
                        onTap: onTab,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ConstColors.textQuointaryColor,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 24, right: 24, top: 10, bottom: 10),
                            child: Text(localizations.translate(withdrow),
                                style: Theme.of(context)
                                    .textTheme
                                    .overline!
                                    .copyWith(
                                        color: ConstColors.primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                          ),
                        ),
                      ),
                //TODO Set Action Return

                title: Text(
                  "$title",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight:
                          subtitle != null ? FontWeight.bold : FontWeight.w700,
                      color: ConstColors.textPrimaryColor),
                )),
          );
  }
}
