/// success : false
/// data : {"message":"The given data was invalid."}
/// errors : {"email":["These credentials do not match our records."]}

class LoginErrorResponse {
  LoginErrorResponse({
      bool? success, 
      Data? data, 
      String? message,
      Errors? errors,}){
    _success = success;
    _message = message;
    _data = data;
    _errors = errors;
}

  LoginErrorResponse.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;

    _success = json['success']??false;
  }
  bool? _success;
  Data? _data;
  Errors? _errors;
  String? _message;

  bool? get success => _success;
  Data? get data => _data;
  String? get message => _message;
  Errors? get errors => _errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    if (_errors != null) {
      map['errors'] = _errors?.toJson();
    }
    return map;
  }

}

/// email : ["These credentials do not match our records."]

class Errors {
  Errors({
      List<String>? email,}){
    _email = email;
}

  Errors.fromJson(dynamic json) {
    _email = json['email'] != null ? json['email'].cast<String>() : [];
  }
  List<String>? _email;

  List<String>? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    return map;
  }

}

/// message : "The given data was invalid."

class Data {
  Data({
      String? message,}){
    _message = message;
}

  Data.fromJson(dynamic json) {
    _message = json['message'];
  }
  String? _message;

  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }

}