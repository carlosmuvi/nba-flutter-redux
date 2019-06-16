import 'package:nba/features/home/state.dart';
import 'package:nba/features/teams/state.dart';

class AppState {
  final HomeState homeState;
  final TeamsState teamsState;

  AppState(this.homeState, this.teamsState);

  factory AppState.initial() => AppState(HomeState.initial(), TeamsState.initial());
}
