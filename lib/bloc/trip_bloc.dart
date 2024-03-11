import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:user_repository/src/repos/repos.dart';
import 'package:user_repository/src/models/model.dart';

part 'trip_event.dart';
part 'trip_state.dart';

var fakeStream =
    Stream<int>.periodic(const Duration(seconds: 1), (x) => x).take(15);

class TripBloc extends Bloc<TripEvent, TripState> {
  TripRepoImp tripRepoImp;
  TripBloc({required this.tripRepoImp}) : super(TripInitial()) {
    on<TripEvent>((event, emit) {});
  }
}
