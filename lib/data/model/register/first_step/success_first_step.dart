/// code : "2201"
/// message : "ادخل كلمة المرور لمرة واحدة الذي تم إرسالها إلى +966550802000"
/// type : "Confirm"
/// data : {"SMS_code":"1111"}
/// status : "null"

class SuccessVerification {
  SuccessVerification({
    String? code,
    String? message,
    String? type,
    Data? data,
    String? status,
  }) {
    _code = code;
    _message = message;
    _type = type;
    _data = data;
    _status = status;
  }

  SuccessVerification.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
    _type = json['type'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _status = json['status'];
  }
  String? _code;
  String? _message;
  String? _type;
  Data? _data;
  String? _status;

  String? get code => _code;
  String? get message => _message;
  String? get type => _type;
  Data? get data => _data;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['message'] = _message;
    map['type'] = _type;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['status'] = _status;
    return map;
  }
}

/// SMS_code : "1111"

class Data {
  Data({
    String? sMSCode,
  }) {
    _sMSCode = sMSCode;
  }

  Data.fromJson(dynamic json) {
    _sMSCode = json['SMS_code'];
  }
  String? _sMSCode;

  String? get sMSCode => _sMSCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['SMS_code'] = _sMSCode;
    return map;
  }
}
