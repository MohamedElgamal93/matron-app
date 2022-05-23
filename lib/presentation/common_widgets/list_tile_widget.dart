import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/images.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final String? title;
  final bool? garbshRemove;
  final VoidCallback? onTab;
  final Color? focusColor;

  const ListTileWidget({
    Key? key,
    this.focusColor,
    required this.title,
    this.garbshRemove,
    this.onTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.width(context: context, pixels: 23),
          right: SizeConfig.width(context: context, pixels: 23),
          top: SizeConfig.height(context: context, pixels: 15),
        ),
        child: InkWell(
          onTap: onTab,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: ConstColors.n3,
                  blurRadius: 6.0,
                  offset: Offset(0.1, 2.0),
                  spreadRadius: .7,
                ),
              ],
              color: ConstColors.whiteColor,
              borderRadius: BorderRadius.circular(15),
            ),
            height: SizeConfig.height(context: context, pixels: 82),
            width: MediaQuery.of(context).size.width - 60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          color: garbshRemove == true
                              ? ConstColors.primaryColorEviron
                              : Colors.white,
                          border: Border.all(
                              color: ConstColors.primaryColorEviron, width: 1),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        height: SizeConfig.height(context: context, pixels: 79),
                        width: 27),
                    SizedBox(
                        width: SizeConfig.width(context: context, pixels: 8)),
                    Text.rich(
                      TextSpan(
                          style: Theme.of(context).textTheme.overline!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: ConstColors.primaryColorEviron),
                          text: "طلبية عمل ١",
                          children: [
                            TextSpan(
                                text: "\nالحي",
                                style: Theme.of(context)
                                    .textTheme
                                    .overline!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color:
                                            ConstColors.secondaryColorEviron)),
                            TextSpan(
                                text: "\nمن ١-٢-٢٠٢٢ الي ٢٠-٢-٢٠٢٢",
                                style: Theme.of(context)
                                    .textTheme
                                    .overline!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color:
                                            ConstColors.secondaryColorEviron))
                          ]),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(focus),
                        Text(
                          "$title",
                          style: textTheme.bodyText2?.copyWith(
                              fontSize: 12,
                              color: focusColor ?? textTheme.caption?.color),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: SizeConfig.width(context: context, pixels: 11),
                    ),
                    Image.asset(
                      garbshRemove == true ? garbage : trash,
                      height: garbshRemove == true
                          ? SizeConfig.height(context: context, pixels: 24)
                          : SizeConfig.height(context: context, pixels: 35),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
