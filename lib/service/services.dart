import 'package:flutterRedux/service/account/account_service.dart';
import 'package:flutterRedux/service/client.dart';
import 'package:flutterRedux/service/config/config_service.dart';

abstract class Services {
  AccountService accountService;
  ConfigService configService;
}

class ServicesImpl implements Services {
  AccountService accountService;
  ConfigService configService;

  static final Services _instance = ServicesImpl._privateConstructor();
  ServicesImpl._privateConstructor() {
    Client client = Client();
    accountService = AccountServiceImpl(client);
    configService = ConfigServiceImpl(client);
  }
  factory ServicesImpl(){
    return _instance;
  }
}