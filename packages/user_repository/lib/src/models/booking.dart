import 'dart:convert';

import 'package:user_repository/src/models/trip.dart';
import 'package:user_repository/user_repository.dart';

class Booking {
  final String id;
  final Transco transco;
  final Bus bus;
  final Trip route;
  final User user;
  final bool hasPaid;
  final int noOfSeatsBooked;
  final DateTime tripStartDate;
  final DateTime tripReturnDate;
  final DateTime createdAt;
  final DateTime updatedAt;

  Booking({
    required this.id,
    required this.transco,
    required this.bus,
    required this.route,
    required this.user,
    required this.hasPaid,
    required this.noOfSeatsBooked,
    required this.tripStartDate,
    required this.tripReturnDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: json["_id"],
        transco: Transco.fromJson(json["transco_id"]),
        bus: Bus.fromJson(json["bus_id"]),
        route: Trip.fromJson(json["route_id"]),
        user: User.fromJson(json["user_id"]),
        hasPaid: json["has_paid"],
        noOfSeatsBooked: json["no_of_seats_booked"],
        tripStartDate: DateTime.parse(json["trip_start_date"]),
        tripReturnDate: DateTime.parse(json["trip_return_date"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "_id": id,
  //       "transco_id": transcoId,
  //       "bus_id": busId,
  //       "route_id": route.toJson(),
  //       "user_id": userId,
  //       "has_paid": hasPaid,
  //       "no_of_seats_booked": noOfSeatsBooked,
  //       "trip_start_date": tripStartDate.toIso8601String(),
  //       "trip_return_date": tripReturnDate.toIso8601String(),
  //       "createdAt": createdAt.toIso8601String(),
  //       "updatedAt": updatedAt.toIso8601String(),
  //     };
}
