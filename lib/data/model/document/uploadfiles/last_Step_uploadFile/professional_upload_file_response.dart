class ProfessionalResponseUploadFile {
  ProfessionalResponseUploadFile({
    required this.code,
    required this.message,
    required this.type,
    this.data,
  });
  late final String code;
  late final String message;
  late final String type;
  late final dynamic data;

  ProfessionalResponseUploadFile.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    type = json['type'];
    data = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['message'] = message;
    _data['type'] = type;
    _data['data'] = data;
    return _data;
  }
}
