import 'package:flutterRedux/base/stateful.dart';
import 'package:flutterRedux/domain/model/account.dart';
import 'package:flutterRedux/domain/model/session.dart';
import 'package:flutterRedux/redux/action/account.dart';
import 'package:flutterRedux/redux/action/session.dart';
import 'package:flutterRedux/redux/action/stateful.dart';
import 'package:flutterRedux/service/response.dart';
import 'package:redux/redux.dart';
import 'package:flutterRedux/redux/appstate.dart';
import 'package:flutterRedux/base/viewmodel/viewmodel.dart';

class LoginViewModel extends ViewModel {
  LoginViewModel(Store<AppState> store) : super(store);

  Stream<ServiceResponse<Session>> request;

  Stream<ServiceResponse<Session>> onRequestLogin(String username, String password) {
    return executeRequest<Session>(services.accountService.login);
  }

  set sessionState(ValueState state) => store.dispatch(UpdateStatefulAction(state, store.state.session));
  ValueState get sessionState => store.state.session.state;

  set session(Session session) => store.dispatch(StoreSessionAction(session));
  Session get session => store.state.session.data;


  Stream<ServiceResponse<Account>> onFetchAccountRequest() {
    return executeRequest(services.accountService.getAccount);
  }

  set accountState(ValueState state) => store.dispatch(UpdateStatefulAction(state, store.state.account));
  ValueState get accountState => store.state.account.state;

  set account(Account account) => store.dispatch(StoreAccountAction(account));
  Account get account => store.state.account.data;
}