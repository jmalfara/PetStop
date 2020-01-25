import 'package:flutterRedux/domain/model/account.dart';
import 'package:flutterRedux/domain/model/session.dart';

class StoreSessionAccountAction {
  Session session;
  StoreSessionAccountAction(this.session);
}

class LoadingAccountAction {
  bool loading;
  LoadingAccountAction(this.loading);
}

Account accountReducer(Account prev, action) {
  if (action is StoreSessionAccountAction) {
    return prev.copy(
      session: action.session
    );
  }

  if (action is LoadingAccountAction) {
    return prev.copy(
      loading: action.loading
    );
  }

  return prev;
}