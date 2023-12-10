import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:open_weather_flutter_app/features/authentication/repositories/authentication_repository.dart';

final class FirebaseAuthenticationRepository implements AuthenticationRepository {
  @override
  Stream<bool> isSignedInStream = FirebaseAuth.instance.authStateChanges().map((user) => user != null);

  @override
  Future<void> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
        case 'user-disabled':
        case 'invalid-email':
        case 'invalid-credential':
        case 'wrong-password':
        default:
          throw Exception(e.message);
      }
    }
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
