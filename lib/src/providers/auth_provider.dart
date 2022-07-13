import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider {
  FirebaseAuth? _firebaseAuth;

  AuthProvider() {
    _firebaseAuth = FirebaseAuth.instance;
  }
  Future<bool> login(String email, String password) async {
    String errorMessager;

    try {
      await _firebaseAuth?.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (error) {
      print(error);

      errorMessager = error.hashCode as String;
    }

    return true;
  }
}
