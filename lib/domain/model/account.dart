import 'package:flutterRedux/domain/model/session.dart';

class Account {
  final Session session;
  final String id;
  final String email;
  final String name;

  Account({ this.session, this.id, this.email, this.name });

  Account copy({
    Session session,
    String id,
    String email,
    String name
  }) {
    return Account(
      session: session ?? this.session,
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name
    );
  }
}