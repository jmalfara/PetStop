import 'dart:async';

import 'package:petstop/base/viewmodel/viewmodel.dart';
import 'package:petstop/domain/model/account.dart';
import 'package:petstop/domain/model/pet.dart';
import 'package:petstop/redux/action/account.dart';
import 'package:petstop/redux/action/pets.dart';
import 'package:petstop/service/response.dart';
import 'package:redux/redux.dart';
import 'package:petstop/redux/appstate.dart';
import 'package:petstop/redux/action/tab_navigation.dart';

class CoreViewModel extends ViewModel {
  CoreViewModel(Store<AppState> store) : super(store);

  StreamController<ServiceResponse<List<Pet>>> streamController;

  Stream<ServiceResponse<List<Pet>>> onStreamAccount() {
    streamController = executeStreamedRequest(() =>
        services.petsService.streamPets(
          store.state.account.data.id
        ));
    return streamController.stream;
  }

  void closeStreamAccount() async {
    if (streamController.stream != null) {
      await streamController.stream.drain();
      streamController.close();
    }
  }

  set currentTab(int currentTabIndex) => store.dispatch(NavigateToTabAction(currentTabIndex));
  int get currentTab => store.state.currentTab;

  String get config => store.state.config.latestVersion;

  set account(Account account) => store.dispatch(StoreAccountAction(account));
  Account get account => store.state.account.data;

  set pets(List<Pet> pets) => store.dispatch(StorePetsAction(pets));
  List<Pet> get pets => store.state.pets.data;
}