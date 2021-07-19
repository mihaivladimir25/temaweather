import 'package:weatherapp/src/models/weather.dart';
import 'package:weatherapp/src/models/weather.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weatherapp/src/models/index.dart';

@@freezed
class GetWeather with _$GetWeather implements AppAction {
  const factory GetWeather() = GetWeatherStart;

  const factory GetWeather.successful() = GetWeatherSuccessful;

  @Implements(ErrorAction)
  const factory GetWeather.error(Object error, StackTrace stackTrace) = GetWeatherError;
}
