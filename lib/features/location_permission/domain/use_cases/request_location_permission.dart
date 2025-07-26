import 'package:dartz/dartz.dart';

abstract class LocationRepository {
  Future<Either<Exception, bool>> requestPermission();
}

class RequestLocationPermission {
  final LocationRepository repository;

  RequestLocationPermission(this.repository);

  Future<Either<Exception, bool>> call() async {
    return await repository.requestPermission();
  }
}