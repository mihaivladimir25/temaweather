import 'dart:convert';
import 'package:http/http.dart';
import 'package:weatherapp/src/models/weather.dart';

class WeatherApi {
  const WeatherApi({required String apiUrl, required Client client}) : _client = client;

  final Client _client;

  Future<Weather> getWeather(double lat, double lon) async {
    String key = '7f56c7a2258f20caf0fc0e01a221e0f2';
    String api = 'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=hourly,daily&appid=$key';
    final Response response = await _client.get(Uri.parse(api));
    if (response.statusCode >= 300) {
      throw StateError(response.body);
    }
    return Weather.fromJson(jsonDecode(response.body));
  }
}
