import 'package:flutterRedux/domain/model/session.dart';
import 'package:flutterRedux/redux/middleware/account.dart';
import 'package:flutterRedux/service/response.dart';
import 'package:redux/redux.dart';
import 'package:flutterRedux/redux/appstate.dart';
import 'package:flutterRedux/base/viewmodel/viewmodel.dart';

class LoginViewModel extends ViewModel {
  LoginViewModel(Store<AppState> store) : super(store);

  Stream<ServiceResponse<Session>> onRequestLogin(String username, String password) {
    var stream = executeRequest<Session>(services.accountService.login).asBroadcastStream();
    store.dispatch(LoginAction(username, password, stream));
    return stream;
  }

  loading() {
    return false;
  }
}