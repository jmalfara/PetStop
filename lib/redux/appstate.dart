import 'package:flutter/material.dart';
import 'package:flutterRedux/domain/model/account.dart';
import 'package:flutterRedux/domain/model/config.dart';
import 'package:flutterRedux/domain/model/session.dart';
import 'package:flutterRedux/redux/action/account.dart';
import 'package:flutterRedux/redux/action/config.dart';
import 'package:flutterRedux/redux/middleware/requestlogging.dart';
import 'package:redux/redux.dart';
import 'package:flutterRedux/redux/action/tab_navigation.dart';

import 'action/session.dart';

class AppState {
  final Account account;
  final Session session;
  final Config config;
  final int currentTab;

  AppState({
    @required this.account,
    @required this.session,
    @required this.config,
    @required this.currentTab,
  });

  AppState.initialState() :
        account = Account(),
        session = Session(),
        config = Config(),
        currentTab = 0;
}

// Reducers
AppState appStateReducer(AppState state, action) {
  return AppState(
    account: accountReducer(state.account, action),
    session: sessionReducer(state.session, action),
    config:  configReducer(state.config, action),
    currentTab: tabNavigationReducer(state.currentTab, action)
  );
}

// Middleware
List<Function(Store<AppState> store, dynamic, NextDispatcher)> appStateMiddleware() {
  return [
    requestLoggingMiddleware
  ];
}
