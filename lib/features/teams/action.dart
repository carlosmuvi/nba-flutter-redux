import 'package:nba/features/teams/model.dart';

class LoadTeamsAction {}

class LoadTeamsSuccessAction {
  final List<Team> items;

  LoadTeamsSuccessAction(this.items);
}
