// import 'dart:developer' as dev;

// import 'package:environment/bussniess_logic/home_navigation_cubit/home_navigation_cubit.dart';
// import 'package:environment/bussniess_logic/register_bloc/register_cubit.dart';
// import 'package:environment/bussniess_logic/text_filed_common/text_input_filed_common_cubit.dart';
// import 'package:environment/data/model/register/register_model_post.dart';
// import 'package:environment/data/model/verification/verification_model.dart';
// import 'package:environment/data/repositorys/reositories.dart';
// import 'package:environment/data/repositorys/requests.dart';
// import 'package:environment/data/shared_prefrences.dart';
// import 'package:environment/presentation/common_widgets/alert_dialog.dart';
// import 'package:environment/presentation/common_widgets/buttonstanderd.dart';
// import 'package:environment/presentation/common_widgets/show_message_to_user.dart';
// import 'package:environment/presentation/common_widgets/steps_register.dart';
// import 'package:environment/presentation/common_widgets/text_input_widgets/text_input_field.dart';
// import 'package:environment/presentation/screens/common_screen/no_internet/no_internet.dart';
// import 'package:environment/presentation/screens/home/tabs_enum.dart';
// import 'package:environment/util/applocalizations.dart';
// import 'package:environment/util/constants/colors.dart';
// import 'package:environment/util/constants/sizes.dart';
// import 'package:environment/util/constants/string_translate.dart';
// import 'package:environment/util/constants/strings.dart';
// import 'package:cross_connectivity/cross_connectivity.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class PasswordValidation extends StatefulWidget {
//   const PasswordValidation({Key? key}) : super(key: key);

//   @override
//   _PasswordValidationState createState() => _PasswordValidationState();
// }

// class _PasswordValidationState extends State<PasswordValidation> {
//   final _formKey = GlobalKey<FormState>();
//   bool _isPasswordEightCharacters = false;
//   bool _hasPasswordOneNumber = false;
//   bool _hasPasswordOneSymbol = false;
//   bool _hasPasswordOneLower = false;
//   bool _hasPasswordOneUpper = false;
//   var passwordController = TextEditingController();
//   var passwordConfirmController = TextEditingController();
//   late AppLocalizations localizations;
//   VerificationModel? verificationModel;
//   RegisterPost? registerModelPost;

//   onPasswordChanged(String password) {
//     final numericRegex = RegExp(r'[0-9]');
//     final lowerRegex = RegExp(r'[a-z]');
//     final capitalRegex = RegExp(r'[A-Z]');
//     final symbolRegex = RegExp(r'[/|\()_#?!@$%^&*-]');

//     setState(() {
//       _isPasswordEightCharacters = false;
//       if (password.length >= 8) _isPasswordEightCharacters = true;

//       _hasPasswordOneNumber = false;
//       if (numericRegex.hasMatch(password)) _hasPasswordOneNumber = true;
//       _hasPasswordOneLower = false;
//       if (lowerRegex.hasMatch(password)) _hasPasswordOneLower = true;
//       _hasPasswordOneUpper = false;
//       if (capitalRegex.hasMatch(password)) _hasPasswordOneUpper = true;
//       _hasPasswordOneSymbol = false;
//       if (symbolRegex.hasMatch(password)) _hasPasswordOneSymbol = true;
//     });
//   }

//   @override
//   void didChangeDependencies() {
//     localizations = AppLocalizations.of(context)!;
//     verificationModel =
//         ModalRoute.of(context)!.settings.arguments as VerificationModel;
//     dev.log("verificationModel ${verificationModel!.bodyRequest}");
//     registerModelPost = verificationModel!.bodyRequest;
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         showAlertDialog(context,
//             messageCancel: localizations.translate(cancel),
//             messageConfirm: "OK",
//             title: "Confirm Cancel",
//             message: "if confirm lost all data are you sure",
//             actionConfirm: () {
//           Navigator.pushNamedAndRemoveUntil(
//               context, registerFirst, (route) => false);
//         });
//         return true;
//       },
//       child: Scaffold(
//           backgroundColor: ConstColors.whiteColor,
//           appBar: PreferredSize(
//               preferredSize: const Size.fromHeight(100),
//               child: SafeArea(
//                   child: StepsRegister(
//                 stepType: StepRegister.password,
//               ))),
//           body: ConnectivityBuilder(builder: (BuildContext context,
//               bool? isConnected, ConnectivityStatus? status) {
//             if (isConnected == false) {
//               return const NoInternetConnection();
//             } else {
//               return GestureDetector(
//                 onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//                 child: BlocConsumer<RegisterCubit, RegisterState>(
//                   listener: (context, state) {
//                     if (state is RegisterSuccess) {
//                       saveUserData(state.successVerification);
//                       Navigator.pushNamedAndRemoveUntil(
//                           context, investingSuccess, (route) => false);
//                     } else if (state is RegisterErorr) {
//                       //11 if(state.errorRegister.data!=null){
//                       showMessage(context,
//                           message: state.errorRegister.message ?? "");
//                       // }
//                     }
//                   },
//                   builder: (context, state) {
//                     return SingleChildScrollView(
//                         child: Form(
//                       key: _formKey,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(
//                                 top: SizeConfig.height(
//                                     context: context, pixels: 48)),
//                             child: Text(localizations.translate(password),
//                                 style: Theme.of(context).textTheme.headline5),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             localizations.translate(setPassword),
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .caption!
//                                 .copyWith(color: ConstColors.textTertiaryColor),
//                           ),
//                           SizedBox(
//                             height:
//                                 SizeConfig.height(context: context, pixels: 64),
//                           ),
//                           BlocProvider(
//                             create: (BuildContext context) =>
//                                 UpdatedTextInputCubit(
//                                     Repositories(RequestsRepository())),
//                             child: TextInputField(
//                               typeForm: TypeForm.password,
//                               labelText: localizations.translate(password),
//                               controller: passwordController,
//                               onChange: onPasswordChanged,
//                             ),
//                           ),
//                           SizedBox(
//                             height:
//                                 SizeConfig.height(context: context, pixels: 32),
//                           ),
//                           BlocProvider(
//                               create: (BuildContext context) =>
//                                   UpdatedTextInputCubit(
//                                       Repositories(RequestsRepository())),
//                               child: TextInputField(
//                                 typeForm: TypeForm.password,
//                                 labelText:
//                                     localizations.translate(confirmNewPassword),
//                                 controller: passwordConfirmController,
//                               )),
//                           SizedBox(
//                             height:
//                                 SizeConfig.height(context: context, pixels: 8),
//                           ),
//                           buildItemValidation(
//                               _hasPasswordOneUpper, uppercaseLetter),
//                           buildItemValidation(
//                               _hasPasswordOneLower, lowercaseLetter),
//                           buildItemValidation(_hasPasswordOneNumber, number),
//                           buildItemValidation(_hasPasswordOneSymbol, symbol),
//                           buildItemValidation(
//                               _isPasswordEightCharacters, characterslong),
//                           SizedBox(
//                             height:
//                                 SizeConfig.height(context: context, pixels: 48),
//                           ),
//                           Align(
//                             alignment: Alignment.bottomCenter,
//                             child: Container(
//                               alignment: Alignment.bottomCenter,
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Container(
//                                     alignment: Alignment.centerLeft,
//                                     margin: Localizations.localeOf(context)
//                                                 .languageCode ==
//                                             "ar"
//                                         ? EdgeInsets.only(
//                                             right: SizeConfig.width(
//                                                 context: context, pixels: 24),
//                                           )
//                                         : EdgeInsets.only(
//                                             left: SizeConfig.width(
//                                                 context: context, pixels: 50),
//                                           ),
//                                     child: InkWell(
//                                       onTap: () {
//                                         BlocProvider.of<HomeNavigationCubit>(
//                                                 context)
//                                             .changeLandingTabByName(
//                                                 HomeTabs.home);
//                                         Navigator.pushNamedAndRemoveUntil(
//                                             context,
//                                             loginScreen,
//                                             (route) => false);
//                                       },
//                                       child: Text(
//                                         localizations.translate(cancel),
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .subtitle2!
//                                             .copyWith(
//                                                 color: ConstColors
//                                                     .textTertiaryColor),
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     alignment: Alignment.centerLeft,
//                                     margin: EdgeInsets.only(
//                                       right: SizeConfig.width(
//                                           context: context, pixels: 24),
//                                     ),
//                                     child: ButtonCommonWidget(
//                                       voidCallback: () {
//                                         if (_formKey.currentState!.validate()) {
//                                           if (passwordController.text ==
//                                               passwordConfirmController.text) {
//                                             BlocProvider.of<RegisterCubit>(
//                                                     context)
//                                                 .requestRegister(RegisterPost(
//                                                     step: 3,
//                                                     phone:
//                                                         "${registerModelPost!.phone}",
//                                                     phoneCountryCode:
//                                                         registerModelPost!
//                                                             .phoneCountryCode,
//                                                     email: registerModelPost!
//                                                         .email,
//                                                     passportNumber:
//                                                         registerModelPost!
//                                                             .passportNumber,
//                                                     password:
//                                                         passwordController.text,
//                                                     passwordConfirmation:
//                                                         passwordConfirmController
//                                                             .text,
//                                                     dob: registerModelPost!
//                                                         .dob));
//                                           } else {
//                                             showMessage(context,
//                                                 message:
//                                                     localizations.translate(
//                                                         passwordShouldBeMatch));
//                                           }
//                                         }
//                                       },
//                                       actionType: ActionsButton.cancel,
//                                       textData: localizations.translate(next),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ));
//                   },
//                 ),
//               );
//             }
//           })),
//     );
//   }

//   Widget buildItemValidation(bool checkValidation, String nameCheck) {
//     return Container(
//       margin: const EdgeInsets.only(top: 8),
//       child: Row(
//         children: [
//           AnimatedContainer(
//             duration: const Duration(milliseconds: 500),
//             width: 20,
//             height: 20,
//             child: Center(
//               child: Icon(
//                 checkValidation ? Icons.check : Icons.close,
//                 color: checkValidation
//                     ? ConstColors.successColor
//                     : ConstColors.errorColor,
//                 size: 15,
//               ),
//             ),
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//           Text(
//             localizations.translate(nameCheck),
//             style: Theme.of(context).textTheme.subtitle2!.copyWith(
//                   color: checkValidation
//                       ? ConstColors.successColor
//                       : ConstColors.errorColor,
//                 ),
//           )
//         ],
//       ),
//     );
//   }
// }
