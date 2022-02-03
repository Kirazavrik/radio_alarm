part of 'radio_cubit.dart';

enum RadioStatus { loading, success, failure, playing, paused }

class RadioState extends Equatable {
  final RadioStatus status;
  final List<Station> stations;

  const RadioState({this.status = RadioStatus.loading, List<Station>? stations})
      : stations = stations ?? const <Station>[];

  RadioState copyWith({RadioStatus? status, List<Station>? stations}) {
    return RadioState(
        status: status ?? this.status, stations: stations ?? this.stations);
  }

  @override
  List<Object?> get props => [status, stations];
}
