import 'package:petstop/base/stateful.dart';
import 'package:petstop/domain/model/account.dart';
import 'package:petstop/redux/action/account.dart';
import 'package:petstop/redux/action/stateful.dart';
import 'package:petstop/service/response.dart';
import 'package:redux/redux.dart';
import 'package:petstop/redux/appstate.dart';
import 'package:petstop/base/viewmodel/viewmodel.dart';

class LoginViewModel extends ViewModel {
  LoginViewModel(Store<AppState> store) : super(store);

  Stream<ServiceResponse<Account>> onFetchAccount() {
    return executeRequest<Account>(services.accountService.getAccount);
  }

  Stream<ServiceResponse<Account>> onSignInWithGoogle() {
    return executeRequest<Account>(services.accountService.signInWithGoogle);
  }

  set accountState(ValueState state) => store.dispatch(UpdateStatefulAction(state, store.state.account));
  ValueState get accountState => store.state.account.state;

  set account(Account account) => store.dispatch(StoreAccountAction(account));
  Account get account => store.state.account.data;
}