import 'package:flutter/material.dart';
import 'package:flutterRedux/redux/middleware/account.dart';
import 'package:redux/redux.dart';
import 'package:flutterRedux/redux/action/tab_navigation.dart';

class AppState {
  final int currentTab;

  AppState({
    @required this.currentTab,
  });

  AppState.initialState() :
        currentTab = 0;
}

// Reducers
AppState appStateReducer(AppState state, action) {
  return AppState(
      currentTab: tabNavigationReducer(state.currentTab, action),
  );
}

// Middleware
List<Function(Store<AppState> store, dynamic, NextDispatcher)> appStateMiddleware() {
  return [
    accountServiceMiddleware
  ];
}
