import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:induction_app/repository/user_repository.dart";

import "../../models/models.dart";

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc({UserRepository? userRepository})
      : _userRepository = userRepository ?? UserRepository(),
        super(const UserInitial()) {
    on<UserLogin>(_onUserLogin);
    on<FetchUserJson>(_onFetchUserJson);
    on<FetchScheduleJson>(_onFetchScheduleJson);
    on<FetchPlacesJson>(_onFetchPlacesJson);
    on<FetchNotificationsJson>(_onFetchNotificationsJson);
    on<FetchFAQJson>(_onFetchFAQJson);
    on<FetchEventsJson>(_onFetchEventsJson);
  }

  void _onUserLogin(UserLogin event, Emitter<UserState> emit) {
    String rollNo = event.username;
    String password = event.password;

    emit(const UserLoading());

    if (rollNo.isEmpty) {
      return emit(const UserError("Roll number cannot be empty"));
    }

    _userRepository.fetchUser(rollNo: rollNo).then((user) {
      if (user.dob != password || user.rollNo != rollNo) {
        emit(const UserError("Invalid credentials"));
        return;
      }

      emit(UserLoaded(user));
    }).catchError((e) {
      emit(UserError(e.toString()));
    });
  }

  void _onFetchUserJson(FetchUserJson event, Emitter<UserState> emit) {
    String rollNo = event.rollNo;

    emit(const UserLoading());

    if (rollNo.isEmpty) {
      return emit(const UserError("Roll number cannot be empty"));
    }

    _userRepository.fetchUser(rollNo: rollNo).then((user) {
      emit(UserLoaded(user));
    }).catchError((e) {
      emit(UserError(e.toString()));
    });
  }

  void _onFetchScheduleJson(FetchScheduleJson event, Emitter<UserState> emit) {
    final String batchId = event.batchId;
    emit(const UserLoading());

    _userRepository.fetchSchedule().then((schedule) {
      emit(ScheduleLoaded(batchId: batchId, schedule: schedule));
    }).catchError((e) {
      emit(UserError(e.toString()));
    });
  }

  void _onFetchPlacesJson(FetchPlacesJson event, Emitter<UserState> emit) {
    emit(const UserLoading());

    _userRepository.fetchPlaces().then((places) {
      emit(PlacesLoaded(places: places));
    }).catchError((e) {
      emit(UserError(e.toString()));
    });
  }

  void _onFetchNotificationsJson(
      FetchNotificationsJson event, Emitter<UserState> emit) {
    emit(const UserLoading());

    _userRepository.fetchNotifications().then((notifications) {
      emit(NotificationsLoaded(notifications: notifications));
    }).catchError((e) {
      emit(UserError(e.toString()));
    });
  }

  void _onFetchFAQJson(FetchFAQJson event, Emitter<UserState> emit) {
    emit(const UserLoading());

    _userRepository.fetchFAQs().then((faqs) {
      emit(FAQLoaded(faqs: faqs));
    }).catchError((e) {
      emit(UserError(e.toString()));
    });
  }

  void _onFetchEventsJson(FetchEventsJson event, Emitter<UserState> emit) {
    emit(const UserLoading());

    _userRepository.fetchEvents().then((events) {
      emit(EventsLoaded(events: events));
    }).catchError((e) {
      emit(UserError(e.toString()));
    });
  }
}
