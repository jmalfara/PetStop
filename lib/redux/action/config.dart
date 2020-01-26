import 'package:flutterRedux/domain/model/config.dart';

class StoreConfigAction {
  Config config;
  StoreConfigAction(this.config);
}

Config configReducer(Config prev, action) {
  if (action is StoreConfigAction) {
    print("Storing Config ${action.config.latestVersion}");
    return action.config;
  }

  return prev;
}