import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_alarm/app.dart';
import 'package:radio_alarm/data/cubits/bloc_observer.dart';
import 'package:radio_alarm/data/radio_repository.dart';

void main() {
  BlocOverrides.runZoned(
      () {
        runApp(RadioAlarmApp(radioRepository: RadioRepository()));
      },
    blocObserver: CubitObserver()
  );
}
