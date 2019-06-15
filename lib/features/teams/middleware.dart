import 'package:nba/app/state.dart';
import 'package:nba/features/teams/model.dart';
import 'package:nba/network/NBAService.dart';
import 'package:redux/redux.dart';

import 'action.dart';

class LoadTeamsMiddleware extends TypedMiddleware<AppState, LoadTeamsAction> {
  LoadTeamsMiddleware() : super(TypedMiddleware(_fetchTeams));
}

Future _fetchTeams(
    Store<AppState> store, LoadTeamsAction action, NextDispatcher next) async {
  var teamResponse = await getAllTeams();
  var teams = teamResponse.data
      .map((item) => Team(item.fullName, item.teamBadge))
      .toList();
  next(LoadTeamsSuccessAction(teams));
}
