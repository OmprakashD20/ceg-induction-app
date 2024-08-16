part of 'user_bloc.dart';

sealed class UserEvent {}

//auth event
class UserLogin extends UserEvent {
  final String username;
  final String password;

  UserLogin({required this.username, required this.password});
}

//fetching JSON events
class FetchUserJson extends UserEvent {
  final String rollNo;

  FetchUserJson({required this.rollNo});
}

class FetchScheduleJson extends UserEvent {
  final String batchId;

  FetchScheduleJson({required this.batchId});
}

class FetchPlacesJson extends UserEvent {}

class FetchEventsJson extends UserEvent {}

class FetchNotificationsJson extends UserEvent {}

class FetchFAQJson extends UserEvent {}
