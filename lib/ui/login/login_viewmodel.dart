import 'package:flutterRedux/domain/model/session.dart';
import 'package:flutterRedux/redux/action/account.dart';
import 'package:flutterRedux/service/response.dart';
import 'package:redux/redux.dart';
import 'package:flutterRedux/redux/appstate.dart';
import 'package:flutterRedux/base/viewmodel/viewmodel.dart';

class LoginViewModel extends ViewModel {
  LoginViewModel(Store<AppState> store) : super(store);

  Stream<ServiceResponse<Session>> onRequestLogin(String username, String password) {
    return executeRequest<Session>(services.accountService.login);
  }

  set loading(bool loading) => store.dispatch(LoadingAccountAction(loading));
  bool get loading => store.state.account.loading;

  set session(Session session) => store.dispatch(StoreSessionAccountAction(session));
  Session get session => store.state.account.session;
}