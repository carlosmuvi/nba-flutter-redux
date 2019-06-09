import 'dart:async';

import 'package:nba/action.dart';
import 'package:nba/model.dart';
import 'package:nba/network/NBAService.dart';
import 'package:nba/state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createStoreMiddleware() => [
      TypedMiddleware<AppState, LoadTeamsAction>(_fetchTeams),
    ];

Future _fetchTeams(
    Store<AppState> store, LoadTeamsAction action, NextDispatcher next) async {
  var teamResponse = await getAllTeams();
  var teams = teamResponse.data.map((item) => Team(item.fullName)).toList();
  next(LoadTeamsSuccessAction(teams));
}
