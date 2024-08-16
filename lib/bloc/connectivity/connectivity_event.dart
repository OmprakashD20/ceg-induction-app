part of 'connectivity_bloc.dart';

sealed class ConnectivityEvent extends Equatable {
  const ConnectivityEvent();

  @override
  List<Object> get props => [];
}

class ConnectivityChanged extends ConnectivityEvent {
  final bool isConnected;

  const ConnectivityChanged(this.isConnected);

  @override
  List<Object> get props => [isConnected];
}