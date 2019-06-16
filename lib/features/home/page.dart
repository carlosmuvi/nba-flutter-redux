import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:nba/features/teams/action.dart';
import 'package:nba/app/state.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoreConnector<AppState, _ViewModel>(
        onInit: (store) {
          store.dispatch(LoadTeamsAction());
        },
        converter: (Store<AppState> store) => _ViewModel.create(store),
        builder: (BuildContext context, _ViewModel viewModel) => Scaffold(
              appBar: AppBar(
                title: Text(viewModel.pageTitle),
              ),
              body: Column(
                  children: viewModel.buttons
                      .map((_ButtonViewModel item) => _createWidget(item))
                      .toList()),
            ),
      );

  Widget _createWidget(_ButtonViewModel item) =>
      RaisedButton(child: Text(item.title), onPressed: item.onClickItem);
}

@immutable
class _ViewModel {
  final String pageTitle;
  final List<_ButtonViewModel> buttons;

  _ViewModel(this.pageTitle, this.buttons);

  factory _ViewModel.create(Store<AppState> store) =>
      _ViewModel("Home", [_ButtonViewModel("Teams", () => {})]);
}

@immutable
class _ButtonViewModel {
  final String title;
  final Function() onClickItem;

  _ButtonViewModel(this.title, this.onClickItem);
}
