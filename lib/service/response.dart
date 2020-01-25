enum RequestState {
  SUCCESS,
  FAILURE
}

class ServiceResponse<T> {
  final RequestState state;
  final String error;
  final T success;

  ServiceResponse({ this.state, this.error, this.success });
}