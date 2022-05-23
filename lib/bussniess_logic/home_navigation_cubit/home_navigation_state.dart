part of 'home_navigation_cubit.dart';

@immutable
abstract class HomeNavigationState {
  final HomeTabs tab;

  const HomeNavigationState(this.tab);
}


class HomeNavigationInitial extends HomeNavigationState {
  const HomeNavigationInitial() : super(HomeTabs.home);
}

class HomeNavigationChanged extends HomeNavigationState {
  const HomeNavigationChanged(HomeTabs tab) : super(tab);
}
