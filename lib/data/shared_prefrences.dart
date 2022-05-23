import 'dart:convert';

import 'package:environment/data/local_cache.dart';
import 'package:environment/util/constants/strings.dart';

import 'model/login/login_response.dart';

Future<Login?> fetchUserData() async {
  LocalCache localCache = LocalCache();
  String? userData = await localCache.get(userDataKey);
  var user;
  if ((userData ?? '').trim().isNotEmpty) {
    dynamic json = jsonDecode(userData!);
    user = Login.fromJson(json);
  }
  return user;
}

void saveUserData(dynamic userModel) async {
  String user = jsonEncode(userModel);

  LocalCache().save(userDataKey, user);
}

void clearUserData() async {
  LocalCache().delete(userDataKey);
}
