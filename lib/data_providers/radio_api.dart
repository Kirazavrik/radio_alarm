import 'dart:convert';

import 'package:radio_alarm/models/station.dart';
import 'package:http/http.dart' as http;

class RadioApi {
  static const _baseUrl ='https://nl1.api.radio-browser.info';

  Future<Stations> fetchStationByCountry(String countryCode) async {
    final response = await http.get(Uri.parse(
        '$_baseUrl/json/stations/bycountrycodeexact/$countryCode?order=clickcount'));

    if (response.statusCode == 200) {
      return Stations.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Fail Load Stations');
    }
  }
}
