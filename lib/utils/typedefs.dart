import 'package:fpdart/fpdart.dart';

import "errors.dart";

typedef FutureEither<T> = Future<Either<Failure, T>>;

typedef FutureVoid = FutureEither<void>;

enum JsonLists {
  Users('users', 'users.json'),
  Schedule('schedule', 'schedule.json'),
  Places('places', 'places.json'),
  Faqs('faqs', 'faqs.json'),
  Notifications('notifications', 'notifications.json'),
  Events('events', 'programDetails.json');

  final String name;
  final String url;

  const JsonLists(this.name, this.url);
}

enum RecencyLabel {
  Today('Today'),
  Yesterday('Yesterday'),
  Old('Old');

  final String label;
  const RecencyLabel(this.label);
}

enum JsonObjects {
  user,
  schedule,
  places,
  events,
  notifications,
  faqs,
}
