import 'package:flutter/cupertino.dart';
import 'package:flutterRedux/base/component/RightImageCard.dart';
import 'package:flutterRedux/base/component/message_card.dart';
import 'package:flutterRedux/redux/appstate.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../core_viewmodel.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CoreViewModel>(
      converter: (Store<AppState> store) => CoreViewModel(store),
      builder: (BuildContext context, CoreViewModel viewModel) => _renderPage(viewModel)
    );
  }

  _renderPage(CoreViewModel viewModel) {
    if (viewModel.account.pets.length == 0) {
      return _renderEmptyState();
    }

    return ListView.builder(
      itemCount: viewModel.account.pets.length,
      itemBuilder: (BuildContext context, int index) => RightImageCard(
        title: viewModel.account.pets[index].name,
        content: viewModel.account.pets[index].birthday,
        image: "",
      )
    );
  }

  _renderEmptyState() {
    return MessageCard();
  }
}