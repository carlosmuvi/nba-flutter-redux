import 'package:flutter/material.dart';
import 'package:nba/app/middleware.dart';
import 'package:nba/features/home/page.dart';
import 'package:nba/app/state.dart';
import 'package:nba/app/reducer.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nba/features/teams/page.dart';
import 'package:nba/navigation/routeObserver.dart';
import 'package:nba/navigation/routes.dart';
import 'package:redux/redux.dart';

void main() => runApp(NBAApp());

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class NBAApp extends StatelessWidget {
  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: createStoreMiddleware(),
  );

  MaterialPageRoute _getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MainRoute(HomePage(), settings: settings);
      case AppRoutes.teams:
        return MainRoute(TeamsPage(), settings: settings);
      default:
        return MainRoute(HomePage(), settings: settings);
    }
  }

  @override
  Widget build(BuildContext context) => StoreProvider(
        store: this.store,
        child: MaterialApp(
          navigatorKey: navigatorKey,
          navigatorObservers: [routeObserver],
          title: 'Flutter Demo',
          theme: ThemeData(primarySwatch: Colors.blue),
          onGenerateRoute: (RouteSettings settings) => _getRoute(settings),
        ),
      );
}
