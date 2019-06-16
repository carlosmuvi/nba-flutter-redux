import 'package:nba/features/teams/middleware.dart';
import 'package:nba/app/state.dart';
import 'package:nba/navigation/middleware.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createStoreMiddleware() => []
  ..add(LoadTeamsMiddleware())
  ..addAll(createNavigationMiddleware());
