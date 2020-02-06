import 'package:petstop/base/stateful.dart';
import 'package:petstop/domain/model/account.dart';
import 'package:petstop/domain/model/pet.dart';
import 'package:petstop/redux/action/stateful.dart';

class StoreAccountAction {
  final Account account;
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