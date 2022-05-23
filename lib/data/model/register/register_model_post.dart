/// step : 3
/// passport_number : "1060224670"
/// passport_expires_at : "2022-10-28"
/// dob : "1409-06-06"
/// phone : "00201227646620"
/// phone_country_code : "EG"
/// email : "mfares11132@gmail.com"
/// password : "Fares$@111"
/// password_confirmation : "Fares$@111 1"

class RegisterPost {
  RegisterPost({
    int? step,
    String? passportNumber,
    String? passportExpiresAt,
    String? dob,
    String? phone,
    String? phoneCountryCode,
    String? email,
    String? code,
    String? password,
    String? passwordConfirmation,
  }) {
    _step = step;
    _passportNumber = passportNumber;
    _passportExpiresAt = passportExpiresAt;
    _dob = dob;
    _phone = phone;
    _code = code;
    _phoneCountryCode = phoneCountryCode;
    _email = email;
    _password = password;
    _passwordConfirmation = passwordConfirmation;
  }

  RegisterPost.fromJson(dynamic json) {
    _step = json['step'];
    _passportNumber = json['passport_number'];
    _passportExpiresAt = json['passport_expires_at'];
    _dob = json['dob'];
    _phone = json['phone'];
    _phoneCountryCode = json['phone_country_code'];
    _email = json['email'];
    _password = json['password'];
    _passwordConfirmation = json['password_confirmation'];
  }
  int? _step;
  String? _passportNumber;
  String? _passportExpiresAt;
  String? _dob;
  String? _phone;
  String? _phoneCountryCode;
  String? _email;
  String? _password;
  String? _code;
  String? _passwordConfirmation;

  String? get code => _code;

  set code(String? value) {
    _code = value;
  }

  set pass_confirm(String? value) {
    _passwordConfirmation = value;
  }

  set password(String? value) {
    _password = value;
  }

  int? get step => _step;
  String? get passportNumber => _passportNumber;
  String? get passportExpiresAt => _passportExpiresAt;
  String? get dob => _dob;
  String? get phone => _phone;
  String? get phoneCountryCode => _phoneCountryCode;
  String? get email => _email;
  String? get password => _password;
  String? get passwordConfirmation => _passwordConfirmation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['step'] = _step;
    if (_passportNumber != null) {
      map['passport_number'] = _passportNumber;
    }
    if (_passportExpiresAt != null) {
      map['passport_expires_at'] = _passportExpiresAt;
    }
    if (_dob != null) {
      map['dob'] = _dob;
    }
    if (_phoneCountryCode != null) {
      map['phone_country_code'] = _phoneCountryCode;
    }
    if (_passwordConfirmation != null) {
      map['password_confirmation'] = _passwordConfirmation;
    }
    if (_password != null) {
      map['password'] = _password;
    }

    map['phone'] = _phone;
    //  map['email'] = _email;
    return map;
  }
}
