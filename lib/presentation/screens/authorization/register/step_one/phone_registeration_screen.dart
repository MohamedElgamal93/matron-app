import 'dart:async';
import 'package:environment/bussniess_logic/register_bloc/register_cubit.dart';
import 'package:environment/bussniess_logic/text_filed_common/text_input_filed_common_cubit.dart';
import 'package:environment/data/repositorys/reositories.dart';
import 'package:environment/data/repositorys/requests.dart';
import 'package:environment/presentation/common_widgets/buttonstanderd.dart';
import 'package:environment/presentation/common_widgets/show_message_to_user.dart';
import 'package:environment/presentation/common_widgets/text_input_widgets/text_input_field.dart';
import 'package:environment/util/applocalizations.dart';
import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:environment/util/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../util/constants/images.dart';

class PhoneRegistrationScreen extends StatefulWidget {
  const PhoneRegistrationScreen({Key? key}) : super(key: key);

  @override
  _PhoneRegistrationState createState() => _PhoneRegistrationState();
}

class _PhoneRegistrationState extends State<PhoneRegistrationScreen> {

final phoneController = TextEditingController();
final passwordController = TextEditingController();



  final _formKey = GlobalKey<FormState>();
  late final AppLocalizations localizations;
  bool isPhonePasswordNotValid = true;

  void setPhonePasswordNotValid(bool val) {
    if (phoneController.text.length == 11 &&
        passwordController.text.length > 3) {
      if (isPhonePasswordNotValid != val) {
        setState(() {
          isPhonePasswordNotValid = val;
        });
      }
    } 
  }

  Timer? _debounce;

  /// based on Rx logic (debounce operator) used for searhing by only trigger
  /// specific method after stream stops by a duration
  /// in our case the stream will be customer typing
  /// so form will be validated automatically when user stop typing by 500 milliSecond
  _validateFormPhonePassword() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      setPhonePasswordNotValid(phoneController.text.length != 11);
      setPhonePasswordNotValid(passwordController.text.length < 3);
    });
  }

  @override
  void didChangeDependencies() {
    localizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: SizeConfig.width(context: context, pixels: 24),
                      //top: SizeConfig.height(context: context, pixels: 10),
                      right: SizeConfig.width(context: context, pixels: 24),
                      bottom: SizeConfig.height(context: context, pixels: 16),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                // Image.asset(matronLogo),
                                // SizedBox(height:  SizeConfig.height(context: context, pixels: 10)),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                            style: Theme.of(context)
                                                .textTheme
                                                .overline!
                                                .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 48,
                                                    color: ConstColors
                                                        .primaryColorEviron),
                                            text: "تسجيل",
                                            children: [
                                              TextSpan(
                                                  text: "\nالدخول",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .overline!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 48,
                                                          color: ConstColors.secondaryColorEviron))
                                            ]),
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      Image.asset(
                                       matronLogo,
                                        height:  SizeConfig.height(context: context, pixels: 245)
                                        
                                         ,
                                        width: SizeConfig.width(context: context, pixels: 175) ,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeConfig.height(
                                        context: context, pixels: 32),
                                  ),
                                  BlocProvider(
                                      create: (BuildContext context) =>
                                          UpdatedTextInputCubit(Repositories(
                                              RequestsRepository())),
                                      child: TextInputField(
                                        onChange: (_) =>
                                            _validateFormPhonePassword(),
                                        typeForm: TypeForm.phoneWithOutCode,
                                        labelText: "الهاتف",
                                          controller: phoneController,
                                       
                                              
                                      )),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  BlocProvider(
                                      create: (BuildContext context) =>
                                          UpdatedTextInputCubit(Repositories(
                                              RequestsRepository())),
                                      child: TextInputField(
                                        onChange: (_) =>
                                            _validateFormPhonePassword(),
                                        typeForm: TypeForm.password,
                                        labelText:
                                            "كلمة المرور",
                                        controller: passwordController,
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height:
                              SizeConfig.height(context: context, pixels: 24),
                        ),
                      Center(
                              child: ButtonCommonWidget(
                                buttonSize: ButtonSize.fullWidth,
                                isDisabled: false,
                                voidCallback: () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                  //  mappingScreenPoly,
                                    mappingScreenPoly,
                                    (route) => false,
                                  );
                                  // showLoading(context);
                                  // BlocProvider.of<RegisterCubit>(context)
                                  //     .requestRegister(
                                  //   RegisterPost(
                                  //     step: 1,
                                  //     phone:
                                  //         "$codeCountryNumber${phoneController.text.substring(1)}",
                                  //     phoneCountryCode: phoneCountryCode,
                                  //   ),
                                  // );
                                },
                                textData: "تسجيل الدخول",
                              ),
                            )
                      ],
                    ),
                  ),
                ),
              )
         
          
       
      ),
    );
  }
}
