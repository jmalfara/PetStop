import 'dart:async';

import 'package:async/async.dart';
import 'package:petstop/base/preferences/preferences.dart';
import 'package:petstop/redux/appstate.dart';
import 'package:petstop/redux/middleware/requestlogging.dart';
import 'package:petstop/service/response.dart';
import 'package:petstop/service/services.dart';
import 'package:redux/redux.dart';

class ViewModel {
  final Store<AppState> store;
  Preferences _preferences = PreferencesImpl();
  Preferences get preferences => _preferences;
  Services _services = ServicesImpl();
  Services get services => _services;

  ViewModel(this.store);

  StreamController<ServiceResponse<T>> executeStreamedRequest<T>(Stream<T> Function() requestFunction) {
    var streamController = _executeStreamedRequest(requestFunction);
    store.dispatch(RequestAction(streamController.stream));
    return streamController;
  }

  StreamController<ServiceResponse<T>> _executeStreamedRequest<T>(Stream<T> Function() requestFunction)  {
    var streamTransformer = StreamTransformer<T, ServiceResponse<T>>.fromHandlers(
      handleData: (T response, EventSink sink) => sink.add(ServiceResponse<T>(
          state: RequestState.SUCCESS,
          success: response
      )),
      handleError: (Object error, StackTrace stacktrace, EventSink sink) => sink.addError(ServiceResponse<T>(
          state: RequestState.FAILURE,
          error: error.toString()
      )),
      handleDone: (EventSink sink) {
        print("Closing execute Stream Sink");
        sink.close();
      },
    );

    Stream<ServiceResponse<T>> stream = requestFunction().transform(streamTransformer).asBroadcastStream();

    StreamController<ServiceResponse<T>> streamController = StreamController.broadcast();
    streamController.addStream(stream).then((data) {
      streamController.sink.add(ServiceResponse(state: RequestState.LOADING));
    });
    return streamController;
  }

  Stream<ServiceResponse<T>> executeRequest<T>(Future<T> Function() requestFunction) {
    var stream = _executeRequest(requestFunction).asBroadcastStream();
    store.dispatch(RequestAction(stream));
    return stream;
  }

  Stream<ServiceResponse<T>> _executeRequest<T>(Future<T> Function() requestFunction) async* {
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