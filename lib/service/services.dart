import 'package:flutterRedux/service/account/account_service.dart';
import 'package:flutterRedux/service/client.dart';

abstract class Services {
  AccountService accountService;
}

class ServicesImpl implements Services {
  AccountService accountService;

  static final Services _instance = ServicesImpl._privateConstructor();
  ServicesImpl._privateConstructor() {
    Client client = Client();
    accountService = AccountServiceImpl(client);
  }
  factory ServicesImpl(){
    return _instance;
  }
}