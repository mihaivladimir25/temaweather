import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:weatherapp/src/models/app_state.dart';
import 'package:weatherapp/src/models/location.dart';

 class MoviesContainer extends StatelessWidget {
   const MoviesContainer({Key? key, required this.builder}) : super(key: key);

   final ViewModelBuilder<List<Location>> builder;

   @override
   Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Location>>(
      converter: (Store<AppState> store) => store.state.location.toList(),
      builder: builder,
    );
   }
 }