import 'package:get_it/get_it.dart';
import 'package:spa_booking_app/features/location_permission/data/location_repository_impl.dart';
import 'package:spa_booking_app/features/location_permission/domain/use_cases/request_location_permission.dart';
import 'package:spa_booking_app/features/location_permission/presentation/bloc/location_permission_bloc.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // repo
  getIt.registerLazySingleton<LocationRepository>(() => LocationRepositoryImpl());

  // Register use case
  getIt.registerLazySingleton(() => RequestLocationPermission(getIt()));

  // Register BLoC
  getIt.registerFactory(() => LocationPermissionBloc(
        requestLocationPermissionUseCase: getIt(),
      ));
}
