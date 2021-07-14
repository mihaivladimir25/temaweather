import 'package:redux/redux.dart';
import 'package:weatherapp/src/actions/get_location.dart';
import 'package:weatherapp/src/data/location_api.dart';
import 'package:weatherapp/src/data/weather_api.dart';
import 'package:weatherapp/src/models/app_state.dart';
import 'package:weatherapp/src/models/location.dart';
import 'package:weatherapp/src/models/weather.dart';

class AppMiddleware{
  const AppMiddleware({required LocationApi locationApi})
      : _locationApi = locationApi,
        _weatherApi = weatherApi;

  final LocationApi _locationApi;
  final WeatherApi _weatherApi;

  List<Middleware<AppState>> get middleware{
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, GetLocation>(_getLocation),
      TypedMiddleware<AppState, GetLocationSuccessful>(_getLocationSuccessful),
    ];
  }

  Future<void> _getLocation(Store<AppState> store, GetLocation action, NextDispatcher next) async {
    next(action);

    try{
      final Location location = await _locationApi.getLocation();
      store.dispatch(GetLocationSuccessful(location));
    } catch(error) {
      store.dispatch(GetLocationError(error));
    }
  }
}

  Future<void> _getLocationSuccessful(Store<AppState> store, GetLocation action, NextDispatcher next) async {
  next(action);

  try{
    final Weather weather = await _weatherApi.getWeather();
    store.dispatch(GetWeatherSuccessful(location));
  } catch(error) {
    store.dispatch(GetWeatherError(error));
  }
}
}
