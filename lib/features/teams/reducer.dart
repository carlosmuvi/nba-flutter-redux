import 'package:nba/features/teams/action.dart';
import 'package:nba/features/teams/state.dart';
import 'package:redux/redux.dart';

final Reducer<TeamsState> teamsReducer = combineReducers([
  TypedReducer<TeamsState, LoadTeamsSuccessAction>(_addTeams),
]);

TeamsState _addTeams(TeamsState state, LoadTeamsSuccessAction action) =>
    TeamsState(List.unmodifiable(List.from(action.items)));
