import 'package:nba/action.dart';
import 'package:nba/model.dart';
import 'package:nba/state.dart';
import 'package:redux/redux.dart';

AppState appReducer(AppState state, action) => AppState(
    teamListReducer(state.teams, action),
);

final Reducer<AppState> homePageReducer = combineReducers([
]);

final Reducer<List<Team>> teamListReducer = combineReducers([
  TypedReducer<List<Team>, LoadTeamsSuccessAction>(_addTeams),
]);

List<Team> _addTeams(List<Team> teams, LoadTeamsSuccessAction action)  => List.unmodifiable(List.from(action.items));
