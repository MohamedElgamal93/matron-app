import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:flutter/material.dart';

class TabBarButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function()? onTap;
  const TabBarButton({
    required this.text,
    this.isSelected = false,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appbarChipWidth = MediaQuery.of(context).size.width -
        SizeConfig.width(context: context, pixels: 70);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: appbarChipWidth / 3,
        decoration: BoxDecoration(
            color:
                isSelected ? ConstColors.whiteColor : ConstColors.fourGreyBlue,
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Center(
            child: FittedBox(
          child: Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.width(context: context, pixels: 6),
                  right: SizeConfig.width(context: context, pixels: 6)),
              child: Text(
                text,
                style: isSelected
                    ? Theme.of(context).textTheme.caption?.copyWith(
                        color: ConstColors.blackColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 15)
                    : Theme.of(context).textTheme.caption?.copyWith(
                        color: ConstColors.fiveGreyBlue,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
              )),
        )),
      ),
    );
  }
}
