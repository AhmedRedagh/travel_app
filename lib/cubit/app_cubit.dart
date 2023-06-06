import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/Shared/network/remote/dio_helper.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/models/data_file.dart';

class AppCubit extends Cubit<AppStates> {
  List<DataModel>? data;
  List<dynamic>? dataList;

  AppCubit() : super(AppInitialState()) {
    emit(LoadingState());

    DioHelper.getData(url: 'getplaces')
        .then((value) => {
              debugPrint(value.data),
              dataList = value.data,
              data = dataList!.map((e) => DataModel.fromjson(e)).toList(),
              emit(LoadedState())
            })
        .catchError((error) => {debugPrint(error.toString())});
    emit(WelcomeState());
  }
}
