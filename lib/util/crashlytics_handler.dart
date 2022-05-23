// import 'package:environment/util/constants/show_log.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:flutter/foundation.dart' show kDebugMode;


// /// A singleton class to handle [FirebaseCrashlytics]
// class CrashlyticsHandler {
//   final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;

//   FirebaseCrashlytics get crashlytics => _crashlytics;

//   // Toggle this for testing Crashlytics in your app locally.
//   static const _forceEnableCrashlytics = true;

//   /// private constructor for singleton pattern
//   CrashlyticsHandler._internal() {
//     _initializeFirebaseCrashlytics();
//     showLog('CRASHLYTICS', 'enabled');
//   }

//   static final CrashlyticsHandler _handler = CrashlyticsHandler._internal();

//   factory CrashlyticsHandler.instance() {
//     return _handler;
//   }

//   Future<void> _initializeFirebaseCrashlytics() async {
//     if (_forceEnableCrashlytics) {
//       // Force enable crashlytics collection enabled if we're testing it.
//       await _crashlytics.setCrashlyticsCollectionEnabled(true);
//     } else {
//       // Else only enable it in non-debug builds.
//       await _crashlytics.setCrashlyticsCollectionEnabled(!kDebugMode);
//     }
//   }

//   setActiveUSer(String userId) {
//     _crashlytics.setUserIdentifier(userId);
//   }
// }
