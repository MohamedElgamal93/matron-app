import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/images.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:environment/util/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/*
public const STATUS_DRAFT = 'draft';
public const STATUS_SUBMITTED = 'submitted';
public const STATUS_APPROVED = 'approved';
public const STATUS_DECLINED = 'declined';
public const STATUS_PUBLISHED = 'published';
public const STATUS_FUNDING = 'funding';
public const STATUS_CLOSED = 'closed';
public const STATUS_FAILED = 'failed';
public const STATUS_CANCELLED = 'cancelled';
public const STATUS_SETTLED = 'settled';
public const STATUS_REPAYMENT = 'repayment';
public const STATUS_FINISHED = 'finished';

*/

class ProjectStatusWidget extends StatelessWidget {
  final String? title;
  final String? status;

  const ProjectStatusWidget({
    Key? key,
    required this.status,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.height(context: context, pixels: 2),
        horizontal: SizeConfig.height(context: context, pixels: 13),
      ),
      decoration: BoxDecoration(
        color: _getColor(),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            _getImage(),
            height: SizeConfig.height(context: context, pixels: 18),
            width: SizeConfig.height(context: context, pixels: 18),
            fit: BoxFit.contain,
            color: ConstColors.whiteColor,
          ),
          SizedBox(
            width: SizeConfig.width(context: context, pixels: 4),
          ),
          Text(
            title ?? '',
            style: Theme.of(context).textTheme.overline?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: ConstColors.whiteColor,
                ),
          ),
        ],
      ),
    );
  }

  String _getImage() {
    switch (status) {
      case completedStatus:
        return finishedSvg;
      case fundingStatus:
        return fundingSVG;
      case settledStatus:
        return settledSVG;
      case soonStatus:
        return soonSVG;
      case inCompleteStatus:
        return inCompleteSVG;
      default:
        return logoSVG;
    }
  }

  Color _getColor() {
    switch (status) {
      case completedStatus:
        return ConstColors.projectStatusCompleted;
      case fundingStatus:
        return ConstColors.projectStatusFunding;
      case settledStatus:
        return ConstColors.projectStatusSattiled;
      case soonStatus:
        return ConstColors.projectStatusSoon;
      case inCompleteStatus:
        return ConstColors.projectStatusInComplete;
      default:
        return ConstColors.primaryColor;
    }
  }
}
