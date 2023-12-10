abstract interface class AuthenticationRepository {
  Stream<bool> isSignedInStream = const Stream.empty();

  Future<void> signIn(String email, String password);

  Future<void> signOut();
}
