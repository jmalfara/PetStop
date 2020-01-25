import 'package:flutterRedux/base/extensions/streamextensions.dart';
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
      Stream<ServiceResponse<Session>> streamRequest
      ) : super(streamRequest);
}

// Middleware
void accountServiceMiddleware(Store<AppState> store, action, NextDispatcher next) async {
  if (action is LoginAction) {
    action.streamRequest.singleObserve(
      success: (data) => print("Success: $data"),
      failure: (error) => print("Failure: $error"),
      loading: () => print("Loading")
    );
  }

  next(action);
}