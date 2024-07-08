import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyTextField extends StatelessWidget {
  const BodyTextField({
    super.key,
    required this.bodyController,
    this.isEdit = true,
  });

  final TextEditingController bodyController;
  final bool isEdit;

  @override
  Widget build(context) {
    return TextField(
      enabled: isEdit,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      controller: bodyController,
      textAlign: TextAlign.justify,
      cursorColor: const Color.fromARGB(255, 221, 62, 62),
      style: const TextStyle(
        color: Color.fromARGB(255, 58, 58, 58),
        fontSize: 20,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(0, 255, 255, 255),

        //field shape
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(0, 0, 0, 0),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(0, 0, 0, 0),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: 'write more here.....',
        hintStyle: GoogleFonts.encodeSansExpanded(
          color: const Color.fromARGB(186, 54, 54, 54),
          fontSize: 20,
        ),
      ),
    );
  }
}
