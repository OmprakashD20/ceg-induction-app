part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class UserLogin extends UserEvent {
  final String username;
  final String password;
  final Function onLogin;

  const UserLogin({
    required this.username,
    required this.password,
    required this.onLogin,
  });

  @override
  List<Object?> get props => [username, password];
}

class FetchData extends UserEvent {
  final String rollNo;
  final List<JsonObjects> jsonObjects;
  final bool isInitialDataFetch;

  const FetchData({
    this.rollNo = "",
    this.jsonObjects = JsonObjects.values,
    this.isInitialDataFetch = false,
  });
}

class UserLogout extends UserEvent {}
