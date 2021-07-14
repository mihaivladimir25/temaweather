library weather;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'weather.g.dart';

abstract class Weather implements Built<Weather, WeatherBuilder> {
  factory Weather([void Function(WeatherBuilder b) updates]) = _$Weather;
  factory Weather.fromJson(dynamic json) => serializers.deserializeWith(serializer, json) as Weather;

  Weather._();


  Map<String, dynamic> get json => serializers.serializeWith(serializer, this) as Map<String, dynamic>;

  static Serializer<Weather> get serializer => _$weatherSerializer;
}