import 'package:flutter/cupertino.dart';
import 'package:flutterRedux/domain/model/session.dart';
import 'package:flutterRedux/ui/login/login_viewmodel.dart';

void controlHandleLoginSuccess(LoginViewModel viewModel, BuildContext context, Session session) {
  viewModel.session = session;
  viewModel.loading = false;
}

void controlHandleLoginFailure(LoginViewModel viewModel, BuildContext context, String error) {
  viewModel.loading = false;
}

void controlHandleLoginLoading(LoginViewModel viewModel) {
  viewModel.loading = true;
}