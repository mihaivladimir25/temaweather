import 'package:weatherapp/src/models/location.dart';
import 'package:weatherapp/src/models/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


@@freezed
class GetMovies with _$GetMovies implements AppAction {
  const factory GetMovies() = GetMoviesStart;

  const factory GetMovies.successful() = GetMoviesSuccessful;

  @Implements(ErrorAction)
  const factory GetMovies.error(Object error, StackTrace stackTrace) = GetMoviesError;
}
