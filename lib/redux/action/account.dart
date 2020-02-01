import 'package:flutterRedux/base/stateful.dart';
import 'package:flutterRedux/domain/model/account.dart';
import 'package:flutterRedux/redux/action/stateful.dart';

class StoreAccountAction {
  Account account;
  StoreAccountAction(this.account);
}

Stateful<Account> accountReducer(Stateful<Account> prev, action) {
  if (action is UpdateStatefulAction && action.object == prev) {
    return prev.copy(state: action.state);
  }

  if (action is StoreAccountAction) {
    return prev.copy(data: action.account);
  }

  return prev;
}