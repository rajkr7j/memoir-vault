import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    required this.title,
    required this.controller,
  });

  final String title;
  final TextEditingController controller;
  @override
  State<TextFieldWidget> createState() {
    return _TextFieldWidgetState();
  }
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      controller: widget.controller,
      cursorColor: const Color.fromARGB(255, 221, 62, 62),
      style: const TextStyle(
        color: Colors.white,
      ),
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
      ),
    );
  }
}
