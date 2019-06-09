import 'package:nba/model.dart';

class LoadTeamsAction { }

class LoadTeamsSuccessAction {
  final List<Team> items;

  LoadTeamsSuccessAction(this.items);
}


class NavigateToTeamDetailAction {
  final Team item;

  NavigateToTeamDetailAction(this.item);
}