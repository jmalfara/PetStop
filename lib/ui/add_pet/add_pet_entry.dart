import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petstop/base/info/text_info.dart';
import 'package:petstop/ui/add_pet/add_pet_page.dart';

class AddPetEntry extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextInfo(raw: "Add Pet").toString()),
      ),
      body: AddPetPage()
    );
  }
}
