import 'package:environment/bussniess_logic/home_navigation_cubit/home_navigation_cubit.dart';
import 'package:environment/presentation/common_widgets/buttonstanderd.dart';
import 'package:environment/presentation/screens/home/tabs_enum.dart';
import 'package:environment/util/applocalizations.dart';
import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/images.dart';
import 'package:environment/util/constants/show_log.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:environment/util/constants/string_translate.dart';
import 'package:environment/util/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// enum TypeForm { tokenExpire, changeNetwork }

void openTokenExpireScreen(BuildContext context) {
  showLog("openTokenExpireScreen", "token expire");

  /// widgetBinding instance is required as a solution for navigation while build
  /// as the user can change network then open a screen that throw UnAuth error
  /// so it will navigate while building
  /// which will throw exception
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      tokenExpireScreen,
      (route) => false,
    );
  });
}

class TokenExpireScreen extends StatefulWidget {
  // final TypeForm typeFormUnAuth;

  const TokenExpireScreen({
    // required this.typeFormUnAuth,
    Key? key,
  }) : super(key: key);

  @override
  _TokenExpireScreen createState() => _TokenExpireScreen();
}

class _TokenExpireScreen extends State<TokenExpireScreen> {
  AppLocalizations? localizations;
  bool isChangeNetwork = false;

  @override
  void didChangeDependencies() {
    // isChangeNetwork = widget.typeFormUnAuth == TypeForm.changeNetwork;
    localizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _imageUnAuthorized(context),
            SizedBox(height: SizeConfig.height(context: context, pixels: 47)),
            _buildChangeNetwork(context),
            SizedBox(height: SizeConfig.height(context: context, pixels: 16)),
            _buildLoginAgain(context),
            SizedBox(height: SizeConfig.height(context: context, pixels: 100)),
            _buildLoginButton(),
            SizedBox(
              height: SizeConfig.height(context: context, pixels: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        border: Border.all(color: Colors.white, width: 15),
        color: Colors.white,
      ),
      child: SizedBox(
        height: 56,
        width: MediaQuery.of(context).size.width,
        child: ButtonCommonWidget(
          voidCallback: () {
            // reset navigation to start from first home page tab
            BlocProvider.of<HomeNavigationCubit>(context)
                .changeLandingTabByName(HomeTabs.home);
            Navigator.of(context).pushNamedAndRemoveUntil(
              loginScreen,
              (route) => false,
            );
          },
          textData: localizations!.translate(login),
        ),
      ),
    );
  }

  Widget _imageUnAuthorized(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: SizeConfig.height(context: context, pixels: 120),
      ),
      height: SizeConfig.height(context: context, pixels: 140),
      width: SizeConfig.width(context: context, pixels: 117),
      child: Image.asset(timer),
    );
  }

  Widget _buildChangeNetwork(BuildContext context) {
    return Text(
      localizations!.translate(tokenExpire),
      style: Theme.of(context)
          .textTheme
          .subtitle1!
          .copyWith(color: ConstColors.textSecondaryColor),
    );
  }

  Widget _buildLoginAgain(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Text(
        localizations!.translate(pleaseReLogin),
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(color: ConstColors.textSecondaryColor),
      ),
    );
  }
}
