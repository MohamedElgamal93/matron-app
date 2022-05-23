part of 'send_location_cubit.dart';

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationSuccess extends LocationState {
  final LocationResponse locationResponse;
  final BuildContext context;

  LocationSuccess(this.locationResponse, this.context) {
    // sendn Location
  }
}

class LoginError extends LocationState {
  final LoginErrorResponse loginError;

  LoginError(this.loginError);
}

class LocationLoading extends LocationState {
  final bool isLoading;

  LocationLoading(this.isLoading);
}
