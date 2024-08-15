import "dart:async";

import "package:flutter_bloc/flutter_bloc.dart";
import "package:connectivity_plus/connectivity_plus.dart";
import "package:equatable/equatable.dart";

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  ConnectivityBloc() : super(ConnectivityInitial()) {
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      final isConnected = !result.contains(ConnectivityResult.none);
      add(ConnectivityChanged(isConnected));
    });

    on<ConnectivityChanged>((event, emit) {
      if (event.isConnected) {
        emit(ConnectivitySuccess(event.isConnected));
      } else {
        emit(ConnectivityFailure());
      }
    });
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
