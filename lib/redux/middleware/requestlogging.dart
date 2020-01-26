import 'package:flutterRedux/base/extensions/streamextensions.dart';
import 'package:flutterRedux/service/response.dart';
import 'package:redux/redux.dart';

import '../appstate.dart';

class RequestAction<T> {
  Stream<ServiceResponse<T>> streamRequest;
  RequestAction(this.streamRequest);
}

// Middleware
void requestLoggingMiddleware(Store<AppState> store, action, NextDispatcher next) async {
  if (action is RequestAction) {
//    action.streamRequest.singleObserve(
//      success: (data) => print("Middleware Success: $data"),
//      failure: (error) => print("Middleware Failure: $error"),
//      loading: () => print("Middleware Loading")
//    );
  }

  next(action);
}