/// success : false
/// data : {"message":"Token has expired"}

class UnAuthorization {
  UnAuthorization({
    required this.code,
    required this.message,
    required this.type,
    required this.data,
  });
  late final dynamic code;
  late final dynamic message;
  late final dynamic type;
  late final List<dynamic> data;

  UnAuthorization.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    type = json['type'];
    if (json['data'] != null) {
      data = List.castFrom<dynamic, dynamic>(json['data']);
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['message'] = message;
    _data['type'] = type;
    if (_data['data'] != null) {
      _data['data'] = data;
    }

    return _data;
  }
}