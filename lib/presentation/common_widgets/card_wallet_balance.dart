import 'package:environment/util/applocalizations.dart';
import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/images.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:environment/util/constants/string_translate.dart';
import 'package:environment/util/numbers_formatter.dart';
import 'package:flutter/material.dart';

class CardWalletBalance extends StatelessWidget {
  late AppLocalizations localizations;
  final String? cardAmount;
  final String? currency;
  final String? ibanNo;

  final VoidCallback onTabWithdraw;

  final VoidCallback onTabAddMoney;

  CardWalletBalance(
      {Key? key,
      this.cardAmount,
      this.ibanNo,
      this.currency,
      required this.onTabWithdraw,
      required this.onTabAddMoney})
      : super(key: key);
//Image.asset(
//               inWallet,
//               width: 24,
//               height: 24,
//             )
//           : Image.asset(
//               outWallet,
//               width: 24,
//               height: 24,
//             )
  @override
  Widget build(BuildContext context) {
    localizations = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(13.0)),
        color: ConstColors.primaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localizations.translate(walletBalance),
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: ConstColors.textTertiaryColor),
          ),
          Container(
            padding: const EdgeInsets.only(top: 4, bottom: 20),
            child: Text.rich(TextSpan(
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: ConstColors.whiteColor),
                text: "$cardAmount ",
                children: [
                  TextSpan(
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: ConstColors.whiteColor,
                        fontWeight: FontWeight.w300),
                    text: formatNumber(
                      context,
                      value: double.tryParse(currency ?? '') ?? 0,
                    ),
                  )
                ])),
          ),

          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   color: Colors.black12,
          //   padding: EdgeInsets.symmetric(vertical: 14),
          //   margin: const EdgeInsets.only(bottom: 14),
          //   child: Text.rich(TextSpan(
          //       text: "${'IBAN no: '}",
          //       style: Theme.of(context).textTheme.overline!.copyWith(
          //           color: ConstColors.whiteColor
          //       ),
          //       children: [
          //         TextSpan(
          //           text: "${ibanNo}",
          //           style: Theme.of(context).textTheme.caption!.copyWith(
          //             color: ConstColors.whiteColor
          //           ),
          //         )
          //       ])),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => onTabAddMoney(),
                child: Container(
                  padding: EdgeInsets.only(
                      top: SizeConfig.height(context: context, pixels: 10),
                      left: SizeConfig.width(context: context, pixels: 20),
                      right: SizeConfig.width(context: context, pixels: 20),
                      bottom: SizeConfig.height(context: context, pixels: 10)),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ConstColors.whiteColor,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    color: ConstColors.whiteColor,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        inWalletCard,
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(
                        width: SizeConfig.width(context: context, pixels: 8),
                      ),
                      Text(
                        localizations.translate(addMoney),
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            color: ConstColors.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => cardAmount != "0.00" ? onTabWithdraw() : null,
                child: Container(
                  padding: EdgeInsets.only(
                      top: SizeConfig.height(context: context, pixels: 10),
                      left: SizeConfig.width(context: context, pixels: 20),
                      right: SizeConfig.width(context: context, pixels: 20),
                      bottom: SizeConfig.height(context: context, pixels: 10)),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: cardAmount != "0.00"
                          ? ConstColors.whiteColor
                          : ConstColors.whiteColor.withOpacity(.5),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    color: ConstColors.primaryColor,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        //  outWallet,
                        outWalletCard,
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(
                        width: SizeConfig.width(context: context, pixels: 8),
                      ),
                      Text(
                        localizations.translate(withdraw),
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            color: ConstColors.whiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
