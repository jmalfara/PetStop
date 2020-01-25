import 'dart:async';

import 'package:flutterRedux/service/response.dart';

empty([c]) {}

extension StreamServiceResponseExtension<T> on Stream<ServiceResponse<T>> {
  static const _FUNCTION_EMPTY = empty;

  singleObserve({
    Function() loading = _FUNCTION_EMPTY,
    Function(T data) success = _FUNCTION_EMPTY,
    Function(String data) failure = _FUNCTION_EMPTY,
  }) {
    StreamSubscription subscription;
    subscription = this.listen((data) {
      switch (data.state) {
        case RequestState.LOADING:
          loading();
          break;
        case RequestState.FAILURE:
          failure(data.error);
          break;
        case RequestState.SUCCESS:
          success(data.success);
          break;
      }

      if (data.state == RequestState.SUCCESS || data.state == RequestState.FAILURE) {
        subscription.cancel();
      }
    });
  }
}
