
import 'package:environment/bussniess_logic/login_bloc/login_cubit.dart';
import 'package:environment/bussniess_logic/text_filed_common/text_input_filed_common_cubit.dart';
import 'package:environment/data/local_cache.dart';
import 'package:environment/data/model/error_modle.dart';
import 'package:environment/data/model/login/login_post.dart';
import 'package:environment/data/repositorys/reositories.dart';
import 'package:environment/data/repositorys/requests.dart';
import 'package:environment/data/shared_prefrences.dart';
import 'package:environment/presentation/common_widgets/buttonstanderd.dart';
import 'package:environment/presentation/common_widgets/dialog_loading.dart';
import 'package:environment/presentation/common_widgets/text_input_widgets/text_input_field.dart';
import 'package:environment/presentation/screens/common_screen/no_internet/no_internet.dart';
import 'package:environment/util/applocalizations.dart';
import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/images.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:environment/util/constants/string_translate.dart';
import 'package:environment/util/constants/strings.dart';
import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../common_widgets/snack_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  PhoneNumber number = PhoneNumber(isoCode: initialCountryCode);
  final TextEditingController emailController = TextEditingController();
  Repositories repositories = Repositories(RequestsRepository());
  var passwordController = TextEditingController();
  final _formLoginKey = GlobalKey<FormState>();
  String language = "";
  late AppLocalizations localizations;

  void initLanguage() async {
    language = await LocalCache().get(languageKey) ?? '';
  }

  @override
  void initState() {
    super.initState();

    initLanguage();
  }

  @override
  void didChangeDependencies() {
    localizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  String token = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.whiteColor,
      body: ConnectivityBuilder(
        builder: (BuildContext context, bool? isConnected,
            ConnectivityStatus? status) {
          if (isConnected == false) {
            return const NoInternetConnection();
          } else {
            return GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formLoginKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Image.asset(matron_imageLogo),
                        Container(
                          padding: EdgeInsets.only(
                              top: SizeConfig.height(
                            pixels: 48,
                            context: context,
                          )),
                          child: Text(
                            localizations.translate(login),
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: SizeConfig.height(
                              pixels: 8,
                              context: context,
                            ),
                          ),
                          child: Text(
                            localizations.translate(messageLogin),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: ConstColors.textTertiaryColor),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: SizeConfig.height(
                              pixels: 48,
                              context: context,
                            ),
                          ),

                         
                          child: BlocProvider(
                              create: (BuildContext context) =>
                                  UpdatedTextInputCubit(
                                      Repositories(RequestsRepository())),
                              child: TextInputField(
                                labelText: localizations.translate(email),
                                prefixIcon: null,
                                typeForm: TypeForm.email,
                                controller: emailController,
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.height(
                                  context: context, pixels: 20)),
                          child: BlocProvider(
                              create: (BuildContext context) =>
                                  UpdatedTextInputCubit(
                                      Repositories(RequestsRepository())),
                              child: TextInputField(
                                  controller: passwordController,
                                  labelText: localizations.translate(password),
                                  typeForm: TypeForm.password)),
                        ),
                    
                        Center(
                          child: Container(
                              margin: EdgeInsets.only(
                                  top: SizeConfig.height(
                                      context: context, pixels: 80)),
                              child: BlocConsumer<LoginCubit, LoginState>(
                                listener: (previous, current) {
                                  if (current is LoginSuccess) {
                                    Navigator.of(context).pop();
                                
                                      saveUserData(current.loginResponse);

                                      Navigator.pushNamedAndRemoveUntil(
                                          context, mappingScreenPoly, (route) => false);


                               
                                  } else if (current is LoginError) {
                                    Navigator.of(context).pop();
                                    Error_modle loginError =
                                        current.loginError;
                                    createSnackBar(
                                        loginError.message ??
                                            localizations
                                                .translate(pleaseTryAgain) 
                                        ,
                                        context);
                                  }
                                },
                                builder: (context, state) {
                                  return Column(
                                    children: [
                                      state is LoginError
                                          ? Text(
                                              "${state.loginError.message}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .copyWith(
                                                      color: ConstColors
                                                          .errorColor),
                                            )
                                          : const SizedBox(),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: SizeConfig.height(
                                                context: context, pixels: 16)),
                                        child: ButtonCommonWidget(
                                          voidCallback: () {

                                              showLoading(context);

                                              BlocProvider.of<LoginCubit>(
                                                      context)
                                                  .requestLogin(
                                                      LoginRequest(
                                                          email:
                                                             emailController.text,
                                                          password:
                                                              passwordController
                                                                  .text,
                                                        
                                                          // fcmToken:
                                                          //     PushNotification
                                                          //         .token,
                                                          // fcmType:
                                                          //     Platform.isAndroid
                                                          //         ? "android"
                                                          //         : "ios"
                                                                  
                                                                  ),
                                                      context);
                                            // }
                                          },
                                          textData: localizations
                                              .translate(loginHereLabel),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              )),
                        ),
                       
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
