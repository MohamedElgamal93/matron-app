import 'dart:io';

import 'package:environment/util/applocalizations.dart';
import 'package:environment/util/constants/string_translate.dart';
import 'package:environment/util/numbers_formatter.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:environment/util/text_direction.dart';

class Utils {
  /// share project Title, url and description
  static shareProject({
    required String? projectName,
    required String? projectShortDescription,
  }) {
    /**
     * Schemes:
     * Android
     * https://play.google.com/store/apps/details?id=com.environment
     *
     * iOS
     * https://apps.apple.com/us/app/com.environment
     */

    String message = '${projectName ?? ' '}.\n';
    if (Platform.isIOS) {
      message +=  'https://apps.apple.com/us/app/com.environment';
    } else {
      message +='https://play.google.com/store/apps/details?id=com.environment';
    }
    message += projectShortDescription ?? '';
    Share.share(message);
  }

  /// returns the text of (Unit, وحدة) based on the number of units
  static String formattedUnitText(BuildContext context, String value) {
    int units = int.tryParse(value)??0;
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    if (context.isRtl) {
      /// arabic
      /// 1:2    single
      /// 11:... single
      /// 3:10   many
      if (units < 2 || units >= 10) return localizations.translate(oneUnit);
      return localizations.translate(manyUnit);
    } else {
      /// english
      /// 1     single
      /// 2:... many
      if (units < 2) return localizations.translate(oneUnit);
      return localizations.translate(manyUnit);
    }
  }

  static String fileSizeFormatted(BuildContext context, {int sizeInKB = 0}) {
    const int mbSize = 1024;
    if (sizeInKB < mbSize) {
      return '${formatNumber(context, value: sizeInKB.toDouble())}' 'KB' ;
    }
    final int sizeInMB = sizeInKB ~/ mbSize;
    return  '${formatNumber(context, value: sizeInMB.toDouble())}' 'MB';
  }
}
