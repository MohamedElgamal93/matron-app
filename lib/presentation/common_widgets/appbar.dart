import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:environment/util/text_direction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

PreferredSize appBarCommon(
  BuildContext context, {

  /// select if you want to show notifications counter with no parameters needed
  bool isNotification = false,

  /// if set to true the the default Icons.arrow_back_ios will
  /// be replaced with Icons.close
  isCrossIcon = false,

  /// optional appbar title
  String? title,

  /// show or hide back button
  haveBack = false,

  /// optional title position if not provided will AppBarTheme.centerTitle
  /// of ThemeData.appBarTheme is used. If that is also null, then value is
  /// adapted to the current TargetPlatform. {@endtemplate} <- from SDK Docs
  bool? centerTitle,

  /// optional elevation defaults to 0
  double elevation = 0,

  /// appbar color defaults to Colors.transparent
  Color? backgroundColor = Colors.transparent,

  /// statusBar color defaults to Colors.transparent
  Color? systemOverlayColor = Colors.black45,

  /// optional destination to return to from back button
  /// if not provided will default to the previous in the stack
  String? backTo,
  Color? backIConColor,

  /// optional widget to replace back button
  Widget? leadingWidget,

  /// optional action for the back button, if not provided
  /// will default to `Navigator.of(context).pop()`
  Function? onBack,

  /// optional widget to show at the end of appbar
  Widget? trailing,

  /// optional size for title when not provided default will be \
  /// bodyText1 with textSecondaryColor for color
  TextStyle? titleTextStyle,
}) {
  return PreferredSize(
    /// uses Flutter default appbar height
    preferredSize: const Size.fromHeight(kToolbarHeight),
    child: AppBar(
      /// hide default back button -> if true a default back button will be added
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      elevation: elevation,
      centerTitle: centerTitle,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: systemOverlayColor,
      ),
      title: title == null
          ? null
          : Text(
              title,
              style: titleTextStyle ?? Theme.of(context).textTheme.bodyText1!,
            ),
      leading: leadingWidget ??
          _buildDefaultLeading(
            context: context,
            haveBack: haveBack,
            onBack: onBack,
            backTo: backTo,
            backIConColor: backIConColor,
            isCrossIcon: isCrossIcon,
          ),
      actions: <Widget>[
        if (trailing != null) _buildTrailingWidget(context, trailing),
      ],
    ),
  );
}

//    systemOverlayStyle:
//           SystemUiOverlayStyle(statusBarColor: ConstColors.secondaryColor)
/// builds the widget that will be added at the end of the appbar
Widget _buildTrailingWidget(BuildContext context, Widget child) {
  return Padding(
    padding: EdgeInsets.only(
      right: SizeConfig.width(context: context, pixels: context.isRtl ? 0 : 16),
      left: SizeConfig.width(context: context, pixels: !context.isRtl ? 0 : 16),
    ),
    child: SizedBox(
        width: SizeConfig.width(context: context, pixels: 20),
        height: SizeConfig.width(context: context, pixels: 20),
        child: child),
  );
}

/// builds leading widgets to replace back button
Widget _buildDefaultLeading({
  required BuildContext context,
  required bool haveBack,
  required Function? onBack,
  required String? backTo,
  required Color? backIConColor,
  required bool isCrossIcon,
}) {
  return haveBack
      ? InkWell(
          customBorder: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(60)),
          ),
          onTap: () {
            if (onBack != null) {
              onBack();
            } else if (backTo != null) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                backTo,
                (route) => false,
              );
            } else {
              Navigator.of(context).pop();
            }
            ScaffoldMessenger.of(context).clearSnackBars();
          },
          child: Center(
            child: Icon(
              isCrossIcon == true ? Icons.close : Icons.arrow_back_ios_rounded,
              color: backIConColor ?? ConstColors.thirdBlue,
              size: 20,
            ),
          ),
        )
      : const SizedBox();
}
