import 'package:nba/features/home/reducer.dart';
import 'package:nba/features/teams/reducer.dart';
import 'package:nba/app/state.dart';
import 'package:nba/navigation/reducer.dart';

AppState appReducer(AppState state, action) => AppState(
    homeReducer(state.homeState, action),
    teamsReducer(state.teamsState, action),
    navigationReducer(state.route, action));
