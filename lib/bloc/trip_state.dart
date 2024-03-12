part of 'trip_bloc.dart';

@immutable
sealed class TripState {}

final class TripInitial extends TripState {}

final class Trips extends TripState {
  final List<Trip> trips;

  Trips({required this.trips});
}

final class Loading extends TripState {}

final class AuthError extends TripState {
  final String message;
  AuthError({required this.message});
}
