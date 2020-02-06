import 'dart:async';

import 'package:petstop/service/response.dart';

empty([c]) {}

extension StreamServiceResponseExtension<T> on Stream<ServiceResponse<T>> {
  singleObserve({
    Function() loading = empty,
    Function(T data) success = empty,
    Function(String data) failure = empty,
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

  singleObserveForever({
    Function() loading = empty,
    Function(T data) success = empty,
    Function(String data) failure = empty,
  }) {
    this.listen((data) {
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
    });
  }
}
