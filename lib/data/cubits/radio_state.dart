part of 'radio_cubit.dart';

enum RadioStatus { loading, success, failure }

class RadioState extends Equatable {
  final RadioStatus status;
  final List<Station> stations;

  const RadioState._(
      {this.status = RadioStatus.loading, this.stations = const <Station>[]});

  const RadioState.loading() : this._();

  const RadioState.success(List<Station> stations) :
      this._(status: RadioStatus.success, stations: stations);

  const RadioState.failure() : this._(status: RadioStatus.failure);

  @override
  List<Object?> get props => [status, stations];
}
