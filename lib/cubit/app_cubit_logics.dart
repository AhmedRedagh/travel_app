import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/Pages/welcome_page.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';

class AppCubitLogicState extends StatefulWidget {
  const AppCubitLogicState({super.key});

  @override
  State<AppCubitLogicState> createState() => _AppCubitLogicStateState();
}

class _AppCubitLogicStateState extends State<AppCubitLogicState> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        if (state is WelcomeState) {
          return const WelcomePage();
        } else {
          return Container();
        }
      },
    );
  }
}
