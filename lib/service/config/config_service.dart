import 'package:petstop/domain/model/config.dart';
import 'package:petstop/service/client.dart';

abstract class ConfigService {
  Client client;
  ConfigService(Client client) : client = client;

  Future<Config> fetchAppConfig();
}

class ConfigServiceImpl extends ConfigService {
  ConfigServiceImpl(Client client) : super(client);

  @override
  Future<Config> fetchAppConfig() async {
    // Simulated call
    await Future.delayed(Duration(seconds: 5), () {});

    return Config(
        latestVersion: "1.34.1",
    );
  }
}