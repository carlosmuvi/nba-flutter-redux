import 'dart:async';

import 'package:nba/action.dart';
import 'package:nba/model.dart';
import 'package:nba/state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createStoreMiddleware() =>
    [
      TypedMiddleware<AppState, LoadTeamsAction>(_fetchTeams),
    ];

Future _fetchTeams(Store<AppState> store,
    LoadTeamsAction action,
    NextDispatcher next) async {
  next(
      LoadTeamsSuccessAction(
        List.unmodifiable(
            [
              Team("Toronto Raptors"),
              Team("Golden State Warriors")
            ]

        ),
      )
  );
}