import 'dart:async';

import 'package:environment/data/model/onboard/onboarding_response.dart';
import 'package:environment/data/model/slider/slider_model.dart';
import 'package:environment/presentation/common_widgets/default_slider.dart';
import 'package:environment/util/applocalizations.dart';
import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/images.dart';
import 'package:environment/util/constants/strings.dart';
import 'package:environment/util/text_direction.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  OnBoard? boardData;
  late AppLocalizations localizations;

  @override
  void didChangeDependencies() {
    localizations = AppLocalizations.of(context)!;
    boardData = ModalRoute.of(context)!.settings.arguments as OnBoard?;
    boardData ??= OnBoard(
      one: OnBoardingData(
        head: localizations.translate("onBoarding1Header"),
        body: localizations.translate("onBoarding1Body"),
      ),
      second: OnBoardingData(
        head: localizations.translate("onBoarding2Header"),
        body: localizations.translate("onBoarding2Body"),
      ),
   
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        //backgroundColor: ConstColors.errorColor,
        body:DefaultSlider(
            onFinish: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, registerFirst, (route) => false);
            },
            sliders: [
              SliderModel(
                imgAssetPath: onboardFirst,
                networkImage: boardData?.one?.image,
                title: boardData?.one?.head,
                subTitle: boardData?.one?.body,
              ),
              SliderModel(
                imgAssetPath:  onboardSecondAr ,
                title: boardData?.second?.head,
                networkImage: boardData?.second?.image,
                subTitle: boardData?.second?.body,
              ),
             
            ],
          
        ),
      ),
    );
  }

  Future<bool> _onWillPop() {
    Navigator.pushNamed(context, registerFirst);

    return Future(() => false);
  }
}
