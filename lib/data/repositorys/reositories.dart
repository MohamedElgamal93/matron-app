import 'dart:async';

import 'package:environment/data/model/document/delete_files/delete_file_post.dart';
import 'package:environment/data/model/document/uploadfiles/first_upload_file.dart';
import 'package:environment/data/model/document/uploadfiles/last_Step_uploadFile/post_final_list.dart';

import 'package:environment/data/model/login/login_post.dart';

import 'package:environment/data/model/register/register_model_post.dart';

import 'package:environment/data/repositorys/requests.dart';

import '../model/location/loction_post.dart';

class Repositories {
  final RequestsRepository requestsRepository;

  Repositories(this.requestsRepository);


 

  Future<dynamic> privacy() async {
    final dynamic = await requestsRepository.privacy();
    return dynamic;
  }

  Future<dynamic> faqRequest() async {
    final dynamic = await requestsRepository.faqRequest();
    return dynamic;
  }

  Future<dynamic> onBoarding() async {
    final dynamic = await requestsRepository.onBoarding();
    return dynamic;
  }

  Future<dynamic> legalAgreement() async {
    final dynamic = await requestsRepository.legalAgreement();
    return dynamic;
  }


  Future<dynamic> fetchReports(int page, int idProject) async {
    final dynamic = await requestsRepository.fetchReports(page, idProject);
    return dynamic;
  }

  Future<dynamic> fetchDocuments(int page, int idProject) async {
    final dynamic = await requestsRepository.fetchDocuments(page, idProject);
    return dynamic;
  }

  Future<dynamic> fetchGalleriesProject(int idProject) async {
    final dynamic = await requestsRepository.fetchGalleriesProject(idProject);
    return dynamic;
  }





  Future<dynamic> login(LoginRequest loginPost) async {
    var response = await requestsRepository.login(loginPost);
    return response;
  }

  Future<dynamic> location(LocationPost locationPost) async {
// print(
//   "sssssssssrrrrrrrrrrrrrrrr${locationPost.lat}"
// );
    var response = await requestsRepository.location(locationPost);
    return response;
          
  }


  
  Future<dynamic> defaultSettings() async {
    var response = await requestsRepository.defaultSettings();
    return response;
  }



  Future<dynamic> fetchProducts() async {
    final dynamic = await requestsRepository.fetchProductsLoaded();
    return dynamic;
  }
}
