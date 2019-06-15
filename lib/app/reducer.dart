import 'package:nba/features/teams/reducer.dart';
import 'package:nba/app/state.dart';

AppState appReducer(AppState state, action) => AppState(
      teamsReducer(state.teamsState, action),
    );
