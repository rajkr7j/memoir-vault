import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memoir_vault/theme/theme_provider.dart';

class PassTextField extends ConsumerStatefulWidget {
  const PassTextField({
    super.key,
    required this.title,
    required this.controller,
  });
  final String title;
  final TextEditingController controller;
  @override
  ConsumerState<PassTextField> createState() {
    return _PassTextFieldState();
  }
}

class _PassTextFieldState extends ConsumerState<PassTextField> {
  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);

    return TextField(
      controller: widget.controller,
      obscureText:
          _isObscured, // Use the _isObscured variable to determine whether to obscure the text.
      style: const TextStyle(
        color: Colors.white,
      ),
      cursorColor: theme.customColors.cursor,
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
          borderSide: BorderSide(
            color: theme.customColors.authTextFielFocusedBorder,
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
