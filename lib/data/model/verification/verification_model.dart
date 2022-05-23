/// fromScreen : "fromS creen"
/// toScreen : "toScre en"
/// isCodeReturn : true
/// endPoint : " "

class VerificationModel {
  VerificationModel({
    String? fromScreen,
    String? messageFromAPI,
    required String toScreen,
    dynamic bodyRequest,
    dynamic bodyResponse,
    bool? isCodeReturn,
    String? endPoint,
  }) {
    _fromScreen = fromScreen;
    _toScreen = toScreen;
    _isCodeReturn = isCodeReturn;
    _endPoint = endPoint;
    _bodyRequest = bodyRequest;
    _bodyResponse = bodyResponse;
    _messageFromAPI = messageFromAPI;
  }

  set bodyRequest(dynamic value) {
    _bodyRequest = value;
  }

  VerificationModel.fromJson(dynamic json) {
    _fromScreen = json['fromScreen'];
    _toScreen = json['toScreen'];
    _isCodeReturn = json['isCodeReturn'];
    _endPoint = json['endPoint'];
    _bodyResponse = json['bodyResponse'];
    _messageFromAPI = json['messageFromAPI'];
  }

  String? _fromScreen;
  late String _toScreen;
  bool? _isCodeReturn;
  String? _endPoint;
  dynamic _bodyRequest;
  dynamic _bodyResponse;
  String? _messageFromAPI;

  String? get messageFromAPI => _messageFromAPI;

  String? get fromScreen => _fromScreen;

  dynamic get bodyRequest => _bodyRequest;
  dynamic get bodyResponse => _bodyResponse;

  String get toScreen => _toScreen;
  set toScreen(String screenName) => _toScreen = screenName;

  bool? get isCodeReturn => _isCodeReturn;

  String? get endPoint => _endPoint;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fromScreen'] = _fromScreen;
    map['toScreen'] = _toScreen;
    map['bodyRequest'] = _bodyRequest;
    map['isCodeReturn'] = _isCodeReturn;
    map['messageFromAPI'] = _messageFromAPI;
    map['bodyResponse'] = _bodyResponse;
    map['endPoint'] = _endPoint;
    return map;
  }

  set bodyResponse(dynamic value) {
    _bodyResponse = value;
  }
}
