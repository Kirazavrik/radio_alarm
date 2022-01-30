import 'package:flutter/material.dart';
import 'package:radio_alarm/app.dart';
import 'package:radio_alarm/data/radio_repository.dart';

void main() {
  runApp(RadioAlarmApp(radioRepository: RadioRepository()));
}
