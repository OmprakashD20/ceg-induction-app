import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:induction_app/repository/user_repository.dart";

import "../../models/models.dart";
import "../../utils/typedefs.dart";

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc({UserRepository? userRepository})
      : _userRepository = userRepository ?? UserRepository(),
        super(UserInitial()) {
    on<UserLogin>(_onUserLogin);
    on<FetchUserJson>(_onFetchUserJson);
    on<FetchData>(_onFetchData);
  }

  void _onUserLogin(UserLogin event, Emitter<UserState> emit) {
    String rollNo = event.username;
    String password = event.password;

    emit(UserLoading());

    if (rollNo.isEmpty) {
      return emit(UserError("Roll number cannot be empty"));
    }

    _userRepository.fetchUser(rollNo: rollNo).then((user) {
      if (user.dob != password || user.rollNo != rollNo) {
        emit(UserError("Invalid credentials"));
        return;
      }

      emit(UserLoaded(user));
    }).catchError((e) {
      emit(UserError(e.toString()));
    });
  }

  void _onFetchUserJson(FetchUserJson event, Emitter<UserState> emit) {
    String rollNo = event.rollNo;

    emit(UserLoading());

    if (rollNo.isEmpty) {
      return emit(UserError("Roll number cannot be empty"));
    }

    _userRepository.fetchUser(rollNo: rollNo).then((user) {
      emit(UserLoaded(user));
    }).catchError((e) {
      emit(UserError(e.toString()));
    });
  }

  Future<void> _onFetchData(FetchData event, Emitter<UserState> emit) async {
    emit(UserLoading());

    final List<Future<dynamic>> futures = [];

    Future<UserModel?>? userFuture;
    ScheduleModel? schedule;
    List<PlaceModel>? places;
    List<EventModel>? events;
    List<NotificationModel>? notifications;
    List<FAQModel>? faqs;

    // if (event.jsonObjects.contains(JsonObjects.user) &&
    //     event.rollNo.isNotEmpty) {
    //   userFuture = _userRepository.fetchUser(rollNo: event.rollNo);
    //   futures.add(userFuture);
    // }
    if (event.jsonObjects.contains(JsonObjects.schedule)) {
      futures.add(
          _userRepository.fetchSchedule().then((value) => schedule = value));
    }
    if (event.jsonObjects.contains(JsonObjects.places)) {
      futures
          .add(_userRepository.fetchPlaces().then((value) => places = value));
    }
    if (event.jsonObjects.contains(JsonObjects.events)) {
      futures
          .add(_userRepository.fetchEvents().then((value) => events = value));
    }
    if (event.jsonObjects.contains(JsonObjects.notifications)) {
      futures.add(_userRepository.fetchNotifications().then((value) {
        notifications = NotificationModel.processNotifications(value);
      }));
    }
    if (event.jsonObjects.contains(JsonObjects.faqs)) {
      futures.add(_userRepository.fetchFAQs().then((value) => faqs = value));
    }

    try {
      await Future.wait(futures);
      final user = userFuture != null ? await userFuture : state.user;

      if (!emit.isDone) {
        emit(UserLoaded(
          user!,
          schedule: schedule,
          places: places,
          events: events,
          notifications: notifications,
          faqs: faqs,
        ));
      }
    } catch (e) {
      if (!emit.isDone) {
        print(e);
        emit(UserError(e.toString()));
      }
    }
  }
}
