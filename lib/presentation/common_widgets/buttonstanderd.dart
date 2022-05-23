import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/images.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:environment/util/constants/strings.dart';
import 'package:flutter/material.dart';

enum ActionsButton {
  cancel,
  event,
  logOut,
  long,
  applePay,
  dismiss,
  visitor,
  send,
  invest,
  dismissInvest,
  dismissProfessinalInvetor,
}
enum ButtonSize { fullWidth, dynamic, autoFit }

class ButtonCommonWidget extends StatefulWidget {
  const ButtonCommonWidget(
      {Key? key,
      required this.voidCallback,
      required this.textData,
      this.buttonSize = ButtonSize.dynamic,
      this.isDisabled = false,
      this.actionType = ActionsButton.event,
      this.buttonTextStyle})
      : super(key: key);

  final VoidCallback voidCallback;
  final String textData;
  final ActionsButton actionType;
  final bool isDisabled;
  final ButtonSize buttonSize;
  final TextStyle? buttonTextStyle;

  @override
  _ButtonCommonWidgetState createState() => _ButtonCommonWidgetState();
}

class _ButtonCommonWidgetState extends State<ButtonCommonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: widget.buttonSize == ButtonSize.autoFit
            ? const EdgeInsets.symmetric(vertical: 5, horizontal: 16)
            : const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        minimumSize: minimumSize(context),
        textStyle: widget.buttonTextStyle ?? const TextStyle(fontSize: 14),
        shadowColor: widget.isDisabled ? Colors.transparent : null,
        primary: widget.isDisabled
            ? ConstColors.buttonDisabledColor
            : widget.actionType == ActionsButton.logOut
                ? ConstColors.lightRed
                : widget.actionType == ActionsButton.dismiss
                    ? ConstColors.textLinkColor.withOpacity(.40)
                    : widget.actionType == ActionsButton.dismissInvest
                        ? ConstColors.textLinkColor.withOpacity(.40)
                        : widget.actionType ==
                                ActionsButton.dismissProfessinalInvetor
                            ? ConstColors.n3
                            : widget.actionType == ActionsButton.applePay
                                ? ConstColors.blackColor
                                : widget.actionType == ActionsButton.visitor
                                    ? ConstColors.cardBorderColor
                                    : ConstColors.textLinkColor,
        onPrimary: widget.isDisabled
            ? ConstColors.buttonDisabledColor
            : widget.actionType == ActionsButton.logOut
                ? ConstColors.lightRed
                : widget.actionType == ActionsButton.dismiss
                    ? ConstColors.textLinkColor.withOpacity(.40)
                    : widget.actionType == ActionsButton.dismissInvest
                        ? ConstColors.textLinkColor.withOpacity(.40)
                        : widget.actionType ==
                                ActionsButton.dismissProfessinalInvetor
                            ? ConstColors.n3
                            : widget.actionType == ActionsButton.applePay
                                ? ConstColors.blackColor
                                : widget.actionType == ActionsButton.visitor
                                    ? ConstColors.blackColor
                                    : ConstColors.whiteColor,
        onSurface: widget.isDisabled
            ? ConstColors.buttonDisabledColor
            : widget.actionType == ActionsButton.cancel
                ? Colors.grey
                : widget.actionType == ActionsButton.send
                    ? Colors.grey
                    : widget.actionType == ActionsButton.logOut
                        ? ConstColors.lightRed
                        : widget.actionType == ActionsButton.applePay
                            ? ConstColors.blackColor
                            : widget.actionType == ActionsButton.visitor
                                ? ConstColors.blackColor
                                : ConstColors.textLinkColor,
        side: const BorderSide(
            color: ConstColors.textLinkColor, style: BorderStyle.none),
        shape: widget.actionType == ActionsButton.logOut
            ? const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)))
            : widget.actionType == ActionsButton.applePay
                ? const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32)))
                : widget.actionType == ActionsButton.send
                    ? const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)))
                    : const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32))),
      ),
      onPressed: widget.isDisabled ? () {} : widget.voidCallback,
      child: widget.actionType == ActionsButton.applePay
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.actionType == ActionsButton.applePay
                    ? Image.asset(
                        applePayImageSec,
                        width: 50,
                        color: Colors.white,
                      )
                    : const SizedBox(width: 0, height: 0)
              ],
            )
          : Text(
              widget.textData,
              style: widget.buttonTextStyle ??
                  (widget.actionType == ActionsButton.logOut
                      ? Theme.of(context).textTheme.overline!.copyWith(
                          color: widget.isDisabled
                              ? ConstColors.textSecondaryColor
                              : ConstColors.whiteColor,
                          fontWeight: FontWeight.bold)
                      : widget.actionType == ActionsButton.visitor
                          ? Theme.of(context).textTheme.caption!.copyWith(
                              color: widget.isDisabled
                                  ? ConstColors.textSecondaryColor
                                  : ConstColors.primaryColor,
                              fontSize: 14,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700)
                          : widget.actionType == ActionsButton.invest
                              ? Theme.of(context).textTheme.caption!.copyWith(
                                  color: widget.isDisabled
                                      ? ConstColors.textSecondaryColor
                                      : ConstColors.whiteColor,
                                  fontSize: 17,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700)
                              : Theme.of(context).textTheme.button?.copyWith(
                                    color: widget.isDisabled
                                        ? ConstColors.textSecondaryColor
                                        : Theme.of(context)
                                            .textTheme
                                            .button
                                            ?.color!,
                                  )),
            ),
    );
  }

  Size? minimumSize(var context) {
    if (widget.buttonSize == ButtonSize.fullWidth) {
      return Size(
          MediaQuery.maybeOf(context)?.size.width ??
              SizeConfig.width(context: context, pixels: 328),
          SizeConfig.height(context: context, pixels: 64));
    } else if (widget.buttonSize == ButtonSize.autoFit) {
      return const Size(0, 0);
    } else if (widget.actionType == ActionsButton.cancel) {
      return const Size(132, 64);
    } else if (widget.actionType == ActionsButton.send) {
      return const Size(62, 33);
    } else if (widget.actionType == ActionsButton.event) {
      return Size(234, SizeConfig.height(context: context, pixels: 64));
    } else if (widget.actionType == ActionsButton.long) {
      return Size(MediaQuery.of(context).size.width * .9, 64);
    } else if (widget.actionType == ActionsButton.dismiss) {
      return Size(MediaQuery.of(context).size.width * .9, 64);
    } else if (widget.actionType == ActionsButton.applePay) {
      return Size(SizeConfig.width(context: context, pixels: 343),
          SizeConfig.height(context: context, pixels: 64));
    } else if (widget.actionType == ActionsButton.invest) {
      return Size(SizeConfig.width(context: context, pixels: 343),
          SizeConfig.height(context: context, pixels: 64));
    } else if (widget.actionType == ActionsButton.dismissInvest) {
      return Size(SizeConfig.width(context: context, pixels: 343),
          SizeConfig.height(context: context, pixels: 64));
    } else if (widget.actionType == ActionsButton.dismissProfessinalInvetor) {
      return Size(
          MediaQuery.maybeOf(context)?.size.width ??
              SizeConfig.width(context: context, pixels: 328),
          SizeConfig.height(context: context, pixels: 64));
    } else if (widget.actionType == ActionsButton.dismissInvest) {
      return Size(SizeConfig.width(context: context, pixels: 343),
          SizeConfig.height(context: context, pixels: 64));
    } else {
      return const Size(234, 64);
    }
  }
}
