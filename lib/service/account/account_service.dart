import 'package:flutterRedux/domain/model/account.dart';
import 'package:flutterRedux/domain/model/pet.dart';
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
      id: "314314234-343124-sdfdsf-gdfsgf",
      email: "jordan.malfara@gmail.com",
      name: "Jordan Malfara",
      pets: [
        Pet(
          name: "Doug",
          birthday: "2015-02-01",
          type: PetType.RABBIT
        ),
        Pet(
          name: "Mavric",
          birthday: "2018-05-23",
          type: PetType.DOG
        ),
      ]
    );
  }
}