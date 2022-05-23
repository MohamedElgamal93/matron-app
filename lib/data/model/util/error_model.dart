class ErrorModel {
  ErrorModel({
    bool? success,
    String? code,
    String? message,
    List<dynamic>? errors,
    Data? data,
  }) {
    _success = success;
    _errors = errors;
    _data = data;
  }

  ErrorModel.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
    if (json['success'] != null) {
      _success = json['success'];
    }
    if (json['errors'] != null) {
      _errors = [];
      json['errors'].forEach((v) {
        //_errors?.add(dynamic.fromJson(v));
      });
    }
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  bool? _success;
  List<dynamic>? _errors;
  Data? _data;
  String? _code;
  String? _message;

  bool? get success => _success;

  List<dynamic>? get errors => _errors;

  Data? get data => _data;

  String? get code => _code;

  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_errors != null) {
      map['errors'] = _errors?.map((v) => v.toJson()).toList();
    }
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['code'] = _code;
    map['message'] = _message;
    return map;
  }
}

/// message : "You should be logged in to perform this action."

class Data {
  Data({
    String? message,
  }) {
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
