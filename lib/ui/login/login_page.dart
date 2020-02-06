import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petstop/base/stateful.dart';
import 'package:petstop/ui/login/login_controller.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:petstop/redux/appstate.dart';
import 'package:petstop/ui/login/login_viewmodel.dart';
import 'package:petstop/base/extensions/streamextensions.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginViewModel>(
      onInitialBuild: (viewModel) => viewModel.onFetchAccount().singleObserve(
          success: (account) => controlHandleLoginSuccess(viewModel, context, account),
          failure: (error) => controlHandleLoginFailure(viewModel, context, error),
          loading: () => controlHandleLoginLoading(viewModel)
      ),
      converter: (Store<AppState> store) => LoginViewModel(store),
      builder: (BuildContext context, LoginViewModel viewModel) => Center(
          child: viewModel.accountState == ValueState.LOADING
              ? _renderLoading()
              : _renderLogin(context, viewModel)),
    );
  }

  _renderLoading() {
    return CircularProgressIndicator();
  }

  _renderLogin(BuildContext context, LoginViewModel viewModel) {
    return FlatButton(
      onPressed: () => viewModel
          .onSignInWithGoogle().singleObserve(
              success: (session) => controlHandleLoginSuccess(viewModel, context, session),
              failure: (error) => controlHandleLoginFailure(viewModel, context, error),
              loading: () => controlHandleLoginLoading(viewModel)),
      child: Text("SignIn With Google"),
    );
  }
}
