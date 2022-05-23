import 'package:environment/util/text_direction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// `double` number,
/// optional [FormatsEnum]
/// optional custom format `https://api.flutter.dev/flutter/intl/NumberFormat-class.html`
/// ```
/// formatNumber(
///        context,
///        value: double.parse(number),
///        format: FormatsEnum.moneyWithCommas,
///   ),
/// ```

// font used MenuItem
const bool _translateNumbers = false;

String _getFormatterLocale(BuildContext context) {
  return (_translateNumbers && context.isRtl) ? 'ar_EG' : "en_US";
}

String formatNumber(
  BuildContext context, {
  required double value,
  FormatsEnum format = FormatsEnum.moneyWithCommas,
  String? numberFormat,
}) {
  if(format==FormatsEnum.moneyWithCommasFloating) {
    value=double.parse(value.toStringAsFixed(2));
  }else {
    value = double.parse(value.toInt().toString());
  }
  numberFormat ??= format.formatFromCommonFormatsEnum();

  final NumberFormat formatter =
      NumberFormat(numberFormat, _getFormatterLocale(context));

  String formattedValue = formatter.format(value);

  String _commaSeparator = "٬";
  String _decimalSeparator = "٫";
  return formattedValue
      .replaceAll(_decimalSeparator, ".")
      .replaceAll(_commaSeparator, _decimalSeparator);
}

// String _translateNumber(String number) {
//   return number
//       .replaceAll('0', '٠')
//       .replaceAll('1', '١')
//       .replaceAll('2', '٢')
//       .replaceAll('3', '٣')
//       .replaceAll('4', '٤')
//       .replaceAll('5', '٥')
//       .replaceAll('6', '٦')
//       .replaceAll('7', '٧')
//       .replaceAll('8', '٨')
//       .replaceAll('9', '٩');
// }

/// predefined number formats
enum FormatsEnum {
  /// 30,000,000
  moneyWithCommas,

  /// 30,000,000,00
  moneyWithCommasFloating,

  /// shows number as is.
  none,
}

/// symbols like , has refer to a certain pattern so replacing any
/// from the pattern would change the functionality not the symbol the usr see
/// for more check the comment at start of the class
extension on FormatsEnum {
  String formatFromCommonFormatsEnum() {
    switch (this) {
      case FormatsEnum.moneyWithCommas:
        return '#,###';
      case FormatsEnum.moneyWithCommasFloating:
        return '#,###.00';
      case FormatsEnum.none:
      default:
        return '';
    }
  }
}
