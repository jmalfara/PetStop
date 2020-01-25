import 'package:redux/redux.dart';
import 'package:flutterRedux/redux/appstate.dart';
import 'package:flutterRedux/redux/action/tab_navigation.dart';

class CoreViewModel {
  final Function(int) onNavigateToTab;
  final int currentTabIndex;

  CoreViewModel({
    this.onNavigateToTab,
    this.currentTabIndex
  });

  factory CoreViewModel.create(Store<AppState> store) {
    _onNavigateToTab(index) {
      store.dispatch(NavigateToTabAction(index));
    }

    return CoreViewModel(
      currentTabIndex: store.state.currentTab,
      onNavigateToTab: _onNavigateToTab
    );
  }
}