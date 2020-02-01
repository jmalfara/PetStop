class Stateful<T> {
  final ValueState state;
  final T data;

  Stateful({
    this.state = ValueState.READY,
    this.data
  });

  Stateful<T> copy({
    ValueState state,
    T data
  }) {
    return Stateful(
      state: state ?? this.state,
      data: data ?? this.data
    );
  }
}

enum ValueState {
  LOADING,
  READY,
  SUCCESS,
  FAILURE
}