import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:nba/action.dart';
import 'package:nba/model.dart';
import 'package:nba/state.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      StoreConnector<AppState, _ViewModel>(
        onInit: (store) {
          store.dispatch(LoadTeamsAction());
        },
        converter: (Store<AppState> store) => _ViewModel.create(store),
        builder: (BuildContext context, _ViewModel viewModel) =>
            Scaffold(
              appBar: AppBar(
                title: Text(viewModel.pageTitle),
              ),
              body: ListView(
                  children: viewModel.items
                      .map((_TeamViewModel item) => _createWidget(item))
                      .toList()),
            ),
      );

  Widget _createWidget(_TeamViewModel item) =>
      Card(
        child: ListTile(
          leading: Image.network(item.imageUrl, width: 50, height: 50),
          title: Text(item.title),
        ),
      );
}

class _ViewModel {
  final String pageTitle;
  final List<_TeamViewModel> items;

  _ViewModel(this.pageTitle, this.items);

  factory _ViewModel.create(Store<AppState> store) {
    List<_TeamViewModel> items = store.state.teams
        .map((Team item) =>
        _TeamViewModel(item.name, item.badgeImageUrl,
                () => store.dispatch(NavigateToTeamDetailAction(item))))
        .toList();

    return _ViewModel(
      'NBA teams',
      items,
    );
  }
}

@immutable
class _TeamViewModel {
  final String title;
  final String imageUrl;
  final Function() onClickItem;

  _TeamViewModel(this.title, this.imageUrl, this.onClickItem);
}
