class Session {
  final String authToken;
  final String refreshToken;
  final bool loading;

  Session({
    this.authToken,
    this.refreshToken,
    this.loading
  });

  Session copy({
    String authToken,
    String refreshToken,
    bool loading
  }) {
    return Session(
      authToken: authToken,
      refreshToken: refreshToken,
      loading: loading
    );
  }
}