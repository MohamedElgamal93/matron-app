import 'package:environment/presentation/common_widgets/buttonstanderd.dart';
import 'package:environment/util/applocalizations.dart';
import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/images.dart';
import 'package:environment/util/constants/string_translate.dart';
import 'package:flutter/material.dart';

class EmptyConnectivityPage extends StatefulWidget {
  const EmptyConnectivityPage({Key? key}) : super(key: key);

  @override
  _EmptyConnectivityPage createState() => _EmptyConnectivityPage();
}

class _EmptyConnectivityPage extends State<EmptyConnectivityPage> {
  late AppLocalizations localizations;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    localizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ConstColors.whiteColor,
      body: _emptyConnectivityUI(context, screenHeight, screenWidth),
    );
  }

  Widget _emptyConnectivityUI(
      BuildContext context, double screenHeight, double screenWidth) {
    return SingleChildScrollView(
        child: Stack(
      children: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.all(0.0), child: Divider()),
              _buildAllDataContainer(screenHeight),
            ],
          ),
        ),
      ],
    ));
  }

  Widget _buildAllDataContainer(double screenHeight) {
    return Container(
        padding: const EdgeInsets.only(top: 0, bottom: 10),
        child: Stack(children: [
          SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                _imageConnectivity(context),
                _noConnection(context),
                _buildInvestorData(context),
                _buildButtonContainer(context),
                const SizedBox(
                  height: 20,
                ),
              ]))
        ]));
  }

  Widget _imageConnectivity(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Image.asset(connectionLostImage));
  }

  Widget _noConnection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 25),
      child: Text(localizations.translate(noConnection),
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
              color: ConstColors.textSecondaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildInvestorData(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 12, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(localizations.translate(noInternetConnection),
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: ConstColors.textTertiaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal))
          ],
        ));
  }

  Widget _buildButtonContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 25),
      child: Center(
        child: Padding(
            padding: const EdgeInsets.only(top: 52.0),
            child: ButtonCommonWidget(
              voidCallback: () {},
              textData: localizations.translate(tryAgain),
            )),
      ),
    );
  }
}
