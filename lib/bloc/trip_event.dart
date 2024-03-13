part of 'trip_bloc.dart';

@immutable
sealed class TripEvent {}

class InitialEvent extends TripEvent {}

class FetchTrips extends TripEvent {}

class BookTrip extends TripEvent {
  final Map bookData;

  BookTrip({required this.bookData});
}
