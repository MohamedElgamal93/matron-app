/// code : "404"
/// message : "Sorry no results query for your request."
/// type : "Error"
/// data : null

class ErrorRegister {
  ErrorRegister({
      String? code, 
      String? message, 
      String? type, 
      dynamic data,}){
    _code = code;
    _message = message;
    _type = type;
    _data = data;
}

  ErrorRegister.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
    _type = json['type'];
    _data = json['data'];
  }
  String? _code;
  String? _message;
  String? _type;
  dynamic _data;

  String? get code => _code;
  String? get message => _message;
  String? get type => _type;
  dynamic get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['message'] = _message;
    map['type'] = _type;
    map['data'] = _data;
    return map;
  }

}