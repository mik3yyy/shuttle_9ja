part of 'trip_bloc.dart';

@immutable
sealed class TripState {}

final class TripInitial extends TripState {}

final class Trips extends TripState {
  final List<Trip> todays_trip;
  final List<Trip> tomorrow_trips;
  final List<Trip> later_trips;
  Trips(
      {required this.todays_trip,
      required this.later_trips,
      required this.tomorrow_trips});
}

final class Loading extends TripState {}

final class AuthError extends TripState {
  final String message;
  AuthError({required this.message});
}

final class BookLoading extends TripState {}
