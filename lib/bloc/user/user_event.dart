part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class UserLogin extends UserEvent {
  final String username;
  final String password;

  const UserLogin({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}

class FetchUserJson extends UserEvent {
  final String rollNo;

  const FetchUserJson({required this.rollNo});

  @override
  List<Object?> get props => [rollNo];
}

class FetchData extends UserEvent {
  final String rollNo;
  final List<JsonObjects> jsonObjects;

  const FetchData({
    this.rollNo = '',
    this.jsonObjects = JsonObjects.values,
  });
}
