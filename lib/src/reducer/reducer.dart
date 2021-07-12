import 'package:redux/redux.dart';
import 'package:weatherapp/src/actions/get_location.dart';
import 'package:weatherapp/src/models/app_state.dart';

Reducer<AppState> reducer = combineReducers(<Reducer<AppState>>[
  (AppState state, dynamic action) {
  print(action);
  return state;
  },
  TypedReducer<AppState, GetLocationSuccessful>(_getLocationSuccessful),
]);

AppState _getLocationSuccessful(AppState state, GetLocationSuccessful action) {
  return state.rebuild(() => (b)) {
    b.location = action.location.toBuilder();
  }
}