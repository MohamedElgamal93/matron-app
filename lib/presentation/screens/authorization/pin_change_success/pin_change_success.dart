import 'package:environment/bussniess_logic/home_navigation_cubit/home_navigation_cubit.dart';
import 'package:environment/presentation/common_widgets/buttonstanderd.dart';
import 'package:environment/presentation/screens/common_screen/no_internet/no_internet.dart';
import 'package:environment/presentation/screens/home/tabs_enum.dart';
import 'package:environment/util/applocalizations.dart';
import 'package:environment/util/constants/images.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:environment/util/constants/string_translate.dart';
import 'package:environment/util/constants/strings.dart';
import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PinSuccessWidget extends StatelessWidget {
  const PinSuccessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        body: ConnectivityBuilder(builder: (BuildContext context,
            bool? isConnected, ConnectivityStatus? status) {
          if (isConnected == false) {
            return const NoInternetConnection();
          } else {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.width(context: context, pixels: 24),
                vertical: SizeConfig.width(context: context, pixels: 16),
              ),
              child: Column(
                children: [
                  const Spacer(),
                  SvgPicture.asset(
                    checkCircleSVG,
                    height: SizeConfig.height(context: context, pixels: 81),
                    width: SizeConfig.height(context: context, pixels: 81),
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: SizeConfig.height(context: context, pixels: 14),
                  ),
                  Text(
                    localizations.translate(yourPinCodeChangedSuccessfully),
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  ButtonCommonWidget(
                    buttonSize: ButtonSize.fullWidth,
                    voidCallback: () {
                      BlocProvider.of<HomeNavigationCubit>(context)
                          .changeLandingTabByName(HomeTabs.home);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          loginScreen, (route) => false);
                    },
                    textData: localizations.translate(confirm),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
