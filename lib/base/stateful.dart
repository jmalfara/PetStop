class Stateful<T> {
  ValueState state = ValueState.READY;
  T data;

  Stateful({
    this.state,
    this.data
  });
}

enum ValueState {
  LOADING,
  READY,
  SUCCESS,
  FAILURE
}