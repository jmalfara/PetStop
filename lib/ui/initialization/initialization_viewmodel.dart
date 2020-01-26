import 'package:flutterRedux/base/viewmodel/viewmodel.dart';
import 'package:flutterRedux/domain/model/config.dart';
import 'package:flutterRedux/redux/action/config.dart';
import 'package:flutterRedux/service/response.dart';
import 'package:redux/redux.dart';
import 'package:flutterRedux/redux/appstate.dart';

class InitializationViewModel extends ViewModel {
  InitializationViewModel(Store<AppState> store) : super(store);

  Stream<ServiceResponse<Config>> onFetchConfig() {
    return executeRequest(services.configService.fetchAppConfig);
  }

  set config(Config config) => store.dispatch(StoreConfigAction(config));
  Config get config => store.state.config;
}