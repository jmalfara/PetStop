
import 'package:petstop/domain/model/account.dart';
import 'package:petstop/main.dart';
import 'package:petstop/ui/core/core_viewmodel.dart';
import 'package:petstop/ui/router_generator.dart';

void controlHandleAddPetAction() {
  navigatorKey.currentState.pushNamed(RouteGenerator.routeAddPet);
}

void controlHandleAccountSuccess(CoreViewModel coreViewModel, Account account) {
  coreViewModel.account = account;
}