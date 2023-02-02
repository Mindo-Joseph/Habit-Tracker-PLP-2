import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:habittracker/screens/home.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signUpWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var user = result.user;
      print('User created with email: ${user?.email}');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => Home(),
        ),
      );
    } catch (e) {
      print('Error creating user: $e');
    }
  }

  Future<void> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      var result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var user = result.user;
      print('Signed in with email: ${user?.email}');
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => Home()));
    } catch (e) {
      print('Error signing in: $e');
    }
  }
}
