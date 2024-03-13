import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:user_repository/user_repository.dart';

class TripsDataProvider {
  static Future<String> getTrips() async {
    try {
      final res = await http.get(
        Uri.parse(
          '${url}/transco/trips',
        ),
      );

      return res.body;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<String> getBookings(String token) async {
    try {
      final res = await http.get(
        Uri.parse(
          '${url}/user/bookings',
        ),
        headers: {
          'authorization': 'Bearer $token',
          'Content-Type': 'application/json'
        },
      );
      return res.body;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<String> bookTrip(
      Map<String, dynamic> data, String token) async {
    try {
      final res = await http.post(
        Uri.parse(
          '${url}/user/book/trip',
        ),
        headers: {
          'authorization': 'Bearer $token',
          'Content-Type': 'application/json'
        },
        body: jsonEncode(data),
      );
      print(res.body);
      return res.body;
    } catch (e) {
      throw e.toString();
    }
  }
}
