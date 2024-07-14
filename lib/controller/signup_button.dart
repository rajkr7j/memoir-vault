import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoir_vault/controller/add_user_details.dart';
import 'package:memoir_vault/theme/theme_provider.dart';

final _firebase = FirebaseAuth.instance;
Future<void> signIn({
  required String email,
  required String password,
  required String confirmPassword,
  required String username,
  required BuildContext context,
  required WidgetRef ref,
}) async {
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
      return Center(
        child: CircularProgressIndicator(
          color:
              ref.watch(themeProvider).customColors.circularProgressIndicator,
          backgroundColor:
              ref.watch(themeProvider).customColors.circularProgressIndicatorBg,
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
