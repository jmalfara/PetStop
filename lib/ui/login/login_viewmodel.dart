import 'package:flutterRedux/domain/model/session.dart';
import 'package:flutterRedux/redux/middleware/account.dart';
import 'package:redux/redux.dart';
import 'package:flutterRedux/redux/appstate.dart';
import 'package:flutterRedux/base/viewmodel/viewmodel.dart';

class LoginViewModel extends ViewModel {
  LoginViewModel(Store<AppState> store) : super(store);

  onRequestLogin(String username, String password) async {
    var request = () => executeRequest<Session>(services.accountService.login);
    store.dispatch(LoginAction(username, password, request));
  }

  loading() {
    return false;
  }
}
