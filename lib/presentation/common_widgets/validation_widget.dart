import 'dart:async';

import 'package:environment/data/model/verification/verification_model.dart';
import 'package:environment/presentation/common_widgets/show_message_to_user.dart';
import 'package:environment/util/applocalizations.dart';
import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/show_log.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:environment/util/constants/string_translate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ValidationWidget extends StatefulWidget {
  final TextEditingController pinPutController;
  final VerificationModel verificationModel;
  final Function(String)? onComplete;
  final Function(String)? onSubmit;
  final double? maxWidth;
  final bool autoFocus;
  final Function(bool) validationIsWrong;
  //TODO replace variable to more relatable one if needed
  final dynamic time;

  const ValidationWidget({
    Key? key,
    this.autoFocus = false,
    required this.pinPutController,
    required this.verificationModel,
    required this.time,
    this.onComplete,
    this.onSubmit,
    required this.validationIsWrong,
    this.maxWidth,
  }) : super(key: key);

  @override
  State<ValidationWidget> createState() => _ValidationWidgetState();
}

class _ValidationWidgetState extends State<ValidationWidget> {
  AppLocalizations? localizations;
  final FocusNode _pinPutFocusNode = FocusNode();
  Timer? _debounce;

  /// based on Rx logic (debounce operator) used for searhing by only trigger
  /// specific method after stream stops by a duration
  /// in our case the stream will be customer typing
  /// so form will be validated automatically when user stop typing by 500 milliSecond
  _validateForm(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      widget.validationIsWrong(value.length != 4);
    });
  }

  @override
  void didChangeDependencies() {
    localizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // null will take width as can take
      width: widget.maxWidth,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: PinCodeTextField(
          autoFocus: widget.autoFocus,
          appContext: context,
          keyboardType: TextInputType.phone,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          mainAxisAlignment: MainAxisAlignment.center,
          showCursor: false,
          autoDismissKeyboard: false,
          autoDisposeControllers: false,
          focusNode: _pinPutFocusNode,
          controller: widget.pinPutController,
          length: 4,
          obscureText: true,
          boxShadows: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
          blinkWhenObscuring: true,
          enableActiveFill: true,
          pinTheme: PinTheme(
            fieldOuterPadding: EdgeInsets.symmetric(
                horizontal: SizeConfig.width(context: context, pixels: 6)),
            shape: PinCodeFieldShape.box,
            borderWidth: .8,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: SizeConfig.width(context: context, pixels: 65),
            fieldWidth: SizeConfig.width(context: context, pixels: 65),
            selectedColor: Theme.of(context).primaryColor,
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: ConstColors.borderColor,
            activeFillColor: ConstColors.whiteColor,
            inactiveFillColor: ConstColors.whiteColor,
            selectedFillColor: ConstColors.whiteColor,
          ),
          onChanged: _validateForm,
          onCompleted: widget.onComplete,
          onSubmitted: (String pin) {
            if (widget.onSubmit != null) {
              widget.onSubmit!(pin);
              return;
            }

            //TODO refactor time logic
            if (widget.time != null) {
              if (widget.verificationModel.isCodeReturn ?? false) {
                dynamic bodyResponse = widget.verificationModel.bodyResponse;
                showLog("in return Message Code ", bodyResponse.data!.sMSCode);
                if (pin == bodyResponse.data!.sMSCode) {
                  widget.validationIsWrong(false);
                  Navigator.of(context).pushNamed(
                    widget.verificationModel.toScreen,
                    arguments: widget.verificationModel,
                  );
                } else {
                  showMessage(context,
                      message: localizations!.translate(otpIsWrong));
                  widget.validationIsWrong(true);
                }
              }
            } else {
              showMessage(context,
                  message: localizations!.translate(timeExpire));
            }
          },
        ),
      ),
    );
  }
}
