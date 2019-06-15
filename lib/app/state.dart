import 'package:nba/features/teams/state.dart';

class AppState {
  final TeamsState teamsState;

  AppState(this.teamsState);

  factory AppState.initial() => AppState(TeamsState.initial());
}
