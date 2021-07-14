import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:http/http.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:weatherapp/src/actions/get_location.dart';
import 'package:weatherapp/src/data/weather_api.dart';
import 'package:weatherapp/src/middleware/middleware.dart';
import 'package:weatherapp/src/models/app_state.dart';
import 'package:weatherapp/src/presentation/home_page';
import 'package:weatherapp/src/reducer/reducer.dart';
import 'package:weatherapp/src/data/location_api.dart';
import 'package:weatherapp/src/models/weather.dart';

void main() {
  final Client client = Client();
  const String apiUrl = 'https://ip-api.com/json/?fields=61439';
  final LocationApi locationApi = LocationApi(apiUrl: apiUrl, client: client);
  final WeatherApi weatherApi = WeatherApi(client: client);
  final AppMiddleware middleware = AppMiddleware(locationApi: locationApi, weatherApi: weatherApi);

  final AppState initialState = AppState();
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: initialState,
    middleware: middleware.middleware,
  );
  store.dispatch(GetLocation());
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.store}) : super(key: key);
  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
