class Session {
  final String authToken;
  final String refreshToken;

  Session({
    this.authToken,
    this.refreshToken
  });

  Session copy({
    String authToken,
    String refreshToken
  }) {
    return Session(
      authToken: authToken,
      refreshToken: refreshToken
    );
  }
}