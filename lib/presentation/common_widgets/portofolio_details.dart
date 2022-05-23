import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PortofolioDetails extends StatelessWidget {
  final String? header;
  final String? number;
  final String? date;
  final bool? isDivider;

  PortofolioDetails({
    Key? key,
    required this.header,
    required this.number,
    required this.date,
    required this.isDivider,
  }) : super(key: key);

  //TODO Use That When Need to set format Currency
  final formatCurrency = NumberFormat.simpleCurrency();

  @override
  Widget build(BuildContext context) {
    return cardPrefrence(context);
  }

  Widget cardPrefrence(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
              left: SizeConfig.width(context: context, pixels: 17),
              right: SizeConfig.width(context: context, pixels: 17)),
          child: Text(
            "$header",
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: ConstColors.fiveGreyBlue,
                  fontSize: 15,
                ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              top: SizeConfig.height(context: context, pixels: 4),
              left: SizeConfig.width(context: context, pixels: 17),
              right: SizeConfig.width(context: context, pixels: 17)),
          child: Text(
            "$number",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: ConstColors.blackColor),
          ),
        ),
        isDivider == true
            ? const Divider(
                thickness: 1,
                color: ConstColors.cardBorderColor,
              )
            : SizedBox(
                height: SizeConfig.height(context: context, pixels: 13),
              )
      ],
    );
  }
}
