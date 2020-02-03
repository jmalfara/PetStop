import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterRedux/ui/add_pet/add_pet_entry.dart';
import 'package:flutterRedux/ui/core/core_entry.dart';
import 'package:flutterRedux/ui/initialization/initialization_entry.dart';
import 'package:flutterRedux/ui/login/login_entry.dart';

class RouteGenerator {
  static const routeInitialization = "/";
  static const routeCore = "/core";
  static const routeLogin = "/login";
  static const routeAddPet = "/add_pet";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case routeInitialization:
        return MaterialPageRoute(builder: (_) => InitializationEntry());
      case routeCore:
        return MaterialPageRoute(builder: (_) => CoreEntry());
      case routeLogin:
        return MaterialPageRoute(builder: (_) => LoginEntry());
      case routeAddPet:
        return MaterialPageRoute(builder: (_) => AddPetEntry());
      default:
        // Add error Route
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                    body: Center(
                  child: Text("404 Not Found"),
                )
            )
        );
    }
  }
}
