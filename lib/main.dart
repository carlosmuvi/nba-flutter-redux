import 'package:flutter/material.dart';
import 'package:nba/middleware.dart';
import 'package:nba/pages/page_home.dart';
import 'package:nba/state.dart';
import 'package:nba/reducer.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() => runApp(NBAApp());

class NBAApp extends StatelessWidget {
  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: createStoreMiddleware(),
  );

  @override
  Widget build(BuildContext context) => StoreProvider(
        store: this.store,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage(),
        ),
      );
}
