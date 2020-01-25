import 'package:async/async.dart';
import 'package:flutterRedux/base/preferences/preferences.dart';
import 'package:flutterRedux/redux/appstate.dart';
import 'package:flutterRedux/service/response.dart';
import 'package:flutterRedux/service/services.dart';
import 'package:redux/redux.dart';

class ViewModel {
  final Store<AppState> store;

  Preferences preferences = PreferencesImpl();
  Services services = ServicesImpl();

  ViewModel(this.store);

  Future<ServiceResponse<T>> executeRequest<T>(Future<T> Function() requestFunction) async {
    var resultFuture = ResultFuture<T>(requestFunction());

    try {
      await resultFuture;
    } catch (e) {
      print(e.toString());
    }

    var result = resultFuture.result;
    if (result.isError) {
      var error = resultFuture.result.asError.error;
      return ServiceResponse(
        state: RequestState.FAILURE,
        error: error.toString()
      );
    } else {
      var response = resultFuture.result.asValue.value;
      return ServiceResponse(
          state: RequestState.SUCCESS,
          success: response
      );
    }
  }
}
