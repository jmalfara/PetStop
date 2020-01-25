import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutterRedux/redux/appstate.dart';
import 'package:flutterRedux/ui/login/login_viewmodel.dart';

class LoginEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginViewModel>(
        converter: (Store<AppState> store) => LoginViewModel(store),
        builder: (BuildContext context, LoginViewModel viewModel) => Scaffold(
              body: Center(
                  child: viewModel.loading()
                      ? _renderLoading()
                      : _renderLogin(viewModel)),
            ));
  }

  _renderLoading() {
    return CircularProgressIndicator();
  }

  _renderLogin(LoginViewModel viewModel) {
    return FlatButton(
      onPressed: () => viewModel.onRequestLogin("username", "password"),
      child: Text("Start Login"),
    );
  }
}
