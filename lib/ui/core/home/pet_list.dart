import 'package:flutter/cupertino.dart';
import 'package:flutterRedux/base/component/RightImageCard.dart';
import 'package:flutterRedux/redux/appstate.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../core_viewmodel.dart';

class PetList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CoreViewModel>(
        converter: (Store<AppState> store) => CoreViewModel(store),
        builder: (BuildContext context, CoreViewModel viewModel) => ListView.builder(
          itemCount: viewModel.account.pets.length,
          itemBuilder: (BuildContext context, position) {
            var item = viewModel.account.pets[position];
            return RightImageCard(
              title: item.name,
              content: item.birthday,
              image: "asdfadfa",
            );
          },
        )
    );
  }
}