

class GetDocumentDataResponse {
  GetDocumentDataResponse({
    required this.code,
    required this.message,
    required this.type,
    required this.dataDetails,
  });
  late final String code;
  late final String message;
  late final String type;
  late final List<DataDetails> dataDetails;
  
  GetDocumentDataResponse.fromJson(Map<String, dynamic> json){
    code = json['code'];
    message = json['message'];
    type = json['type'];
    dataDetails = List.from(json['data']).map((e)=>DataDetails.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['message'] = message;
    _data['type'] = type;
    _data['data'] = dataDetails.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class DataDetails {
  DataDetails({
    required this.key,
    required this.title,
    required this.question,
  });
  late final String key;
  late final String title;
  late final String question;
  
  DataDetails.fromJson(Map<String, dynamic> json){
    key = json['key'];
    title = json['title'];
    question = json['question'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['key'] = key;
    _data['title'] = title;
    _data['question'] = question;
    return _data;
  }
}







