import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebase = FirebaseAuth.instance;

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});
  @override
  State<ForgetPasswordPage> createState() {
    return _ForgetPasswordPageState();
  }
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
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
    return Scaffold(
      backgroundColor: Colors.grey[400],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 66, 120),
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
              cursorColor: const Color.fromARGB(255, 0, 66, 120),
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
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 0, 66, 120),
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
            color: const Color.fromARGB(255, 0, 66, 120),
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
