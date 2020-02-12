import 'package:petstop/base/viewmodel/viewmodel.dart';
import 'package:petstop/domain/model/config.dart';
import 'package:petstop/domain/model/product_group.dart';
import 'package:petstop/redux/action/config.dart';
import 'package:petstop/service/response.dart';
import 'package:redux/redux.dart';
import 'package:petstop/redux/appstate.dart';

class InitializationViewModel extends ViewModel {
  InitializationViewModel(Store<AppState> store) : super(store);

  Stream<ServiceResponse<InitializationData>> onInitialize() {
    return executeRequest(initializationRequest);
  }

  Future<InitializationData> initializationRequest() async {
    Config config = await services.configService.fetchAppConfig();

    return InitializationData(
      config: config,
    );
  }

  set initializationData(InitializationData initializationData) {
    store.dispatch(StoreConfigAction(initializationData.config));
  }
}

class InitializationData {
  final Config config;

  InitializationData({this.config});
}