import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:radio_alarm/data/audio_player.dart';
import 'package:radio_alarm/data/radio_repository.dart';
import 'package:radio_alarm/models/station.dart';

part 'radio_state.dart';

class RadioCubit extends Cubit<RadioState> {
  final RadioRepository repository;
  final Player _player;

  RadioCubit({required this.repository})
      : _player = Player(),
        super(const RadioState.loading());

  Future<void> fetchStations(BuildContext context) async {
    Locale myLocale = Localizations.localeOf(context);
    print(myLocale.countryCode);
    try {
      final stations = await repository
          .getStationsByCountry(myLocale.countryCode ?? myLocale.languageCode);
      emit(RadioState.success(stations));
    } on Exception {
      emit(const RadioState.failure());
    }
  }

  void playStation(String url) {
    _player.playStation(url);
    emit(const RadioState.playing());
  }
}
