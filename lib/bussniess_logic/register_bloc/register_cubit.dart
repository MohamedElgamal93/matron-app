// import 'package:environment/data/model/login/login_response.dart';
// import 'package:environment/data/model/register/first_step/error_first_step.dart';
// import 'package:environment/data/model/register/first_step/success_first_step.dart';
// import 'package:environment/data/model/register/register_model_post.dart';
// import 'package:environment/data/repositorys/reositories.dart';
// import 'package:bloc/bloc.dart';

// part 'register_state.dart';

// class RegisterCubit extends Cubit<RegisterState> {
//   String pin = '';
//   RegisterCubit(this.repositories) : super(RegisterInitial());
//   Repositories repositories;
//   bool isLoadingDialogAppeared = false;
//   void requestRegister(RegisterPost postRegisterStepOne) {
//     emit(RegisterLoading(true));
//     repositories.register(postRegisterStepOne).then((value) {
//       if (value.runtimeType != ErrorRegister) {
//         emit(RegisterLoading(false));

//         if (postRegisterStepOne.step == 1 || postRegisterStepOne.step == 2) {
//           emit(RegisterSuccess(SuccessVerification.fromJson(value)));
//         }
//         if (postRegisterStepOne.step == 3) {
//           emit(RegisterSuccess(LoginResponse.fromJson(value)));
//         }
//       } else {
//         emit(RegisterLoading(false));
//         emit(RegisterErorr(value));
//       }
//     });
//   }
// }
