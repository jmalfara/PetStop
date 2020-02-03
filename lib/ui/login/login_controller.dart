import 'package:flutter/cupertino.dart';
import 'package:flutterRedux/base/stateful.dart';
import 'package:flutterRedux/domain/model/account.dart';
import 'package:flutterRedux/domain/model/session.dart';
import 'package:flutterRedux/main.dart';
import 'package:flutterRedux/ui/login/login_viewmodel.dart';
import 'package:flutterRedux/ui/router_generator.dart';

void controlHandleLoginSuccess(LoginViewModel viewModel, BuildContext context, Session session) {
  viewModel.session = session;
  viewModel.sessionState = ValueState.SUCCESS;
}

void controlHandleLoginFailure(LoginViewModel viewModel, BuildContext context, String error) {
  viewModel.sessionState = ValueState.LOADING;
}

void controlHandleLoginLoading(LoginViewModel viewModel) {
  viewModel.sessionState = ValueState.LOADING;
}

void controlHandleAccountSuccess(LoginViewModel viewModel, BuildContext context, Account account) {
  viewModel.account = account;
  viewModel.accountState = ValueState.SUCCESS;
  navigatorKey.currentState.pushReplacementNamed(RouteGenerator.routeCore);
}

void controlHandleAccountFailure(LoginViewModel viewModel, BuildContext context, String error) {
  viewModel.accountState = ValueState.FAILURE;
}

void controlHandleAccountLoading(LoginViewModel viewModel) {
  viewModel.accountState = ValueState.LOADING;
}
