part of 'trip_bloc.dart';

@immutable
sealed class TripEvent {}

class InitialEvent extends TripEvent {}

class FetchTrips extends TripEvent {}
