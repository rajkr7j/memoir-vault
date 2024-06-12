import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PassTextField extends StatefulWidget {
  const PassTextField({
    super.key,
    required this.title,
    required this.controller,
  });
  final String title;
  final TextEditingController controller;
  @override
  State<PassTextField> createState() {
    return _PassTextFieldState();
  }
}

class _PassTextFieldState extends State<PassTextField> {
  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText:
          _isObscured, // Use the _isObscured variable to determine whether to obscure the text.
      style: const TextStyle(
        color: Colors.white,
      ),
      cursorColor: const Color.fromARGB(255, 221, 62, 62),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(0, 255, 255, 255),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 221, 62, 62),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: widget.title,
        hintStyle: GoogleFonts.encodeSansExpanded(
          color: const Color.fromARGB(187, 255, 255, 255),
          fontSize: 15,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isObscured =
                  !_isObscured; // Toggle the value of _isObscured when the button is pressed.
            });
          },
          icon: Icon(
            _isObscured ? Icons.visibility : Icons.visibility_off,
            color: const Color.fromARGB(255, 255, 255,
                255), // You can change the color of the icon according to your design.
          ),
        ),
      ),
    );
  }
}
