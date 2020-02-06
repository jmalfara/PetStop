import 'package:flutter/cupertino.dart';
import 'package:petstop/base/notify.dart';
import 'package:petstop/base/stateful.dart';
import 'package:petstop/domain/model/account.dart';
import 'package:petstop/main.dart';
import 'package:petstop/ui/login/login_viewmodel.dart';
import 'package:petstop/ui/router_generator.dart';

void controlHandleLoginSuccess(LoginViewModel viewModel, BuildContext context, Account account) {
  viewModel.account = account;
  viewModel.accountState = ValueState.SUCCESS;
  navigatorKey.currentState.pushNamed(RouteGenerator.routeCore);
}

void controlHandleLoginFailure(LoginViewModel viewModel, BuildContext context, String error) {
  showSnackbar(context, error);
  viewModel.accountState = ValueState.FAILURE;
}

void controlHandleLoginLoading(LoginViewModel viewModel) {
  viewModel.accountState = ValueState.LOADING;
}
