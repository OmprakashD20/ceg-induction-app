part of 'user_bloc.dart';

sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserLoaded extends UserState {
  final UserModel user;
  UserLoaded(this.user);
}

final class UserError extends UserState {
  final String message;
  UserError(this.message);
}

//JSON loaded states
class ScheduleLoaded extends UserState {
  final String batchId;
  final ScheduleModel schedule;

  ScheduleLoaded({
    required this.schedule,
    required this.batchId,
  });
}

class PlacesLoaded extends UserState {
  final List<PlaceModel> places;

  PlacesLoaded({
    required this.places,
  });
}

class EventsLoaded extends UserState {
  final List<EventModel> events;

  EventsLoaded({
    required this.events,
  });
}

class NotificationsLoaded extends UserState {
  final List<NotificationModel> notifications;

  NotificationsLoaded({
    required this.notifications,
  });
}

class FAQLoaded extends UserState {
  final List<FAQModel> faqs;

  FAQLoaded({
    required this.faqs,
  });
}
