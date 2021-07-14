import 'package:weatherapp/src/models/weather.dart';
import 'package:weatherapp/src/models/weather.dart.dart';

class GetWeather {
  final double lat;
  final double lon;

  const GetWeather(this.lat, this.lon);

  @override
  String toString() {
    return 'GetWeather{}';
  }
}

class GetWeatherSuccessful {
  GetWeatherSuccessful(this.weather);

  final Weather weather;

  @override
  String toString() {
    return 'GetWeatherSuccessful{weather: $weather}';
  }
}

class GetWeatherError {
  GetWeatherError(this.error);

  final Object error;

  @override
  String toString() {
    return 'GetWeatherError{error: $error}';
  }
}
