import 'package:petstop/domain/model/config.dart';

class StoreConfigAction {
  Config config;
  StoreConfigAction(this.config);
}

Config configReducer(Config prev, action) {
  if (action is StoreConfigAction) {
    return action.config;
  }

  return prev;
}