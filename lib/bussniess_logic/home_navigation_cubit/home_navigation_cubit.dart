import 'package:environment/presentation/screens/home/tabs_enum.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_navigation_state.dart';

class HomeNavigationCubit extends Cubit<HomeNavigationState> {
  HomeNavigationCubit() : super(const HomeNavigationInitial());

  changeLandingTab(int index  ) {
    final tab = HomeTabs.values[index];
    emit(HomeNavigationChanged(tab));
  }

  changeLandingTabByName(HomeTabs tab) {
    emit(HomeNavigationChanged(tab));
  }
}
