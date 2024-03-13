import 'dart:convert';

import 'package:user_repository/src/data_provider/trips_providers.dart';
import 'package:user_repository/src/models/trip.dart';
import 'package:user_repository/src/repos/trip_repo.dart';

class TripRepoImp extends TripRepo {
  @override
  Future<Map<String, dynamic>> getTrips() async {
    try {
      final res = await TripsDataProvider.getTrips();
      final response = jsonDecode(res);
      return response;
    } catch (e) {
      print(e.toString());
      return {'success': false, 'message': 'Check your network'};
    }
  }

  @override
  Future<Map<String, dynamic>> bookTrip(
      Map<String, dynamic> data, String token) async {
    try {
      final res = await TripsDataProvider.bookTrip(data, token);
      final response = jsonDecode(res);
      return response;
    } catch (e) {
      print(e.toString());
      return {'success': false, 'message': 'Check your network'};
    }
  }

  @override
  Future<Map<String, dynamic>> getBookings(String token) async {
    try {
      final res = await TripsDataProvider.getBookings(token);
      final response = jsonDecode(res);
      return response;
    } catch (e) {
      print(e.toString());
      return {'success': false, 'message': 'Check your network'};
    }
  }
}
