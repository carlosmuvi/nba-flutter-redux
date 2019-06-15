import 'package:nba/features/teams/model.dart';

class TeamsState {
  final List<Team> teams;

  TeamsState(this.teams);

  factory TeamsState.initial() => TeamsState(List.unmodifiable([]));
}
