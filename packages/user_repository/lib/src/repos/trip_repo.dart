import 'package:user_repository/src/models/trip.dart';
import 'package:user_repository/src/models/model.dart';

abstract class TripRepo {
  List<Trip> get getTrips;

  // Future<Map> updateUser(Map<String, dynamic> user);
}
