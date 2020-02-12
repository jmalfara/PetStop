import 'package:flutter/cupertino.dart';
import 'package:petstop/domain/model/config.dart';
import 'package:petstop/ui/initialization/initialization_viewmodel.dart';
import 'package:petstop/ui/router_generator.dart';

import '../../main.dart';

controlHandleInitializationSuccess(InitializationViewModel viewModel, BuildContext context, InitializationData initializationData) {
  viewModel.initializationData = initializationData;
  navigatorKey.currentState.pushReplacementNamed(RouteGenerator.routeLogin);
}