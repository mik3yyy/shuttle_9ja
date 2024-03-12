import 'package:user_repository/src/models/bus.dart';
import 'package:user_repository/src/models/transco.dart';

class Trip {
  final String id;
  final Transco transco;
  final List<Bus> buses;
  final double price;
  final DateTime departureTime;
  final DateTime arrivalTime;
  final String tripType;
  final DateTime createdAt;
  final DateTime updatedAt;

  final List<double> startPointCoordinates;
  final List<double> endPointCoordinates;

  Trip({
    required this.id,
    required this.transco,
    required this.buses,
    required this.price,
    required this.departureTime,
    required this.arrivalTime,
    required this.tripType,
    required this.createdAt,
    required this.updatedAt,
    required this.startPointCoordinates,
    required this.endPointCoordinates,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      id: json['_id'],
      transco: Transco.fromJson(json['transco_id']),
      buses: (json['buses'] as List)
          .map((busJson) => Bus.fromJson(busJson))
          .toList(),
      price: json['price'].toDouble(),
      departureTime: DateTime.parse(json['departure_time']),
      arrivalTime: DateTime.parse(json['arrival_time']),
      tripType: json['trip_type'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      startPointCoordinates:
          List<double>.from(json['start_point']['coordinates']),
      endPointCoordinates: List<double>.from(json['end_point']['coordinates']),
    );
  }
  @override
  String toString() {
    return 'Trip{id: $id, transco: $transco, buses: $buses, price: $price, departureTime: $departureTime, arrivalTime: $arrivalTime, tripType: $tripType, createdAt: $createdAt, updatedAt: $updatedAt, startPointCoordinates: $startPointCoordinates, endPointCoordinates: $endPointCoordinates}';
  }
}
