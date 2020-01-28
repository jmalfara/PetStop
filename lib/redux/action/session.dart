import 'package:flutterRedux/domain/model/session.dart';

class StoreSessionAction {
  Session session;
  StoreSessionAction(this.session);
}

class LoadingSessionAction {
  bool loading;
  LoadingSessionAction(this.loading);
}


Session sessionReducer(Session prev, action) {
  if (action is StoreSessionAction) {
    return action.session;
  }

  if (action is LoadingSessionAction) {
    return prev.copy(
        loading: action.loading
    );
  }

  return prev;
}