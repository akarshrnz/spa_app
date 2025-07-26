import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/use_cases/request_location_permission.dart';

part 'location_permission_event.dart';
part 'location_permission_state.dart';

class LocationPermissionBloc
    extends Bloc<LocationPermissionEvent, LocationPermissionState> {
  final RequestLocationPermission requestLocationPermissionUseCase;

  LocationPermissionBloc({required this.requestLocationPermissionUseCase})
      : super(LocationPermissionInitial()) {
    on<RequestLocationPermissionEvent>(_onRequestLocationPermission);
  }

  FutureOr<void> _onRequestLocationPermission(
    RequestLocationPermissionEvent event,
    Emitter<LocationPermissionState> emit,
  ) async {
    emit(LocationPermissionLoading());
    final result = await requestLocationPermissionUseCase();
    result.fold(
      (failure) => emit(LocationPermissionFailure(failure.toString())),
      (status) {
        if (status) {
          emit(LocationPermissionGranted());
        } else {
          emit(LocationPermissionDenied());
        }
      },
    );
  }
}