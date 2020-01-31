import 'package:flutter/cupertino.dart';
import 'package:flutterRedux/domain/model/session.dart';
import 'package:flutterRedux/main.dart';
import 'package:flutterRedux/ui/login/login_viewmodel.dart';
import 'package:flutterRedux/ui/router_generator.dart';

void controlHandleLoginSuccess(LoginViewModel viewModel, BuildContext context, Session session) {
  viewModel.session = session;
  viewModel.loading = false;
  navigatorKey.currentState.pushReplacementNamed(RouteGenerator.routeCore);
}

void controlHandleLoginFailure(LoginViewModel viewModel, BuildContext context, String error) {
  viewModel.loading = false;
}

void controlHandleLoginLoading(LoginViewModel viewModel) {
  viewModel.loading = true;
}