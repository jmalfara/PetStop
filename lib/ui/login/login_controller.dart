import 'package:flutter/cupertino.dart';
import 'package:flutterRedux/domain/model/session.dart';
import 'package:flutterRedux/ui/login/login_viewmodel.dart';

void controlHandleLoginSuccess(LoginViewModel viewModel, BuildContext context, Session session) {
  print("Success");
  viewModel.session = session;
  viewModel.loading = false;
}

void controlHandleLoginFailure(LoginViewModel viewModel, BuildContext context, String error) {
  print("Failure");
  viewModel.loading = false;
}

void controlHandleLoginLoading(LoginViewModel viewModel) {
  print("Loading!");
  viewModel.loading = true;
}