import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/images.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FullScreenLoading extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;

  const FullScreenLoading(
      {this.title,
      this.subTitle,
      this.titleStyle,
      this.subTitleStyle,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [ConstColors.secondaryColor, ConstColors.thirdBlue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: SizeConfig.width(context: context, pixels: 125),
                height: SizeConfig.width(context: context, pixels: 125),
                child: Stack(
                  children: [
                    SizedBox(
                      width: SizeConfig.width(context: context, pixels: 125),
                      height: SizeConfig.width(context: context, pixels: 125),
                      child: const CircularProgressIndicator(
                        color: ConstColors.primaryColor,
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(logoSVG))
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.height(context: context, pixels: 28),
              ),
              Text(
                title ?? '',
                style: titleStyle ??
                    Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ConstColors.whiteColor),
              ),
              SizedBox(
                height: SizeConfig.height(context: context, pixels: 8),
              ),
              Text(
                subTitle ?? '',
                style: subTitleStyle ??
                    Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(color: ConstColors.textTertiaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
