import 'package:async/async.dart';
import 'package:flutterRedux/base/preferences/preferences.dart';
import 'package:flutterRedux/redux/appstate.dart';
import 'package:flutterRedux/service/response.dart';
import 'package:flutterRedux/service/services.dart';
import 'package:redux/redux.dart';

class ViewModel {
  final Store<AppState> store;
  Preferences _preferences = PreferencesImpl();
  Preferences get preferences => _preferences;

  Services _services = ServicesImpl();
  Services get services => _services;

  ViewModel(this.store);

  Stream<ServiceResponse<T>> executeRequest<T>(Future<T> Function() requestFunction) async* {
    yield ServiceResponse(state: RequestState.LOADING);

    var resultFuture = ResultFuture<T>(requestFunction());

    try {
      await resultFuture;
    } catch (e) {
      print(e.toString());
    }

    var result = resultFuture.result;
    if (result.isError) {
      var error = resultFuture.result.asError.error;
      yield ServiceResponse(
        state: RequestState.FAILURE,
        error: error.toString()
      );
    } else {
      var response = resultFuture.result.asValue.value;
      yield ServiceResponse(
          state: RequestState.SUCCESS,
          success: response
      );
    }
  }
}

// For testing. Use with care.
extension ViewModelTestingExtension on ViewModel {
  inject({
    Preferences preferences,
    Services services
  }) {
    this._preferences = preferences;
    this._services = services;
  }
}