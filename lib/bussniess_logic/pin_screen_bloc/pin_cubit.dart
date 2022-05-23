import 'package:environment/bussniess_logic/pin_screen_bloc/pin_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PinCubit extends Cubit<PinStates> {
  PinCubit() : super(UpdatePinScreen());

  void update() {
    emit(UpdatePinScreen());
  }
}
