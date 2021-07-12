import 'package:weatherapp/src/models/location.dart';

class GetLocation {
  const GetLocation();

  @override
  String toString() {
    return 'GetLocation{}';
  }
}

class GetLocationSuccessful {
  GetLocationSuccessful(this.location);

  final Location location;

  @override
  String toString() {
    return 'GetLocationSuccessful{location: $location}';
  }
}

class GetLocationError {
  GetLocationError(this.error);

  final Object error;

  @override
  String toString() {
    return 'GetLocationError{error: $error}';
  }
}
