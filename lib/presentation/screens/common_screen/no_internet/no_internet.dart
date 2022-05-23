import 'package:environment/util/applocalizations.dart';
import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/images.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:environment/util/constants/string_translate.dart';
import 'package:flutter/material.dart';

class NoInternetConnection extends StatefulWidget {
  const NoInternetConnection({Key? key}) : super(key: key);

  @override
  _NoInternetConnectionState createState() => _NoInternetConnectionState();
}

class _NoInternetConnectionState extends State<NoInternetConnection> {
  late AppLocalizations localizations;

  @override
  void didChangeDependencies() {
    localizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(
                      top: SizeConfig.height(context: context, pixels: 160),
                    ),
                    height: SizeConfig.height(context: context, pixels: 209),
                    width: SizeConfig.width(context: context, pixels: 245),
                    child: Image.asset(noInternet)),
                SizedBox(
                  height: SizeConfig.height(context: context, pixels: 40),
                ),
                Text(
                  localizations.translate(noConnection),
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: ConstColors.textSecondaryColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
