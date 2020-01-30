import 'package:flutterRedux/base/viewmodel/viewmodel.dart';
import 'package:flutterRedux/domain/model/account.dart';
import 'package:flutterRedux/service/response.dart';
import 'package:redux/redux.dart';
import 'package:flutterRedux/redux/appstate.dart';
import 'package:flutterRedux/redux/action/tab_navigation.dart';

class CoreViewModel extends ViewModel {
  CoreViewModel(Store<AppState> store) : super(store);

  Stream<ServiceResponse<Account>> onFetchAccountRequest() {
    return executeRequest(services.accountService.getAccount);
  }

  set currentTab(int currentTabIndex) => store.dispatch(NavigateToTabAction(currentTabIndex));
  int get currentTab => store.state.currentTab;

  String get config => store.state.config.latestVersion;

  Account get account => store.state.account;
}