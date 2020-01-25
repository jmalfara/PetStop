import 'package:flutter/material.dart';
import 'package:flutterRedux/domain/model/account.dart';
import 'package:flutterRedux/redux/action/account.dart';
import 'package:flutterRedux/redux/middleware/account.dart';
import 'package:redux/redux.dart';
import 'package:flutterRedux/redux/action/tab_navigation.dart';

class AppState {
  final Account account;
  final int currentTab;

  AppState({
    @required this.account,
    @required this.currentTab,
  });

  AppState.initialState() :
        account = Account(),
        currentTab = 0;
}

// Reducers
AppState appStateReducer(AppState state, action) {
  return AppState(
    account: accountReducer(state.account, action),
    currentTab: tabNavigationReducer(state.currentTab, action),
  );
}

// Middleware
List<Function(Store<AppState> store, dynamic, NextDispatcher)> appStateMiddleware() {
  return [
    accountServiceMiddleware
  ];
}
