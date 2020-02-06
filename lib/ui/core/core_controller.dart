
import 'package:petstop/main.dart';
import 'package:petstop/ui/router_generator.dart';

void controlHandleAddPetAction() {
  navigatorKey.currentState.pushNamed(RouteGenerator.routeAddPet);
}