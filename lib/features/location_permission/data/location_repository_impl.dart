import 'package:dartz/dartz.dart';
import 'package:location/location.dart';
import 'package:spa_booking_app/features/location_permission/domain/use_cases/request_location_permission.dart';


class LocationRepositoryImpl implements LocationRepository {
  final Location location = Location();

  @override
  Future<Either<Exception, bool>> requestPermission() async {
    try {
      bool serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return Left(Exception('Location service is disabled'));
        }
      }

      var permission = await location.hasPermission();
      if (permission == PermissionStatus.denied) {
        permission = await location.requestPermission();
        if (permission != PermissionStatus.granted) {
          return const Right(false);
        }
      }

      return const Right(true);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}