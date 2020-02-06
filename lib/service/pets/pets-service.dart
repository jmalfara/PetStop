import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:petstop/domain/model/account.dart';
import 'package:petstop/domain/model/pet.dart';

import '../client.dart';

abstract class PetsService {
  Client client;

  PetsService(Client client) :
        client = client;

  Future<Pet> addPet(Pet pet);

  Stream<List<Pet>> streamPets(String accountId);
}

class PetsServiceImpl extends PetsService {
  PetsServiceImpl(Client client) : super(client);

  @override
  Future<Pet> addPet(Pet pet) async {
    FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();

    // Merge with existing pet list
    Map<String, String> petMap = Map();
    petMap.putIfAbsent("name", () => pet.name);
    petMap.putIfAbsent("details", () => pet.details);
    petMap.putIfAbsent("type", () => pet.type.toString());

    int time = new DateTime.now().millisecondsSinceEpoch;
    Map<String, Map> indexPetMap = Map();
    indexPetMap.putIfAbsent("$time", () => petMap);

    Map<String, Map> data = Map();
    data.putIfAbsent("pets", () => indexPetMap);

    Firestore.instance.collection("users").document(currentUser.uid).setData(data, merge: true);

    return pet;
  }

  @override
  Stream<List<Pet>> streamPets(String accountId) {
    var streamTransformer = StreamTransformer<DocumentSnapshot, List<Pet>>.fromHandlers(
        handleData: (DocumentSnapshot snapshot, EventSink sink) {
          List<Pet> pets = List();

          snapshot.data["pets"].forEach((key, value) {
            Map<String, String> petMap = Map.from(value);
            pets.add(Pet(
                id: key,
                name: petMap["name"],
                details: petMap["details"],
                type: PetType.values.firstWhere((e) => e.toString() == petMap["type"])
            ));
          });
          sink.add(pets);
        },
        handleDone: (EventSink sink) => sink.close()
    );

    return Firestore.instance.collection("users")
        .document(accountId).snapshots().transform(streamTransformer);
  }
}
