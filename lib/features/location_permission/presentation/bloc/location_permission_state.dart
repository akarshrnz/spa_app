part of 'location_permission_bloc.dart';

abstract class LocationPermissionState {
  const LocationPermissionState();
}

class LocationPermissionInitial extends LocationPermissionState {}

class LocationPermissionLoading extends LocationPermissionState {}

class LocationPermissionGranted extends LocationPermissionState {}

class LocationPermissionDenied extends LocationPermissionState {}

class LocationPermissionFailure extends LocationPermissionState {
  final String error;

  const LocationPermissionFailure(this.error);
}