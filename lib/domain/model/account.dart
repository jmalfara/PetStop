import 'package:petstop/domain/model/pet.dart';
import 'package:petstop/domain/model/session.dart';

class Account {
  final String id;
  final String email;
  final String name;

  Account({
    this.id,
    this.email,
    this.name,
  });

  Account copy({
    String id,
    String email,
    String name,
  }) {
    return Account(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }
}