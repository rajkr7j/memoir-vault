import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebase = FirebaseAuth.instance;
Future<void> logIn(
    {required String email,
    required String password,
    required BuildContext context}) async {
  if (email.trim().isEmpty || password.trim().isEmpty) {
    HapticFeedback.vibrate();
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Email or Password cannot be empty.'),
      ),
    );
    return;
  }
  //loading circle
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(
          color: Color.fromARGB(255, 221, 62, 62),
          backgroundColor: Color.fromARGB(255, 248, 171, 171),
        ),
      );
    },
  );
  try {
    //attempt to sign in
    await _firebase.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );

    //pop the loading circle
    Navigator.of(context).pop();
  } on FirebaseAuthException catch (error) {
    //pop the loading circle
    Navigator.pop(context);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error.message!),
      ),
    );
  }
}
