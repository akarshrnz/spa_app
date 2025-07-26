part of 'location_permission_bloc.dart';

abstract class LocationPermissionEvent {
  const LocationPermissionEvent();
}

class RequestLocationPermissionEvent extends LocationPermissionEvent {
  const RequestLocationPermissionEvent();
}