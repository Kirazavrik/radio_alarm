import 'package:equatable/equatable.dart';

class Station extends Equatable {
  final String stationUuid;
  final String name;
  final String url;
  final String favicon;

  const Station(
      {required this.name,
      required this.stationUuid,
      required this.favicon,
      required this.url});

  @override
  List<Object?> get props => [stationUuid, name, url, favicon];

  factory Station.fromJson(Map<String, dynamic> json) {
    return Station(
        name: json['name'],
        stationUuid: json['changeuuid'],
        favicon: json['favicon'],
        url: json['url_resolved']);
  }
}

class Stations {
  final List<Station> stations;

  Stations({required this.stations});

  factory Stations.fromJson(List<dynamic> json) {
    List<Station> stations = <Station>[];
    stations = json.map((e) => Station.fromJson(e)).toList();

    return Stations(stations: stations);
  }
}
