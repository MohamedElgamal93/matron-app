import 'package:environment/data/local_cache.dart';
import 'package:environment/presentation/common_widgets/background_common_widget.dart';
import 'package:environment/util/constants/images.dart';
import 'package:environment/util/constants/strings.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  _statusPreferences() async {
    //  BlocProvider.of<OnboardCubit>(context).defaultSettings();
    Future.delayed(const Duration(seconds: 3), () async {
      LocalCache localCache = LocalCache();
      //for testing
      bool showOnBoarding = false;
      bool isNotFirstRun = (await localCache.getBool(isFirstRunKey)) ?? false;
      bool isUserSaved =
          ((await localCache.get(userDataKey)) ?? '').trim().isNotEmpty;
      Navigator.pushNamedAndRemoveUntil(
        context,
        onBoardPage,
        (route) => false,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _statusPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: BackgroundCommonWidget(
      image: logoenvironmentSplash,
    ));
  }
}
