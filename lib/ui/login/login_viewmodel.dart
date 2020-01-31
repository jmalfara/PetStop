import 'package:flutterRedux/domain/model/account.dart';
import 'package:flutterRedux/domain/model/session.dart';
import 'package:flutterRedux/redux/action/session.dart';
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

  Stream<ServiceResponse<Account>> onFetchAccount() {
    return executeRequest<Account>(services.accountService.getAccount);
  }

  set loading(bool loading) => store.dispatch(LoadingSessionAction(loading));
  bool get loading => store.state.session.loading == true;

  set session(Session session) => store.dispatch(StoreSessionAction(session));
  Session get session => store.state.session;
}