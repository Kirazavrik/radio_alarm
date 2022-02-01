import 'package:radio_alarm/data_providers/radio_api.dart';
import 'package:radio_alarm/models/station.dart';

class RadioRepository {
  final RadioApi _radioApi;

  RadioRepository({RadioApi? radioApi})
      : _radioApi = radioApi ?? RadioApi();

  Future<List<Station>> getStationsByCountry(String countryCode) async{
    final stations = await _radioApi.fetchStationByCountry(countryCode);
    List<Station> reversedStations = stations.stations.reversed.toList();
    return reversedStations;
  }
}
