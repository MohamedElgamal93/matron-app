/// status : true
/// data : "response.data"

class VerifyResponseModel {
  VerifyResponseModel({
    bool? status,
    dynamic data,
  }) {
    _status = status;
    _data = data;
  }

  VerifyResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = json['data'];
    }
  }
  bool? _status;
  dynamic _data;

  bool? get status => _status;
  dynamic get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['data'] = _data;
    return map;
  }
}
