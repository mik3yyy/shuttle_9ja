import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shuttle_9ja/services/hive_function.dart';
import 'package:user_repository/src/repos/repos.dart';
import 'package:user_repository/src/models/model.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  TripRepoImp tripRepoImp;
  BookCubit({required this.tripRepoImp}) : super(BookInitial());

  void bookTrip(Map<String, dynamic> data) async {
    try {
      emit(Loading());

      Map<String, dynamic> res =
          await tripRepoImp.bookTrip(data, HiveFunction.getToken());
      print(res);
      if (res['success']) {
        emit(BookSuccess(message: res['message']));
        Future.delayed(Duration(milliseconds: 500), () {
          emit(BookInitial());
        });
      } else {
        emit(Error(message: res['message']));
      }
      // if(res['success'])
    } catch (e) {
      print(e.toString());
      emit(Error(message: "Something went wrong"));
    }
  }

  void getTrips() async {
    emit(BookingsLoading());
    await Future.delayed(Duration(milliseconds: 500), () {});
    Map<String, dynamic> res =
        await tripRepoImp.getBookings(HiveFunction.getToken());
    print(res);
    if (res['success']) {
      List<Booking> bookings = [];
      for (var booking in res['data']) {
        bookings.add(Booking.fromJson(booking));
      }

      // emit(Trips(trips: )));
      // await Future.delayed(Duration(milliseconds: 400), () {
      emit(Bookings(bookings: bookings.reversed.toList()));
      // });T
    } else {
      if (res['errors'] is List) {
        emit(BookingsError(message: res['errors'][0]));
      } else {
        emit(BookingsError(message: res['message']));
      }
      await Future.delayed(Duration(milliseconds: 400), () {
        if (state is Bookings) {
        } else {
          emit(BookInitial());
        }
      });
    }
  }
}
