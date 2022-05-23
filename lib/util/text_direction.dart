import 'package:environment/util/applocalizations.dart';
import 'package:flutter/material.dart';

extension RTL on BuildContext {
  /// Extension on [BuildContext] uses [AppLocalizations] to check text direction
  /// depending on the current locale
  bool get isRtl => AppLocalizations.of(this)!.locale.languageCode == 'ar';
}
