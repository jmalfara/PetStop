import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petstop/domain/model/pet.dart';
import 'package:petstop/ui/add_pet/add_pet_entry.dart';
import 'package:petstop/ui/core/core_entry.dart';
import 'package:petstop/ui/initialization/initialization_entry.dart';
import 'package:petstop/ui/login/login_entry.dart';
import 'package:petstop/ui/pet_services/pet_services_entry.dart';

class RouteGenerator {
  static const routeInitialization = "/";
  static const routeCore = "/core";
  static const routeLogin = "/login";
  static const routeAddPet = "/add_pet";
  static const routeServices = "/services";

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
      case routeServices:
        Pet pet = args as Pet;
        return MaterialPageRoute(builder: (_) => PetServicesEntry(
          pet: pet,
        ));
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
