import 'package:nba/features/home/state.dart';
import 'package:nba/features/teams/state.dart';
import 'package:nba/navigation/routes.dart';

class AppState {
  final HomeState homeState;
  final TeamsState teamsState;
  final List<String> route;

  AppState(this.homeState, this.teamsState, this.route);

  factory AppState.initial() => AppState(
      HomeState.initial(),
      TeamsState.initial(),
      List.unmodifiable([AppRoutes.home])
  );
}
