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
        super(const RadioState());

  Future<void> fetchStations(BuildContext context) async {
    Locale myLocale = Localizations.localeOf(context);
    print(myLocale.countryCode);
    print(myLocale.languageCode);
    try {
      final stations = await repository
          .getStationsByCountry(myLocale.countryCode ?? myLocale.languageCode);
      emit(state.copyWith(status: RadioStatus.success, stations: stations));
    } on Exception {
      emit(state.copyWith(status: RadioStatus.failure));
    }
  }

  void playStation(Station station) {
    _player.playStation(station.url);
    emit(state.copyWith(status: RadioStatus.playing));
  }

  void pauseStation(Station station) {
    _player.pauseStation();
    emit(state.copyWith(status: RadioStatus.paused));
  }
}
