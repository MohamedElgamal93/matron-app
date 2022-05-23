part of 'onboard_cubit.dart';

@immutable
abstract class OnboardState {}

class OnboardInitial extends OnboardState {}

class OnboardLoaded extends OnboardState {
  final OnBoardResponse? onboard;
  final bool? isFirstFetch;

  OnboardLoaded(this.onboard, {this.isFirstFetch = false});
}

class SettingsLoaded extends OnboardState {
  final SettingsModel? settingsModel;

  SettingsLoaded(this.settingsModel);
}

class OnboardLoading extends OnboardState {
  final bool isLoading;
  OnboardLoading(this.isLoading);
}

class OnboardError extends OnboardState {
  OnboardError();
}

class SettingError extends OnboardState {
  final ErrorModel errorModel;

  SettingError(this.errorModel);
}
