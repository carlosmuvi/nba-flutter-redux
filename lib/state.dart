import 'package:nba/model.dart';

class AppState {
  final List<Team> teams;

  AppState(this.teams);

  factory AppState.initial() => AppState(List.unmodifiable([]));
}
