import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/src/container/is_loading_container.dart';
import 'package:weatherapp/src/container/location_container.dart';
import 'package:weatherapp/src/container/weather_container.dart';
import 'package:weatherapp/src/models/location.dart';
import 'package:weatherapp/src/models/weather.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('weather'),
      ),
      body: IsLoadingContainer(
        builder: (BuildContext context, bool isLoading) {
          if (isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return LocationContainer(
            builder: (BuildContext context, Location? location) {
              return WeatherContainer(builder: (BuildContext context, Weather? weather) {
                return Column(
                  children: <Widget>[
                    if (location != null) Text('Location: ${location.city}'),
                  ],
                );
              });
            },
          );
        },
      ),
    );
  }
}
