import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:induction_app/bloc/connectivity/connectivity_bloc.dart';
import 'package:induction_app/common/widgets/loader.dart';
import 'package:induction_app/utils/strings.dart';

class ConnectivityHandler extends StatelessWidget {
  final Widget successWidget;

  const ConnectivityHandler({
    super.key,
    required this.successWidget,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, state) {if (state is ConnectivitySuccess) {
          return successWidget;
        } else if (state is ConnectivityFailure) {
          return const ILoaderScreen(content: Constants.noInternetLoader);
        }
        return Container();
      },
    );
  }
}
