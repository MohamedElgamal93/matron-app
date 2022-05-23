import 'package:environment/bussniess_logic/slider_bloc/slider_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderCubit extends Cubit<SliderState> {
  int _index = 0;
  int get index => _index;
  SliderCubit(SliderState initialState) : super(InitialSliderState());

  updateIndex(int newIndex) {
    _index = newIndex;
    emit(SliderUpdateIndex());
  }
}
