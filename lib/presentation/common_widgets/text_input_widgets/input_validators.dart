import 'package:environment/util/expiration_date_validate.dart';

bool isPhoneNumberValid(String number) {
  return number.length == 10;
}

bool isPasswordValid(String password) {
  final numericRegex = RegExp(r'[0-9]');
  final lowerRegex = RegExp(r'[a-z]');
  final capitalRegex = RegExp(r'[A-Z]');
  final symbolRegex = RegExp(r'[/|\()_#?!@$%^&*-]');

  if (!(password.length >= 8)) return false;
  if (!numericRegex.hasMatch(password)) return false;
  if (!lowerRegex.hasMatch(password)) return false;
  if (!capitalRegex.hasMatch(password)) return false;
  if (!symbolRegex.hasMatch(password)) return false;

  return true;
}

bool isValidEmail(String email) {
  return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email);
}

bool isValidCard(String cardNumber) {
  return RegExp(
      r'^(?:4[0-9]{12}(?:[0-9]{3})?|[25][1-7][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$')
      .hasMatch(cardNumber);
}

bool isValidCVV(String? value) {
  return (value ?? '').length == 3;
}

String? validateDate(String value) {
  if (value.isEmpty) {
    return "isRequires";
  }

  int year;
  int month;
  // The value contains a forward slash if the month and year has been
  // entered.
  if (value.contains(RegExp(r'(\/)'))) {
    var split = value.split(RegExp(r'(\/)'));
    // The value before the slash is the month while the value to right of
    // it is the year.
    month = int.parse(split[0]);
    year = int.parse(split[1]);
  } else {
    // Only the month was entered
    month = int.parse(value.substring(0, (value.length)));
    year = -1; // Lets use an invalid year intentionally
  }

  if ((month < 1) || (month > 12)) {
    // A valid month is between 1 (January) and 12 (December)
    return 'Expiry month is invalid';
  }

  var fourDigitsYear = convertYearTo4Digits(year);
  if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
    // We are assuming a valid year should be between 1 and 2099.
    // Note that, it's valid doesn't mean that it has not expired.
    return 'Expiry year is invalid';
  }

  if (!hasDateExpired(month, year)) {
    return "Card has expired";
  }
  return null;
}

bool isValidateDate(String value) {
  if (value.isEmpty) {
    return true;
  }

  int year;
  int month;
  // The value contains a forward slash if the month and year has been
  // entered.
  if (value.contains(RegExp(r'(\/)'))) {
    var split = value.split(RegExp(r'(\/)'));
    // The value before the slash is the month while the value to right of
    // it is the year.
    month = int.parse(split[0]);
    year = int.parse(split[1]);
  } else {
    // Only the month was entered
    month = int.parse(value.substring(0, (value.length)));
    year = -1; // Lets use an invalid year intentionally
  }

  if ((month < 1) || (month > 12)) {
    // A valid month is between 1 (January) and 12 (December)
    return true;
  }

  var fourDigitsYear = convertYearTo4Digits(year);
  if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
    // We are assuming a valid year should be between 1 and 2099.
    // Note that, it's valid doesn't mean that it has not expired.
    return true;
  }

  if (!hasDateExpired(month, year)) {
    return true;
  }
  return false;
}