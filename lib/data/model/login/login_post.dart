class LoginRequest {
  dynamic email;
  dynamic password;
  dynamic fcmToken;
  dynamic fcmType;

  LoginRequest({this.email, this.password, this.fcmToken, this.fcmType});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    fcmToken = json['device_token'];
    fcmType = json['device_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['device_token'] = fcmToken;
    data['device_type'] = fcmType;

    return data;
  }
}
