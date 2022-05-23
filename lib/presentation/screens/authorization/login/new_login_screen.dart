import 'dart:async';

import 'package:environment/bussniess_logic/text_filed_common/text_input_filed_common_cubit.dart';
import 'package:environment/data/model/verification/verification_model.dart';
import 'package:environment/data/repositorys/reositories.dart';
import 'package:environment/data/repositorys/requests.dart';
import 'package:environment/presentation/common_widgets/buttonstanderd.dart';
import 'package:environment/presentation/common_widgets/text_input_widgets/text_input_field.dart';
import 'package:environment/presentation/common_widgets/validation_widget.dart';
import 'package:environment/presentation/screens/common_screen/no_internet/no_internet.dart';
import 'package:environment/util/applocalizations.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:environment/util/constants/string_translate.dart';
import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewLoginScreen extends StatefulWidget {
  const NewLoginScreen({Key? key}) : super(key: key);

  @override
  State<NewLoginScreen> createState() => _NewLoginScreenState();
}

class _NewLoginScreenState extends State<NewLoginScreen> {
  late AppLocalizations localizations;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();
  bool isPhoneNotValid = true;
  bool isCodeNotValid = true;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  Timer? _debounce;

  @override
  void dispose() {
    _phoneController.dispose();
    _pinCodeController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    localizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: ConnectivityBuilder(builder: (BuildContext context,
          bool? isConnected, ConnectivityStatus? status) {
        if (isConnected == false) {
          return const NoInternetConnection();
        } else {
          return SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.height(context: context, pixels: 48),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      top: SizeConfig.height(context: context, pixels: 12),
                      bottom: SizeConfig.height(context: context, pixels: 24),
                      left: SizeConfig.height(context: context, pixels: 24),
                      right: SizeConfig.height(context: context, pixels: 24),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _loginHeader(),
                        SizedBox(
                          height:
                              SizeConfig.height(context: context, pixels: 24),
                        ),
                        Form(
                          key: _form,

                          child: BlocProvider(
      create: (BuildContext context) =>
          UpdatedTextInputCubit(Repositories(RequestsRepository())),
      child: TextInputField(
                            onError: (hasError) {
                              if (isPhoneNotValid != hasError) {
                                setState(() => isPhoneNotValid = hasError);
                              }
                            },
                            onChange: (_) {
                              _validatePhone();
                            },
                            labelText: localizations.translate(phoneNumber),
                            controller: _phoneController,
                            typeForm: TypeForm.phone,
                          )),
                        ),
                        SizedBox(
                          height:
                              SizeConfig.height(context: context, pixels: 24),
                        ),
                        //TODO fix verification model
                        ValidationWidget(
                          maxWidth: null,
                          pinPutController: _pinCodeController,
                          verificationModel: VerificationModel(
                            toScreen: '/',
                          ),
                          time: null,
                          validationIsWrong: (isWrong) {
                            if (isCodeNotValid != isWrong) {
                              setState(() => isCodeNotValid = isWrong);
                            }
                          },
                        ),
                        _clickableText(
                          text: localizations.translate("forgetPincode"),
                          onTap: () {},
                        ),
                        SizedBox(
                            height: SizeConfig.height(
                                context: context, pixels: 47)),
                        ButtonCommonWidget(
                          voidCallback: () {},
                          isDisabled: isPhoneNotValid || isCodeNotValid,
                          textData: localizations.translate(continueText),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }

  Widget _loginHeader() {
    final theme = Theme.of(context);
    final themeData = theme.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              localizations.translate(login),
              style: themeData.headline5?.copyWith(fontSize: 30),
            ),
            _clickableText(
              text: localizations.translate("createNewAccount"),
              onTap: () {},
            ),
          ],
        ),
        SizedBox(height: SizeConfig.height(context: context, pixels: 4)),
        Text(
          localizations.translate(enterYourPhoneNumberAndPinCode),
          style: themeData.bodyText2?.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _clickableText({required String text, required VoidCallback onTap}) {
    final theme = Theme.of(context);
    final themeData = theme.textTheme;
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        foregroundColor: MaterialStateProperty.all(Colors.transparent),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        elevation: MaterialStateProperty.all(0),
      ),
      child: Text(
        text,
        style: themeData.bodyText1?.copyWith(
          color: theme.primaryColor,
        ),
      ),
    );
  }

  ///based on Rx logic (debounce operator) used for searhing by only trigger
  ///specific method after stream stops by a duration
  /// in our case the stream will be customer typing
  /// so form will be validated automatically when user stop typing by 500 milliSecond
  _validatePhone() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _form.currentState?.validate();
    });
  }
}
