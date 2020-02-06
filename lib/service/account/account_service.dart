import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:petstop/domain/model/account.dart';
import 'package:petstop/domain/model/pet.dart';
import 'package:petstop/service/client.dart';

abstract class AccountService {
  Client client;

  AccountService(Client client) :
      client = client;

  Future<Account> signInWithGoogle();

  Future<Account> getAccount();

  Future<Pet> addPet(Pet pet);
}

class AccountServiceImpl extends AccountService {
  AccountServiceImpl(Client client) : super(client);

  @override
  Future<Account> signInWithGoogle() async {
    // Simulated call
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    print("Logged in");

    return getAccount();
  }

  @override
  getAccount() async {
    FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
    DocumentSnapshot data = await Firestore.instance.collection("users").document(currentUser.uid).get();
    
    if (!data.exists) {
      Map<String, String> introData = Map();
      introData.putIfAbsent("createdAt", () => "${new DateTime.now().millisecondsSinceEpoch}");
      Firestore.instance.collection("users").document(currentUser.uid).setData(introData);
    }

    data.data.forEach((key, value) => print(key));
    List<Pet> pets = List();
    (data.data["pets"]).forEach((key, value) {
      Map<String, String> petMap = Map.from(value);
      pets.add(Pet(
        id: key,
        name: petMap["name"],
        details: petMap["details"],
        type: PetType.values.firstWhere((e) => e.toString() == petMap["type"])
      ));
    });

    return Account(
      id: currentUser.uid,
      email: currentUser.email,
      name: currentUser.displayName,
      pets: pets
    );
  }

  @override
  Future<Pet> addPet(Pet pet) async {
    FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
    DocumentSnapshot snapshot = await Firestore.instance.collection("users").document(currentUser.uid).get();

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
  Future<bool> sessionCheck() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user != null;
  }
}