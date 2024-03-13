import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shuttle_9ja/settings/dev_functions.dart';
import 'package:user_repository/src/repos/repos.dart';
import 'package:user_repository/src/models/model.dart';

part 'trip_event.dart';
part 'trip_state.dart';

var fakeStream =
    Stream<int>.periodic(const Duration(seconds: 1), (x) => x).take(15);

class TripBloc extends Bloc<TripEvent, TripState> {
  TripRepoImp tripRepoImp;
  TripBloc({required this.tripRepoImp}) : super(TripInitial()) {
    on<FetchTrips>(_fetchTrip);
  }

  _fetchTrip(FetchTrips event, Emitter emit) async {
    emit(Loading());
    Map<String, dynamic> res = await tripRepoImp.getTrips();
    if (res['success']) {
      List<Trip> trips = [];
      for (var trip in res['data']) {
        trips.add(Trip.fromJson(trip));
      }
      Map<String, List<Trip>> TRIPS = Dev.categorizeTrips(trips);
      // emit(Trips(trips: )));
      // await Future.delayed(Duration(milliseconds: 400), () {
      emit(
        Trips(
            todays_trip: TRIPS['tripsToday']!,
            tomorrow_trips: TRIPS['tripsTomorrow']!,
            later_trips: TRIPS['tripsLater']!),
      );
      // });T
    } else {
      if (res['errors'] is List) {
        emit(AuthError(message: res['errors'][0]));
      } else {
        emit(AuthError(message: res['message']));
      }
      await Future.delayed(Duration(milliseconds: 400), () {
        if (state is Trips) {
        } else {
          emit(TripInitial());
        }
      });
    }
  }
}
