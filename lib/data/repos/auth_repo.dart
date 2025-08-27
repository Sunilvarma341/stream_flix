import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo {
  AuthRepo._();
  static final AuthRepo instance = AuthRepo._();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleAuth = GoogleSignIn.instance;

  void initializeGoogleSignIn() {
    try {
      _googleAuth.initialize(
        clientId:
            "599684909315-4l2fhqtulve430djaa1ea36irtn4s4h3.apps.googleusercontent.com",
        serverClientId:
            "599684909315-4l2fhqtulve430djaa1ea36irtn4s4h3.apps.googleusercontent.com",
      );
    } catch (e) {
      log("Error during GoogleSignIn disconnect: $e");
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final googleUser = await _googleAuth.authenticate();
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      log(
        "Google User: $googleUser userCredential : $userCredential ===================",
      );
      return userCredential.user;
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  Future<void> signOut() async {
    await _googleAuth.signOut();
    await _auth.signOut();
  }

  Future<User?> signUpWithEmail(String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> signInWithEmail(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      rethrow;
    }
  }

  // Current User
  User? get currentUser => _auth.currentUser;

  Future<void> sigin() async {}
  Future<void> signUp() async {}
}
