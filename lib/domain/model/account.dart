import 'package:flutterRedux/domain/model/pet.dart';
import 'package:flutterRedux/domain/model/session.dart';

class Account {
  final String id;
  final String email;
  final String name;
  final List<Pet> pets;

  Account({
    this.id,
    this.email,
    this.name,
    this.pets = const []
  });

  Account copy({
    Session session,
    String id,
    String email,
    String name,
    List<Pet> pets
  }) {
    return Account(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      pets: pets
    );
  }
}