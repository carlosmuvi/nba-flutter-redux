import 'package:nba/features/teams/middleware.dart';
import 'package:nba/app/state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createStoreMiddleware() => [LoadTeamsMiddleware()];
