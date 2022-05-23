

import 'package:environment/presentation/screens/common_screen/no_internet/no_internet.dart';
import 'package:environment/util/applocalizations.dart';
import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  AppLocalizations? localizations;

  dynamic firstUserName = "";
  dynamic lastUserName = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    localizations = AppLocalizations.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: ConstColors.secondaryColor));
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: ConstColors.secondaryColor),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ConnectivityBuilder(
          builder: (BuildContext context, bool? isConnected,
              ConnectivityStatus? status) {
            if (isConnected == false) {
              return const NoInternetConnection();
            } else {
              return SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: SizeConfig.width(context: context, pixels: 24),
                    top: SizeConfig.height(context: context, pixels: 48),
                    right: SizeConfig.width(context: context, pixels: 24),
                    bottom: SizeConfig.height(context: context, pixels: 16),
                  ),
                  child: Column(
                    children: [
                        Text.rich(
                                    TextSpan(
                                        style: Theme.of(context)
                                            .textTheme
                                            .overline!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 50,
                                                color:
                                                    ConstColors.primaryColor),
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
                                                      fontSize: 50,
                                                      color: Colors.grey))
                                        ]),
                                  ),
                      SizedBox(
                        height: SizeConfig.height(context: context, pixels: 24),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
