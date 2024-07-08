import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memoir_vault/controller/add_user_details.dart';

final _firebase = FirebaseAuth.instance;
Future<void> signIn(
    {required String email,
    required String password,
    required String confirmPassword,
    required String username,
    required BuildContext context}) async {
  if (email.trim().isEmpty ||
      password.trim().isEmpty ||
      username.trim().isEmpty) {
    HapticFeedback.vibrate();
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('All Fields Must be filled'),
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
    //attempt to sign up
    if (passwordConfirmed(
        password: password.trim(),
        confirmPasswrod: confirmPassword.trim(),
        context: context)) {
      //create user
      final userCredential = await _firebase.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //pop the loading circle
      Navigator.of(context).pop();
      //add user details
      await addUserDetails(username.trim(), email.trim(), userCredential);
    }
  } on FirebaseAuthException catch (error) {
    //pop the loading circle
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error.message!),
      ),
    );
  }
}

bool passwordConfirmed(
    {required String password,
    required String confirmPasswrod,
    required BuildContext context}) {
  if (password == confirmPasswrod) {
    return true;
  }
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Password did not macth'),
    ),
  );
  return false;
}
