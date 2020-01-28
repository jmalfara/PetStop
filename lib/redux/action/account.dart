import 'package:flutterRedux/domain/model/account.dart';

class LoadingAccountAction {
  bool loading;
  LoadingAccountAction(this.loading);
}

Account accountReducer(Account prev, action) {
  if (action is LoadingAccountAction) {
    return prev.copy(
      loading: action.loading
    );
  }

  return prev;
}