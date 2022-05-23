import 'package:environment/presentation/common_widgets/buttonstanderd.dart';
import 'package:environment/util/applocalizations.dart';
import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/images.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:environment/util/constants/string_translate.dart';
import 'package:environment/util/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void openUnderReviewScreen(BuildContext context) {
  /// widgetBinding instace is required  for navigation while build
  /// so it will navigate while building
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      underReviewScreen,
      (route) => false,
    );
  });
}

class UnderReviewScreen extends StatefulWidget {
  const UnderReviewScreen({
    Key? key,
  }) : super(key: key);

  @override
  _UnderReviewScreen createState() => _UnderReviewScreen();
}

class _UnderReviewScreen extends State<UnderReviewScreen> {
  AppLocalizations? localizations;
  bool isChangeNetwork = false;

  @override
  void didChangeDependencies() {
    localizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Container(
                  decoration: const BoxDecoration(
                    color: ConstColors.backgroundColorSecond,
                  ),
                  child: Stack(children: [
                    Form(
                        child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                          SizedBox(
                              height: screenHeight -
                                  SizeConfig.height(
                                      context: context, pixels: 110),
                              child: Stack(children: [
                                SingleChildScrollView(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                      _reviewImage(context),
                                      SizedBox(
                                          height: SizeConfig.height(
                                              context: context, pixels: 47)),
                                      _buidUnderReview(context),
                                      SizedBox(
                                          height: SizeConfig.height(
                                              context: context, pixels: 16)),
                                      _buidRecievingRequestDone(context),
                                      SizedBox(
                                          height: SizeConfig.height(
                                              context: context, pixels: 100)),
                                    ]))
                              ])),
                          _buildLoginButton(),
                        ])))
                  ])))),
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
            Navigator.pushNamedAndRemoveUntil(
                context, homePage, (route) => false);
          },
          textData: localizations!.translate(done),
        ),
      ),
    );
  }

  Widget _reviewImage(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: SizeConfig.height(context: context, pixels: 120),
      ),
      height: SizeConfig.height(context: context, pixels: 147),
      width: SizeConfig.width(context: context, pixels: 81),
      child: SvgPicture.asset(underReviewSVG),
    );
  }

  Widget _buidRecievingRequestDone(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            left: SizeConfig.width(context: context, pixels: 24),
            right: SizeConfig.width(context: context, pixels: 24)),
        child: Text(
          localizations!.translate(weRecievingYourRequest),
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: ConstColors.fiveGreyBlue, fontSize: 17),
        ));
  }

  Widget _buidUnderReview(BuildContext context) {
    return Text(
      localizations!.translate(yourRequestUnderReview),
      style: Theme.of(context)
          .textTheme
          .headline6!
          .copyWith(color: ConstColors.blackColor, fontSize: 24),
    );
  }
}
