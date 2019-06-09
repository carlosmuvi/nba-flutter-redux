import 'package:nba/action.dart';
import 'package:nba/model.dart';
import 'package:nba/state.dart';
import 'package:redux/redux.dart';

AppState appReducer(AppState state, action) => AppState(
    teamListReducer(state.teams, action),
);

final Reducer<List<Team>> teamListReducer = combineReducers([
  TypedReducer<List<Team>, NavigateToTeamDetailAction>(_navigateToTeamDetail),
]);

List<Team> _navigateToTeamDetail(List<Team> toDos, NavigateToTeamDetailAction action) => List.unmodifiable(List.from(toDos)..add(action.item));
