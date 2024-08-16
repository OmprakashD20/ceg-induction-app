part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  final UserModel user;
  final ScheduleModel? schedule;
  final List<PlaceModel>? places;
  final List<EventModel>? events;
  final List<NotificationModel>? notifications;
  final List<FAQModel>? faqs;

  const UserState({
    required this.user,
    this.schedule,
    this.places,
    this.events,
    this.notifications,
    this.faqs,
  });

  @override
  List<Object?> get props =>
      [user, schedule, places, events, notifications, faqs];
}

final class UserInitial extends UserState {
  UserInitial() : super(user: UserModel.empty());

  @override
  List<Object?> get props => [user];
}

final class UserLoading extends UserState {
  UserLoading() : super(user: UserModel.empty());

  @override
  List<Object?> get props => [user];
}

final class UserLoaded extends UserState {
  const UserLoaded(
    UserModel user, {
    super.schedule,
    super.places,
    super.events,
    super.notifications,
    super.faqs,
  }) : super(
          user: user,
        );

  @override
  List<Object?> get props =>
      [user, schedule, places, events, notifications, faqs];
}

final class UserError extends UserState {
  final String message;
  UserError(this.message) : super(user: UserModel.empty());

  @override
  List<Object?> get props => [user, message];
}
