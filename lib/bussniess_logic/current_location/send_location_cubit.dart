import 'package:environment/data/model/login/login_error.dart';
import 'package:environment/data/repositorys/reositories.dart';
import 'package:bloc/bloc.dart';
import 'package:environment/util/constants/show_log.dart';
import 'package:flutter/cupertino.dart';

import '../../data/model/location/location_response.dart';
import '../../data/model/location/loction_post.dart';

part 'send_location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit(this.repositories) : super(LocationInitial());
  Repositories repositories;

  void sendLocation(LocationPost locationPost, BuildContext context) {
    emit(LocationLoading(true));

    repositories.location(locationPost).then((value) {
      if (value.runtimeType == LocationResponse) {
        emit(LocationLoading(false));
        emit(LocationSuccess(value, context));
      } else {
        emit(LocationLoading(false));
        emit(LoginError(value));
      }
    });
  }
}
