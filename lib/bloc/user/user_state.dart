part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {
  const UserInitial();

  @override
  List<Object> get props => [];
}

final class UserLoading extends UserState {
  const UserLoading();

  @override
  List<Object> get props => [];
}

final class UserLoaded extends UserState {
  final UserModel user;
  const UserLoaded(this.user);

  @override
  List<Object> get props => [user];
}

final class UserError extends UserState {
  final String message;
  const UserError(this.message);

  @override
  List<Object> get props => [message];
}

//JSON loaded states
class ScheduleLoaded extends UserState {
  final String batchId;
  final ScheduleModel schedule;

  const ScheduleLoaded({
    required this.schedule,
    required this.batchId,
  });

  @override
  List<Object> get props => [schedule, batchId];
}

class PlacesLoaded extends UserState {
  final List<PlaceModel> places;

  const PlacesLoaded({
    required this.places,
  });

  @override
  List<Object> get props => [places];
}

class EventsLoaded extends UserState {
  final List<EventModel> events;

  const EventsLoaded({
    required this.events,
  });

  @override
  List<Object> get props => [events];
}

class NotificationsLoaded extends UserState {
  final List<NotificationModel> notifications;

  const NotificationsLoaded({
    required this.notifications,
  });

  @override
  List<Object> get props => [notifications];
}

class FAQLoaded extends UserState {
  final List<FAQModel> faqs;

  const FAQLoaded({
    required this.faqs,
  });

  @override
  List<Object> get props => [faqs];
}
