part of 'book_cubit.dart';

@immutable
sealed class BookState {}

final class BookInitial extends BookState {}

final class Loading extends BookState {}

final class BookingsLoading extends BookState {}

final class BookingsError extends BookState {
  final String message;
  BookingsError({required this.message});
}

final class Bookings extends BookState {
  final List<Booking> bookings;
  Bookings({required this.bookings});
}

final class Error extends BookState {
  final String message;
  Error({required this.message});
}

final class BookSuccess extends BookState {
  final String message;

  BookSuccess({required this.message});
}
