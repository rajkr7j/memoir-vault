import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoir_vault/theme/theme_provider.dart';

final _firebase = FirebaseAuth.instance;
Future<void> logIn({
  required String email,
  required String password,
  required BuildContext context,
  required WidgetRef ref,
}) async {
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
