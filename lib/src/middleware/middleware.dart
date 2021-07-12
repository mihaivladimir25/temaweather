import 'package:redux/redux.dart';
import 'package:weatherapp/src/actions/get_location.dart';
import 'package:weatherapp/src/data/location_api.dart';
import 'package:weatherapp/src/models/app_state.dart';
import 'package:weatherapp/src/models/location.dart';

class AppMiddleware{
  const AppMiddleware({required LocationApi locationApi}) : _locationApi = locationApi;

  final LocationApi _locationApi;

  List<Middleware<AppState>> get middleware{
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, GetLocation>(_getLocation),
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