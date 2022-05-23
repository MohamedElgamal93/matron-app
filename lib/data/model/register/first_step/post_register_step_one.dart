/// step : 1
/// phone : "+201014355851"
/// phone_country_code : "EG"
/// email : "mohammed.h.fares2@gmail.com"

class PostRegisterStepOne {
  PostRegisterStepOne({
      int? step, 
      String? phone, 
      String? phoneCountryCode, 
      String? email,}){
    _step = step;
    _phone = phone;
    _phoneCountryCode = phoneCountryCode;
    _email = email;
}

  PostRegisterStepOne.fromJson(dynamic json) {
    _step = json['step'];
    _phone = json['phone'];
    _phoneCountryCode = json['phone_country_code'];
    _email = json['email'];
  }
  int? _step;
  String? _phone;
  String? _phoneCountryCode;
  String? _email;

  int? get step => _step;
  String? get phone => _phone;
  String? get phoneCountryCode => _phoneCountryCode;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['step'] = _step;
    map['phone'] = _phone;
    map['phone_country_code'] = _phoneCountryCode;
    map['email'] = _email;
    return map;
  }

}