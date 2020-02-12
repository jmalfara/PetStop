import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petstop/base/info/text_info.dart';
import 'package:petstop/domain/model/pet.dart';
import 'package:petstop/ui/pet_services/pet_services_page.dart';

class PetServicesEntry extends StatelessWidget {
  final Pet pet;

  const PetServicesEntry({Key key, this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(TextInfo(raw: "Services").toString()),
        ),
        body: PetServicesPage(
          pet: pet,
        )
    );
  }

}