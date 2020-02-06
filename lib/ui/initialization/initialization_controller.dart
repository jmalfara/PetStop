import 'package:flutter/cupertino.dart';
import 'package:petstop/domain/model/config.dart';
import 'package:petstop/ui/initialization/initialization_viewmodel.dart';
import 'package:petstop/ui/router_generator.dart';

import '../../main.dart';

controlHandleFetchConfigSuccess(InitializationViewModel viewModel, BuildContext context, Config config) {
  viewModel.config = config;
  navigatorKey.currentState.pushReplacementNamed(RouteGenerator.routeLogin);
}