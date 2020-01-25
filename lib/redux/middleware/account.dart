import 'package:flutter/material.dart';
import 'package:flutterRedux/domain/model/session.dart';
import 'package:flutterRedux/service/response.dart';
import 'package:redux/redux.dart';

import '../appstate.dart';
import 'RequestAction.dart';

class LoginAction extends RequestAction<Session> {
  final String username;
  final String password;

  LoginAction(
      this.username,
      this.password,
      Future<ServiceResponse<Session>> Function() executeRequest
      ) : super(executeRequest);
}

// Middleware
void accountServiceMiddleware(Store<AppState> store, action, NextDispatcher next) async {
  if (action is LoginAction) {
    print("Running Login Action");
    var response = await action.executeRequest();
    print(response.state);
  }

  next(action);
}
