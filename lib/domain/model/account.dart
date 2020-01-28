import 'package:flutterRedux/domain/model/pet.dart';
import 'package:flutterRedux/domain/model/session.dart';

class Account {
  final String id;
  final String email;
  final String name;
  final List<Pet> pets;
  // TODO Does this belong in the model?
  final bool loading;

  Account({
    this.id,
    this.email,
    this.name,
    this.pets,
    this.loading = false
  });

  Account copy({
    Session session,
    String id,
    String email,
    String name,
    List<Pet> pets,
    bool loading
  }) {
    return Account(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      pets: pets,
      loading: loading ?? false
    );
  }
}