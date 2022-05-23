import 'package:environment/presentation/bottom_sheets/info_bottom_sheet.dart';
import 'package:environment/presentation/common_widgets/project_status.dart';
import 'package:environment/util/applocalizations.dart';
import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/images.dart';
import 'package:environment/util/constants/show_bottom_sheet.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:environment/util/constants/string_translate.dart';
import 'package:environment/util/constants/strings.dart';
import 'package:environment/util/numbers_formatter.dart';
import 'package:environment/util/utils.dart';
import 'package:flutter/material.dart';

class ProjectDetails extends StatelessWidget {
  final String? projectImage;
  final String? projectName;
  final String? projectTotalNumberOfShares;
  final String? projectRaisedAmountPercent;
  final String? projectCloseDate;
  final String? projectRaisedAmount;
  final String? projectCurrency;
  final String? projectFundingGoal;
  final String? projectStatus;
  final String? projectStatusTitle;
  final String? projectEarnings;
  final String? projectIrr;
  final String? fundRaiserName;
  final String? projectFundraiserLogo;

  const ProjectDetails({
    Key? key,
    this.projectImage,
    this.projectName,
    this.projectTotalNumberOfShares,
    this.projectRaisedAmountPercent,
    this.projectCloseDate,
    this.projectRaisedAmount,
    this.projectCurrency,
    this.projectFundingGoal,
    this.projectStatus,
    this.projectStatusTitle,
    this.projectEarnings,
    this.projectIrr,
    this.fundRaiserName,
    this.projectFundraiserLogo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _projectDetails(context, localizations),
        _investmentDetails(context, localizations),
        SizedBox(height: SizeConfig.height(context: context, pixels: 12)),
        _revenueDetail(context, localizations),
      ],
    );
  }

  Widget _projectDetails(BuildContext context, AppLocalizations localizations) {
    final double imgHeight = SizeConfig.height(context: context, pixels: 78);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.height(context: context, pixels: 17),
        horizontal: SizeConfig.width(context: context, pixels: 15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: FadeInImage(
              image: NetworkImage("$projectImage"),
              placeholder: const AssetImage(environmentIcon),
              placeholderErrorBuilder: (context, error, stackTrace) =>
                  Image.asset(environmentIcon),
              imageErrorBuilder: (context, error, stackTrace) =>
                  Image.asset(environmentIcon),
              width: imgHeight,
              height: imgHeight,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: SizeConfig.width(context: context, pixels: 14),
          ),
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 1),
              constraints: BoxConstraints(
                minHeight: imgHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "$projectName",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 21,
                          height: 1.2,
                        ),
                  ),
                  SizedBox(
                    height: SizeConfig.height(context: context, pixels: 6),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          fundRaiserName ?? '',
                          style: Theme.of(context).textTheme.overline!.copyWith(
                                color: ConstColors.fourthGreyColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.width(context: context, pixels: 21),
                        height: SizeConfig.height(context: context, pixels: 21),
                        child: FadeInImage(
                          image: NetworkImage("$projectFundraiserLogo"),
                          placeholder: const AssetImage(environmentIcon),
                          placeholderErrorBuilder:
                              (context, error, stackTrace) =>
                                  Image.asset(environmentIcon),
                          imageErrorBuilder: (context, error, stackTrace) =>
                              Image.asset(environmentIcon),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _investmentDetails(
      BuildContext context, AppLocalizations localizations) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.height(context: context, pixels: 16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProjectStatusWidget(
            status: projectStatus,
            title: projectStatusTitle,
          ),
          InkWell(
            onTap: () {
              showDefaultSheet(
                context,
                child: const InfoBottomSheet(infoType: InfoType.irr),
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [

                Text( "%",style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: Theme.of(context).primaryColor,
                ),),
                Text( "$projectIrr ",style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: Theme.of(context).primaryColor,
                ),),
                Text(
                    localizations.translate(expIRR),
                    style: Theme.of(context).textTheme.overline),
                const SizedBox(width: 5),
                Icon(
                  Icons.info_outlined,
                  size: SizeConfig.height(context: context, pixels: 20),
                  color: ConstColors.fiveGreyBlue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _revenueDetail(BuildContext context, AppLocalizations localizations) {
    int _numberOfUnits = int.tryParse(projectTotalNumberOfShares ?? '0') ?? 0;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.width(context: context, pixels: 18),
        vertical: SizeConfig.height(context: context, pixels: 15),
      ),
      color: _revenueColor(projectStatus).withOpacity(0.1),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(localizations.translate(totalInvestmentAmount),
                    style: Theme.of(context).textTheme.overline),
                SizedBox(
                  height: SizeConfig.height(context: context, pixels: 2),
                ),
                Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: formatNumber(
                        context,
                        value: double.tryParse("$projectEarnings") ?? 0,
                      ),
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: localizations.translate(currencyDefault),
                      style: Theme.of(context).textTheme.overline,
                    ),
                  ]),
                ),
              ],
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  localizations.translate(investedUnit),
                  style: Theme.of(context).textTheme.overline,
                ),
                SizedBox(
                    height: SizeConfig.height(context: context, pixels: 5)),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: formatNumber(context,
                            value: double.tryParse(
                                    "$projectTotalNumberOfShares") ??
                                0),
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(text: " "),
                      TextSpan(
                        text: Utils.formattedUnitText(context, '$_numberOfUnits'),
                      ),
                    ],
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _revenueColor(String? projectStatus) {
    switch (projectStatus) {
      case completedStatus:
        return ConstColors.projectStatusCompleted;
      case fundingStatus:
        return ConstColors.projectStatusFunding;
      case settledStatus:
        return ConstColors.projectStatusSattiled;
      case soonStatus:
        return ConstColors.projectStatusSoon;
      default:
        return ConstColors.primaryColor;
    }
  }
}
