class OnBoardResponse {
  OnBoardResponse({
    this.code,
    this.message,
    this.type,
    this.data,
  });
  String? code;
  String? message;
  String? type;
  OnBoard? data;

  OnBoardResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    type = json['type'];
    data = OnBoard.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['message'] = message;
    _data['type'] = type;
    _data['data'] = data?.toJson();
    return _data;
  }
}

class OnBoard {
  OnBoard({
    this.one,
    this.second,
    this.third,
  });
  OnBoardingData? one;
  OnBoardingData? second;
  OnBoardingData? third;

  OnBoard.fromJson(Map<String, dynamic> json) {
    one = OnBoardingData.fromJson(json['1']);
    second = OnBoardingData.fromJson(json['2']);
    third = OnBoardingData.fromJson(json['3']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['1'] = one?.toJson();
    _data['2'] = second?.toJson();
    _data['3'] = third?.toJson();
    return _data;
  }
}

class OnBoardingData {
  OnBoardingData({
    this.head,
    this.body,
    this.image,
  });
  String? head;
  String? body;
  String? image;

  OnBoardingData.fromJson(Map<String, dynamic> json) {
    head = json['head'];
    body = json['body'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['head'] = head;
    _data['body'] = body;
    _data['image'] = image;
    return _data;
  }
}
