
import 'package:environment/util/constants/strings.dart';
import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

class Client {
  Dio init({String? token}) {
    var uuid = const Uuid();
    Dio _dio = Dio();
   // _dio.interceptors.add(ApiInterceptors());
    _dio.options.receiveDataWhenStatusError = true;
    _dio.options.connectTimeout = 60 * 1000; // 60 seconds
    _dio.options.receiveTimeout = 60 * 1000;
    _dio.options.headers = {
      "X-Request-Timestamp": '${DateTime.now().millisecondsSinceEpoch / 1000}',
      "X-Request-Id": uuid.v4(),
      "X-Client-Referrer": "api",

    };
    if (token != null) {
      _dio.options.headers["Authorization"] = "Bearer $token";
    }
    _dio.options.baseUrl = baseUrl;

    return _dio;
  }
}

