
import 'package:environment/data/repositorys/reositories.dart';
import 'package:bloc/bloc.dart';

part 'text_input_filed_common_state.dart';

class UpdatedTextInputCubit extends Cubit<UpdatedState> {
  UpdatedTextInputCubit(this.repositories) : super(UpdatedInitial());
  final Repositories repositories;
  bool _value = true;

  bool get value => _value;
  updateValue(bool newValue) {
    _value = newValue;
    emit(UpdatedValue());
  }

   bool _toggle = true;
  dynamic get toggle => _toggle;
  updateToggle() {
    _toggle = !_toggle;
    emit(TogleUpdate());
  }


  bool _isError = false;
  String? _errorMessage;

  bool get isError => _isError;
  String get errorMessage => _errorMessage??'';

  setErrorMessage(bool isError, String value) {
    _isError = isError;
    _errorMessage = value;
    emit(UpdatedValue());
  }

  bool _isFocused = false;

  bool get isFocused => _isFocused;

  set isFocused(bool value) {
    _isFocused = value;
    emit(UpdatedValue());
  }
}
  