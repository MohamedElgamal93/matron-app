// import 'dart:developer';

// import 'package:environment/data/model/register/first_step/success_first_step.dart';
// import 'package:environment/data/model/register/register_model_post.dart';
// import 'package:environment/data/model/time_out/time_out_response.dart';
// import 'package:environment/data/model/token_expire/un_authorization.dart';
// import 'package:environment/data/model/util/scucces_model.dart';
// import 'package:environment/data/repositorys/reositories.dart';
// import 'package:bloc/bloc.dart';

// part 'verification_state.dart';

// class VerificationCubit extends Cubit<VerificationState> {
//   VerificationCubit(this.repositories) : super(VerificationInitial());
//   final Repositories repositories;

//   resendRequest({required String url, dynamic bodyRequest}) {
//     emit(ResendLoading(true));
//     log('bodyRequest $bodyRequest');
//     repositories
//         .verification(url: url, bodyRequest: bodyRequest)
//         .then((response) {
//       if (response.runtimeType == UnAuthorization) {
//         emit(VerificationUnAuthError(response));
//         return;
//       }
//         else if (response.runtimeType==TimeOutResponse){
//    emit(TimeOutError(response));
//         return;
//       }
//       emit(ResendLoading(false));
//       log('respons21e ${response.status}');
//       if (response.status) {
//         emit(ResendLoaded(SuccessVerification.fromJson(response.data)));
//       } else {
//         emit(ResendError(RegisterPost.fromJson(response.data)));
//       }
//     });
//   }

//   submitRequest({required String url, dynamic bodyRequest}) {
//     emit(VerifyLoading(true));
//     repositories
//         .verification(url: url, bodyRequest: bodyRequest)
//         .then((response) {
//       if (response.runtimeType == UnAuthorization) {
//         emit(VerificationUnAuthError(response));
//         return;
//       }
//         else if (response.runtimeType==TimeOutResponse){
//    emit(TimeOutError(response));
//         return;
//       }
//       emit(VerifyLoading(false));
//       if (response.status) {
//         emit(VerifyLoaded(SuccessModel.fromJson(response.data)));
//       } else {
//         emit(VerifyError(SuccessVerification.fromJson(response.data)));
//       }
//     });
//   }
// }
