import 'package:flutter/material.dart';
import 'package:petstop/base/stateful.dart';
import 'package:petstop/domain/model/account.dart';
import 'package:petstop/domain/model/config.dart';
import 'package:petstop/domain/model/pet.dart';
import 'package:petstop/domain/model/session.dart';
import 'package:petstop/redux/action/account.dart';
import 'package:petstop/redux/action/add_pet.dart';
import 'package:petstop/redux/action/config.dart';
import 'package:petstop/redux/action/pets.dart';
import 'package:petstop/redux/middleware/requestlogging.dart';
import 'package:redux/redux.dart';
import 'package:petstop/redux/action/tab_navigation.dart';

import 'action/session.dart';

class AppState {
  final Stateful<Account> account;
  final Stateful<List<Pet>> pets;
  final Stateful<Session> session;
  final Config config;
  final int currentTab;

  // Add Pet Screen
  final Pet petToAdd;

  AppState({
    @required this.account,
    @required this.pets,
    @required this.session,
    @required this.config,
    @required this.currentTab,
    @required this.petToAdd,
  });

  AppState.initialState() :
        account = Stateful(data: Account()),
        pets = Stateful(data: List()),
        session = Stateful(data: Session()),
        config = Config(),
        currentTab = 0,
        petToAdd = Pet();
}

// Reducers
AppState appStateReducer(AppState state, action) {
  return AppState(
    account: accountReducer(state.account, action),
    pets: petsReducer(state.pets, action),
    session: sessionReducer(state.session, action),
    config:  configReducer(state.config, action),
    currentTab: tabNavigationReducer(state.currentTab, action),
    petToAdd: addPetReducer(state.petToAdd, action)
  );
}

// Middleware
List<Function(Store<AppState> store, dynamic, NextDispatcher)> appStateMiddleware() {
  return [
    requestLoggingMiddleware
  ];
}
