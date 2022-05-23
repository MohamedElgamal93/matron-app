import 'package:environment/bussniess_logic/onboard_bloc/onboard_cubit.dart';

import 'package:environment/bussniess_logic/register_bloc/register_cubit.dart';

import 'package:environment/data/repositorys/reositories.dart';
import 'package:environment/data/repositorys/requests.dart';
import 'package:environment/presentation/screens/authorization/pin_change_success/pin_change_success.dart';

import 'package:environment/presentation/screens/authorization/register/step_one/phone_registeration_screen.dart';
import 'package:environment/presentation/screens/authorization/register/step_three/password_validation.dart';
import 'package:environment/presentation/screens/common_screen/empty_screen_connection/empty_screen_connection.dart';
import 'package:environment/presentation/screens/common_screen/token_expire/token_expire_screen.dart';
import 'package:environment/presentation/screens/common_screen/under_review/under_review_page.dart';
import 'package:environment/presentation/screens/home/home_page.dart';
import 'package:environment/presentation/screens/onboarding/onboarding_page/onboarding_page.dart';
import 'package:environment/presentation/screens/onboarding/splash/splash_screen.dart';
import 'package:environment/presentation/screens/settings/setting/settingscreen.dart';
import 'package:environment/util/constants/show_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bussniess_logic/current_location/send_location_cubit.dart';
import '../bussniess_logic/login_bloc/login_cubit.dart';
import '../presentation/screens/authorization/login/login_page.dart';
import '../presentation/screens/invest/dashboard/dashboard.dart';
import '../presentation/screens/mapping/mappin_poly_line.dart';
import '../presentation/screens/mapping/mapping_page.dart';
import 'constants/strings.dart';

class AppRouter {
  late Repositories repositories;

  AppRouter() {
    repositories = Repositories(RequestsRepository());
  }

  Route? generateRoute(RouteSettings settings) {
    showLog("navigation", settings.name);
    switch (settings.name) {
      case firstScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => OnboardCubit(repositories),
            child: const SplashScreen(),
          ),
        );
      case homePage:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );

      case registerFirst:
        return MaterialPageRoute(
          builder: (_) => PhoneRegistrationScreen(),
        );
        
        
          case loginRoute:
        return  MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(repositories),
            child: const LoginPage(),
          ),
        );
        
       



      case onBoardPage:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingPage(), settings: settings);

      case mappingScreenPoly:
        return
              MaterialPageRoute(
  builder: (_) => BlocProvider(
              create: (context) =>
                  LocationCubit(Repositories(RequestsRepository())),
              child: const MappingScreenPoly()),
                  settings: settings,

        
        );
        
      

      case settingPage:
        return MaterialPageRoute(
          builder: (context) => const SettingScreen(),
        );

   

      case pinChangeSuccess:
        return MaterialPageRoute(
          builder: (context) => const PinSuccessWidget(),
        );

      case performancePage:
        return MaterialPageRoute(
  builder: (_) => BlocProvider(
              create: (context) =>
                  LocationCubit(Repositories(RequestsRepository())),
              child: const MappingScreen()),

        
        );

      case emptyConnectivity:
        return MaterialPageRoute(
          builder: (context) => const EmptyConnectivityPage(),
        );

      case tokenExpireScreen:
        return MaterialPageRoute(
          builder: (_) => const TokenExpireScreen(),
        );

      case underReviewScreen:
        return MaterialPageRoute(
          builder: (context) => const UnderReviewScreen(),
        );
    }
  }
}
