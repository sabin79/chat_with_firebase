import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
// instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  User getCurrentUser() {
    return _auth.currentUser!;
  }

  // sign  in
  Future<UserCredential> sigInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      log('User signed in: ${userCredential.user?.uid}');

      await _fireStore.collection("users").doc(userCredential.user!.uid).set({
        "uid": userCredential.user!.uid,
        "email": email,
      }).catchError((error) {
        log("Firestore write error: $error");
      });
      log("User data added to Firestore for UID: ${userCredential.user!.uid}");

      return userCredential;
    } on FirebaseAuthException catch (authError) {
      log("FirebaseAuthException: ${authError.message}");
      throw Exception(authError.code);
    } catch (generalError) {
      log("An unexpected error occurred: $generalError");
      throw Exception("Unexpected error occurred");
    }
  }

//sign up
  Future<UserCredential> sigUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // try {
      //   await _fireStore.collection("users").doc(userCredential.user!.uid).set({
      //     "uid": userCredential.user!.uid,
      //     "email": email,
      //   });
      //   print("User data successfully written to Firestore.");
      // } catch (e) {
      //   print("Error writing user data to Firestore: $e");
      // }
      await _fireStore.collection("users").doc(userCredential.user!.uid).set({
        "uid": userCredential.user!.uid,
        "email": email,
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

// logout
  Future<void> logout() async {
    return await _auth.signOut();
  }
}
