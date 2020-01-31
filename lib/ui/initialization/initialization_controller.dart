import 'package:flutter/cupertino.dart';
import 'package:flutterRedux/domain/model/config.dart';
import 'package:flutterRedux/ui/initialization/initialization_viewmodel.dart';
import 'package:flutterRedux/ui/router_generator.dart';

import '../../main.dart';

controlHandleFetchConfigSuccess(InitializationViewModel viewModel, BuildContext context, Config config) {
  viewModel.config = config;
  navigatorKey.currentState.pushReplacementNamed(RouteGenerator.routeLogin);
}