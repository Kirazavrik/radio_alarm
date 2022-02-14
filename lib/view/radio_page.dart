import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_alarm/data/cubits/radio_cubit.dart';
import 'package:radio_alarm/data/radio_repository.dart';
import 'package:radio_alarm/models/station.dart';

class RadioPage extends StatelessWidget {
  const RadioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio'),
      ),
      body: BlocProvider(
        create: (_) => RadioCubit(repository: context.read<RadioRepository>())
          ..fetchStations(context),
        child: RadioView(),
      ),
    );
  }
}

class RadioView extends StatelessWidget {
  RadioView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioCubit, RadioState>(builder: (context, state) {
      final stations = state.stations;
      switch (state.status) {
        case RadioStatus.failure:
          return const Center(child: Text('Oops something went wrong!'));
        case RadioStatus.success:
          return stationsListView(context, stations);
        case RadioStatus.playing:
          return stationsListView(context, stations);
        case RadioStatus.paused:
          return stationsListView(context, stations);
        default:
          return const Center(
            child: CircularProgressIndicator(),
          );
      }
    });
  }

  Widget stationsListView(BuildContext context, List<Station> stations) {
    return ListView.builder(
        itemCount: stations.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Text(stations[index].name),
              ElevatedButton(
                  onPressed: () {
                    if (stations[index].playing == true) {
                      context.read<RadioCubit>().pauseStation(stations[index]);
                      stations[index].playing = false;
                    } else {
                      context.read<RadioCubit>().playStation(stations[index]);
                      stations[index].playing = true;
                    }
                  },
                  child: Text('Play')),
            ],
          );
        });
  }
}
