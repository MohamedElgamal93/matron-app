import 'package:environment/data/model/login/login_error.dart';
import 'package:environment/data/model/login/login_post.dart';
import 'package:environment/data/model/login/login_response.dart';
import 'package:environment/data/repositorys/reositories.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../data/model/error_modle.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.repositories) : super(LoginInitial());
  Repositories repositories;

  void requestLogin(LoginRequest loginPost, BuildContext context) {
    emit(LoginLoading(true));

    repositories.login(loginPost).then((value) {
      if (value.runtimeType == Login) {
        emit(LoginLoading(false));
        emit(LoginSuccess(value, context));
      } else {
        emit(LoginLoading(false));
        emit(LoginError(value));
      }
    });
  }
}
