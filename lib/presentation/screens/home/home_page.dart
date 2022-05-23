import 'package:environment/bussniess_logic/home_navigation_cubit/home_navigation_cubit.dart';
import 'package:environment/presentation/screens/common_screen/no_internet/no_internet.dart';
import 'package:environment/presentation/screens/invest/dashboard/dashboard.dart';
import 'package:environment/presentation/screens/settings/setting/settingscreen.dart';
import 'package:environment/util/applocalizations.dart';
import 'package:environment/util/constants/colors.dart';
import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../mapping/mappin_poly_line.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AppLocalizations localizations;
  List<Widget> screensItemNavigation = [
    const SettingScreen(),
    const MappingScreenPoly(),
    const Dashboard(),
  ];

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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: ConstColors.secondaryColor),
      child: BlocBuilder<HomeNavigationCubit, HomeNavigationState>(
        builder: (context, state) {
          return Scaffold(
            body: ConnectivityBuilder(
              builder: (BuildContext context, bool? isConnected,
                  ConnectivityStatus? status) {
                if (isConnected == false) {
                  return const NoInternetConnection();
                } else {
                  SystemChrome.setSystemUIOverlayStyle(
                      const SystemUiOverlayStyle(
                          statusBarColor: ConstColors.secondaryColor));
                  return screensItemNavigation[state.tab.index];
                }
              },
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: ConstColors.textTertiaryColor,
              unselectedIconTheme: const IconThemeData(
                  color: ConstColors.textTertiaryColor, opacity: .1),
              selectedIconTheme: const IconThemeData(
                  color: ConstColors.primaryColor, opacity: 1),
              selectedItemColor: ConstColors.secondaryColor,
              selectedFontSize: 13,
              unselectedFontSize: 13,
              showUnselectedLabels: true,
              items: [
                BottomNavigationBarItem(
                    activeIcon: Image.asset("assets/images/splash/refresh.png",
                        width: 35, height: 35),
                    icon: Image.asset("assets/images/splash/refresh.png",
                        width: 35, height: 35),
                    label: ""),
                BottomNavigationBarItem(
                    activeIcon: Image.asset(
                        "assets/images/splash/map_active.png",
                        width: 35,
                        height: 35),
                    icon: Image.asset("assets/images/splash/map_unactive.png",
                        width: 35, height: 35),
                    label: ""),
                BottomNavigationBarItem(
                    activeIcon: Image.asset(
                        "assets/images/splash/home_active.png",
                        width: 35,
                        height: 35),
                    icon: Image.asset("assets/images/splash/home_unactive.png",
                        width: 35, height: 35),
                    label: ""),
              ],
              onTap: (index) => BlocProvider.of<HomeNavigationCubit>(context)
                  .changeLandingTab(index),
              currentIndex: state.tab.index,
            ),
          );
        },
      ),
    );
  }
}
