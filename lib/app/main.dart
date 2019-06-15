import 'package:flutter/material.dart';
import 'package:nba/app/middleware.dart';
import 'package:nba/features/teams/page.dart';
import 'package:nba/app/state.dart';
import 'package:nba/app/reducer.dart';
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
          home: TeamsPage(),
        ),
      );
}
