
import 'package:flutterRedux/main.dart';
import 'package:flutterRedux/ui/router_generator.dart';

void controlHandleAddPetAction() {
  navigatorKey.currentState.pushNamed(RouteGenerator.routeAddPet);
}