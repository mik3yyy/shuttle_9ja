import 'package:user_repository/src/models/trip.dart';
import 'package:user_repository/src/models/model.dart';

abstract class TripRepo {
  Future<Map<String, dynamic>> getTrips();

  // Future<Map> updateUser(Map<String, dynamic> user);
}
