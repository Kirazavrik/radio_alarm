import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:radio_alarm/data/radio_repository.dart';
import 'package:radio_alarm/models/station.dart';

part 'radio_state.dart';

class RadioCubit extends Cubit<RadioState> {
  final RadioRepository repository;

  RadioCubit({required this.repository}) : super(const RadioState.loading());

  Future<void> fetchStations(BuildContext context) async {

    Locale myLocale = Localizations.localeOf(context);
    print(myLocale.countryCode);
    try {
      final stations = await repository.getStationsByCountry(myLocale.countryCode!);
      emit(RadioState.success(stations));
    } on Exception {
      emit(const RadioState.failure());
    }
  }
}
