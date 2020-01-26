import 'package:flutter/material.dart';
import 'package:flutterRedux/ui/initialization/initialization_controller.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutterRedux/redux/appstate.dart';

import 'initialization_viewmodel.dart';
import 'package:flutterRedux/base/extensions/streamextensions.dart';

class InitializationEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: _InnerComponent()
      )
    );
  }
}

class _InnerComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, InitializationViewModel>(
        onInitialBuild: (viewModel) {
          viewModel.onFetchConfig().singleObserve(
            success: (data) => controlHandleFetchConfigSuccess(viewModel, context, data)
          );
        },
        converter: (Store<AppState> store) => InitializationViewModel(store),
        builder: (BuildContext context, InitializationViewModel viewModel) => CircularProgressIndicator()
    );
  }
}
