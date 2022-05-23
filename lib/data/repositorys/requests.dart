import 'dart:convert';
import 'package:environment/data/model/login/login_error.dart';
import 'package:environment/data/model/login/login_post.dart';
import 'package:environment/data/model/login/login_response.dart';
import 'package:environment/data/model/time_out/time_out_response.dart';
import 'package:environment/data/model/token_expire/un_authorization.dart';
import 'package:environment/data/model/util/error_model.dart';
import 'package:environment/data/repositorys/endpoints.dart';
import 'package:environment/util/constants/show_log.dart';
import 'package:dio/dio.dart';
import '../model/error_modle.dart';
import '../model/location/location_response.dart';
import '../model/location/loction_post.dart';
import '../shared_prefrences.dart';
import 'client.dart';

class RequestsRepository {
  final Client _client = Client();
  String? accessToken;

  RequestsRepository();

  dynamic _defaultErrorHandler(DioError error) {
   // CrashlyticsHandler crashHandler = CrashlyticsHandler.instance();
    // crashHandler.crashlytics.recordError(
    //   error.requestOptions.uri,
    //   error.stackTrace,
    // );
    dynamic errorMessage;
    showLog("error", "${error.response}");
    if (error.response == null) {
      errorMessage = ErrorModel();
    } else if (error.response?.statusCode == 401) {
      errorMessage = UnAuthorization.fromJson(
        json.decode(error.response.toString()),
      );
    } else if (error.response!.statusCode == 408) {
      errorMessage = TimeOutResponse.fromJson(
        json.decode(error.response.toString()),
      );
    } else {
      errorMessage = ErrorModel.fromJson(
        json.decode(error.response.toString()),
      );
    }
    return errorMessage;
  }



   Future<dynamic> fetchProductsLoaded() async {



    try {
     

      final response =
      await _client.init().get(Endpoint.productEndPoint);
     showLog("lllllllllogggggg", response.data);
      print(" lllllllllogggggg ${response.data}");
      return response.data;
    } on DioError catch (ex) {
      // Assuming there will be an errorMessage property in the JSON object
      return _defaultErrorHandler(ex);
    }
  }
  

 







  Future<dynamic> fetchReports(int page, int idProject) async {
    try {
      final response = await _client
          .init()
          .get('${Endpoint.fetchReports(idProject)}?page=$page');
      return response.data;
    } on DioError catch (ex) {
      return _defaultErrorHandler(ex);
    }
  }

  Future<dynamic> fetchDocuments(int page, int idProject) async {
    try {
      final response = await _client
          .init()
          .get('${Endpoint.fetchDocuments(idProject)}?page=$page');

      return response.data;
    } on DioError catch (ex) {
      // Assuming there will be an errorMessage property in the JSON object
      return _defaultErrorHandler(ex);
    }
  }

  Future<dynamic> fetchGalleriesProject(int idProject) async {
    try {
      final response =
      await _client.init().get(Endpoint.fetchGalleries(idProject));

      return response.data;
    } on DioError catch (ex) {
      // Assuming there will be an errorMessage property in the JSON object
      return _defaultErrorHandler(ex);
    }
  }

  Future<dynamic> login(LoginRequest loginPost) async {
    try {
      // showLog("loginPost request", loginPost.toJson());

      final response = await _client.init().post(Endpoint.login,
          data: loginPost.toJson());
      return Login.fromJson(response.data);
    } on DioError catch (ex) {
      Error_modle errorMessage =
      Error_modle.fromJson(json.decode(ex.response.toString()));
      return errorMessage;
    }
  }
  
  Future<dynamic> location(LocationPost locationPost) async {
    try {
    print("wwwwwwwwwwwwwwwwwwwwwww${locationPost.toJson()}");

    await fetchUserData()
          .then((value) => accessToken = value!.data!.original!.accessToken);

      final response = await _client.init(token: accessToken).post(Endpoint.location,
          data: locationPost.toJson());
      return LocationResponse.fromJson(response.data);
    } on DioError catch (ex) {
     // print("errorrrrrrrrrrrr");
      showLog("errrrrorrrrr", "${ex.response}");
      //toDoooooo
      LoginErrorResponse errorMessage =LoginErrorResponse.fromJson(json.decode(ex.response.toString()));
      return errorMessage;
    }
  }


  //Privacy
  Future<dynamic> privacy() async {
    try {
      final response = await _client.init().get(Endpoint.privacy);
      return response.data;
    } on DioError catch (ex) {
      // Assuming there will be an errorMessage property in the JSON object
      return _defaultErrorHandler(ex);
    }
  }

  Future<dynamic> faqRequest() async {
    try {
      final response = await _client.init().get(Endpoint.faq);
      return response.data;
    } on DioError catch (ex) {
      // Assuming there will be an errorMessage property in the JSON object
      return _defaultErrorHandler(ex);
    }
  }

  Future<dynamic> onBoarding() async {
    try {
      final response = await _client.init().get(Endpoint.onBoarding);
      return response.data;
    } on DioError catch (ex) {
      // if (ex.response == null) return null;

      // ErrorModel errorMessage =
      //     ErrorModel.fromJson(json.decode(ex.response.toString()));
      return null;
    }
  }

  //Privacy
  Future<dynamic> legalAgreement() async {
    try {
      final response =
      await _client.init().get(Endpoint.legalAgreement);
      return response.data;
    } on DioError catch (ex) {
      // Assuming there will be an errorMessage property in the JSON object
      return _defaultErrorHandler(ex);
    }
  }



//   //walletBalance
//   Future<dynamic> confirmAddFund(var attemptNum) async {
//     try {
//       await fetchUserData()
//           .then((value) => accessToken = value!.data!.accessToken);
//       final response = await _client.init(token: accessToken)
// //          .post("fund_operations/confirm_add_fund/$attemptNum");
//           .post(Endpoint.confirmAddFund, data: {
//         "data": encrypt(jsonEncode({"attemptNum": attemptNum}))
//       });
//       showLog("response Confirm", "${response.data}");
//       return SuccessModel.fromJson(response.data);
//     } on DioError catch (ex) {
//       // Assuming there will be an errorMessage property in the JSON object
//       return _defaultErrorHandler(ex);
//     }
//   } //walletBalance


  Future<dynamic> defaultSettings() async {
    try {
      final response = await _client.init().get(Endpoint.settings);
      return response.data;
    } on DioError catch (ex) {
      // Assuming there will be an errorMessage property in the JSON object
      return _defaultErrorHandler(ex);
    }
  }
}
