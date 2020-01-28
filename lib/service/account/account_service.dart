import 'package:flutterRedux/domain/model/account.dart';
import 'package:flutterRedux/domain/model/session.dart';
import 'package:flutterRedux/service/client.dart';

abstract class AccountService {
  Client client;

  AccountService(Client client) :
      client = client;

  Future<Session> login();

  Future<Account> getAccount();
}

class AccountServiceImpl extends AccountService {
  AccountServiceImpl(Client client) : super(client);

  @override
  Future<Session> login() async {
    // Simulated call
    await Future.delayed(Duration(seconds: 5), () {});

    return Session(
      authToken: "ABCD",
      refreshToken: "RefreshToken"
    );
  }

  @override
  getAccount() async {
    // Simulated call
    await Future.delayed(Duration(seconds: 5), () {});

    return Account(

    );
  }
}