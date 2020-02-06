import 'package:petstop/base/viewmodel/viewmodel.dart';
import 'package:petstop/domain/model/account.dart';
import 'package:petstop/service/response.dart';
import 'package:redux/redux.dart';
import 'package:petstop/redux/appstate.dart';
import 'package:petstop/redux/action/tab_navigation.dart';

class CoreViewModel extends ViewModel {
  CoreViewModel(Store<AppState> store) : super(store);

  Stream<ServiceResponse<Account>> onFetchAccountRequest() {
    return executeRequest(services.accountService.getAccount);
  }

  set currentTab(int currentTabIndex) => store.dispatch(NavigateToTabAction(currentTabIndex));
  int get currentTab => store.state.currentTab;

  String get config => store.state.config.latestVersion;

  Account get account => store.state.account.data;
}