import 'package:flutterRedux/domain/model/account.dart';
import 'package:flutterRedux/domain/model/session.dart';

class StoreSessionAccountAction {
  Session session;
  StoreSessionAccountAction(session);
}


Account accountReducer(Account prev, action) {
  if (action is StoreSessionAccountAction) {
    return prev.copy(
      session: action.session
    );
  }

  return prev;
}