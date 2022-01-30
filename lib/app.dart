import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:radio_alarm/data/radio_repository.dart';
import 'package:radio_alarm/view/radio_page.dart';

class RadioAlarmApp extends StatelessWidget {
  final RadioRepository _radioRepository;

  const RadioAlarmApp({Key? key, required RadioRepository radioRepository})
      : _radioRepository = radioRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _radioRepository,
      child: const RadioAlarmAppView(),
    );
  }
}

class RadioAlarmAppView extends StatelessWidget {
  const RadioAlarmAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RadioPage(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''),
        Locale('ru' ''),
      ],
    );
  }
}
