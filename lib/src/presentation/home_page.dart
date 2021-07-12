import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:weatherapp/src/actions/get_location.dart';
import 'package:weatherapp/src/container/is_loading_container.dart';
import 'package:weatherapp/src/container/location_container.dart';
import 'package:weatherapp/src/models/app_state.dart';
import 'package:weatherapp/src/models/location.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {}
