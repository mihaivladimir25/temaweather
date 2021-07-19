import 'package:redux_epics/redux_epics.dart';
import 'package:weatherapp/src/actions/get_location.dart';
import 'package:weatherapp/src/actions/get_weather.dart';
import 'package:weatherapp/src/actions/index.dart';
import 'package:weatherapp/src/data/location_api.dart';
import 'package:weatherapp/src/data/weather_api.dart';
import 'package:weatherapp/src/models/app_state.dart';
import 'package:weatherapp/src/models/index.dart';
import 'package:weatherapp/src/rxdart/rxdart.dart';

class AppEpic {
  const AppEpic({required LocationApi locationApi, required WeatherApi weatherApi})
      : _locationApi = locationApi,
        _weatherApi = weatherApi;

  final LocationApi _locationApi;
  final WeatherApi _weatherApi;

  Epic<AppState> get middleware {
    return combineEpics<AppState>(<Epic<AppState>>[
      TypedEpic<AppState, GetLocation>(_getLocation),
      TypedEpic<AppState, GetWeather>(_getWeather),
    ]);
  }

  Stream<AppAction> _getLocation(Stream<GetLocation> actions, EpicStore<AppState> store) {
    return actions.asyncMap((GetLocation event) => _locationApi.getLocation()).expand((Location location) {
      return <AppAction>[
        GetLocation.successful(location),
        const GetWeather(),
      ];
    }).onErrorReturnWith((Object error, StackTrace stackTrace) => GetLocation.error(error, stackTrace));
  }

  Stream<AppAction> _getWeather(Stream<GetWeatherStart> actions, EpicStore<AppState> store) {
    return actions //
        .asyncMap((GetWeatherStart event) => _weatherApi.getWeather(store.state.location!))
        .map((OpenWeather weather) => GetWeather.successful(weather))
        .onErrorReturnWith((Object error, StackTrace stackTrace) => GetWeather.error(error, stackTrace));
  }
}
