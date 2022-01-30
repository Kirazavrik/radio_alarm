import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_alarm/data/cubits/radio_cubit.dart';
import 'package:radio_alarm/data/radio_repository.dart';

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
        child: const RadioView(),
      ),
    );
  }
}

class RadioView extends StatelessWidget {
  const RadioView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioCubit, RadioState>(builder: (context, state) {
      switch (state.status) {
        case RadioStatus.failure:
          return const Center(child: Text('Oops something went wrong!'));
        case RadioStatus.success:
          return Column(
            children: [
              Text(state.stations[5].name),
            ],
          );
        default: return const Center(child: CircularProgressIndicator(),);
      }
    });
  }
}
