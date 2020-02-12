import 'package:flutter/material.dart';
import 'package:petstop/ui/initialization/initialization_controller.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:petstop/redux/appstate.dart';

import 'initialization_viewmodel.dart';
import 'package:petstop/base/extensions/streamextensions.dart';

class InitializationEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: StoreConnector<AppState, InitializationViewModel>(
                distinct: true,
                onInitialBuild: (viewModel) => viewModel.onInitialize().singleObserve(
                      success: (data) => controlHandleInitializationSuccess(viewModel, context, data),
                ),
                converter: (Store<AppState> store) => InitializationViewModel(store),
                builder: (BuildContext context, InitializationViewModel viewModel) =>
                    FlatButton(
                      onPressed: () => viewModel.onInitialize().singleObserve(
                          success: (data) => controlHandleInitializationSuccess(
                              viewModel, context, data)),
                      child: CircularProgressIndicator()
                    )
            )
        )
    );
  }
}
