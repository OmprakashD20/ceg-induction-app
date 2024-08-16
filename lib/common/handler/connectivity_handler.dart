import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:induction_app/bloc/connectivity/connectivity_bloc.dart';

class ConnectivityHandler extends StatelessWidget {
  final Widget successWidget;

  const ConnectivityHandler({
    super.key,
    required this.successWidget,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, state) {
        if (state is ConnectivityInitial) {
          return const Center(child: Text('Checking connectivity...'));
        } else if (state is ConnectivitySuccess) {
          return successWidget;
        } else if (state is ConnectivityFailure) {
          return const Center(child: Text('No Internet Connection'));
        }
        return Container();
      },
    );
  }
}
