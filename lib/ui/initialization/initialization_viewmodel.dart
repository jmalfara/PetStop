import 'package:flutter/cupertino.dart';
import 'package:flutterRedux/base/viewmodel/viewmodel.dart';
import 'package:flutterRedux/ui/router_generator.dart';
import 'package:redux/redux.dart';
import 'package:flutterRedux/redux/appstate.dart';

class InitializationViewModel extends ViewModel {
  InitializationViewModel(Store<AppState> store) : super(store);

  onFetchInitializationData(BuildContext context) async {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(RouteGenerator.routeCore);
    });
  }
}