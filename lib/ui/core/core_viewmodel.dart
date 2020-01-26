import 'package:flutterRedux/base/viewmodel/viewmodel.dart';
import 'package:flutterRedux/domain/model/config.dart';
import 'package:redux/redux.dart';
import 'package:flutterRedux/redux/appstate.dart';
import 'package:flutterRedux/redux/action/tab_navigation.dart';

class CoreViewModel extends ViewModel {
  CoreViewModel(Store<AppState> store) : super(store);

  set currentTab(int currentTabIndex) => store.dispatch(NavigateToTabAction(currentTabIndex));
  int get currentTab => store.state.currentTab;

  Config get config => store.state.config;
}