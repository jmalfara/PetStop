import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterRedux/base/stateful.dart';
import 'package:flutterRedux/ui/login/login_controller.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutterRedux/redux/appstate.dart';
import 'package:flutterRedux/ui/login/login_viewmodel.dart';
import 'package:flutterRedux/base/extensions/streamextensions.dart';

class LoginEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginViewModel>(
        converter: (Store<AppState> store) => LoginViewModel(store),
        builder: (BuildContext context, LoginViewModel viewModel) => Scaffold(
              body: Center(
                  child: _isLoading(viewModel)
                      ? _renderLoading()
                      : _renderLogin(context, viewModel)),
            ));
  }

  _renderLoading() {
    return CircularProgressIndicator();
  }

  _renderLogin(BuildContext context, LoginViewModel viewModel) {
    return FlatButton(
      onPressed: () => viewModel.onRequestLogin("username", "password").singleObserve(
        success: (session) {
          viewModel.onFetchAccountRequest().singleObserve(
              success: (account) => controlHandleAccountSuccess(viewModel, context, account),
              failure: (error) => controlHandleAccountFailure(viewModel, context, error),
              loading: () => controlHandleAccountLoading(viewModel)
          );
          controlHandleLoginSuccess(viewModel, context, session);
        },
        failure: (error) => controlHandleLoginFailure(viewModel, context, error),
        loading: () => controlHandleLoginLoading(viewModel)
      ),
      child: Text("Start Login"),
    );
  }

  bool _isLoading(LoginViewModel viewModel) {
    return viewModel.sessionState == ValueState.LOADING || viewModel.accountState == ValueState.LOADING;
  }
}
