import 'dart:async';

import 'package:environment/bussniess_logic/home_navigation_cubit/home_navigation_cubit.dart';
import 'package:environment/bussniess_logic/localization_cubit/localization_cubit.dart';
import 'package:environment/util/applocalizations.dart';
import 'package:environment/util/constthemedata.dart';
import 'package:environment/util/crashlytics_handler.dart';
import 'package:environment/util/sending_location.dart';
import 'package:environment/util/route.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'bussniess_logic/current_location/send_location_cubit.dart';
import 'data/repositorys/reositories.dart';
import 'data/repositorys/requests.dart';

void main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await FlutterDownloader.initialize(debug: false);
      // BlocProvider(
      //         create: (context) =>
      //             LocationCubit(Repositories(RequestsRepository())),
      //         child:  SendingLicationWithTimer())
    ;
     // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    //  CrashlyticsHandler.instance();
      // catch all errors that are thrown within the Flutter framework.
      // FlutterError.onError =
      //     CrashlyticsHandler.instance().crashlytics.recordFlutterError;

      runApp(const ConfigApp());
    },
    (error, stack) =>print(error)
       // CrashlyticsHandler.instance().crashlytics.recordError(error, stack),
  );
}

class ConfigApp extends StatefulWidget {
  const ConfigApp({Key? key}) : super(key: key);

  @override
  State<ConfigApp> createState() => _ConfigAppState();
}

class _ConfigAppState extends State<ConfigApp> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LocalizationCubit()..getLocale()),
          BlocProvider<HomeNavigationCubit>(
              create: (context) => HomeNavigationCubit()),
        ],
        child: BlocBuilder<LocalizationCubit, LocalizationState>(
          builder: (context, state) {
            return MaterialApp(
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
              ],
              locale: state.mainLocale,
              localeResolutionCallback: (locale, supportedLocales) {
                for (var supportedLocaleLanguage in supportedLocales) {
                  if (supportedLocaleLanguage.languageCode ==
                          locale!.languageCode &&
                      supportedLocaleLanguage.countryCode ==
                          locale.countryCode) {
                    return supportedLocaleLanguage;
                  }
                }
                return supportedLocales.first;
              },
              supportedLocales: const [
                     Locale('en', ''), // English, no country code
                Locale('ar', ''), // Arabic, no country code
           
              ],
              title: 'environment',
              debugShowCheckedModeBanner: false,
              theme: themeData,
              onGenerateRoute: AppRouter().generateRoute,
              initialRoute: '/',
            );
          },
        ));
  }
}
