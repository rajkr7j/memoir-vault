import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:memoir_vault/theme/theme_provider.dart';

final _firebase = FirebaseAuth.instance;

class ForgetPasswordPage extends ConsumerStatefulWidget {
  const ForgetPasswordPage({super.key});
  @override
  ConsumerState<ForgetPasswordPage> createState() {
    return _ForgetPasswordPageState();
  }
}

class _ForgetPasswordPageState extends ConsumerState<ForgetPasswordPage> {
  var _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    if (_emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('EMAIL cannot be empty'),
        ),
      );
      return;
    }
    try {
      await _firebase.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password reset link sent! Check you email'),
        ),
      );
      print("email sentttttttt");
    } on FirebaseAuthException catch (error) {
      // print(error);
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);
    return Scaffold(
      backgroundColor: theme.customColors.drawerBg,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: theme.customColors.memoirVaultTitle,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Enter your email  and we will send you a password reset link',
              textAlign: TextAlign.center,
              style: GoogleFonts.encodeSansExpanded(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 25,
              ),
            ),
          ),

          //Email TextField
          Padding(
            padding: const EdgeInsets.only(right: 30, left: 30, top: 25),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              cursorColor: theme.customColors.cursor,
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(38, 80, 80, 80),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromARGB(48, 0, 0, 0),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: theme.customColors.titleFocusedBorder,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: "Email",
                hintStyle: GoogleFonts.encodeSansExpanded(
                  color: const Color.fromARGB(174, 0, 0, 0),
                  fontSize: 15,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          MaterialButton(
            onPressed: passwordReset,
            color: theme.customColors.loginButton,
            child: Text(
              'Reset Password',
              style: GoogleFonts.encodeSansExpanded(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}
