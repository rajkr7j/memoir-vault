import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleTextField extends StatelessWidget {
  const TitleTextField({
    super.key,
    required this.titleController,
    this.isEdit = true,
  });
  final TextEditingController titleController;
  final bool isEdit;
  @override
  Widget build(context) {
    return TextField(
      enabled: isEdit,
      maxLines: 1,
      // expands: true,
      keyboardType: TextInputType.multiline,
      controller: titleController,

      cursorColor: const Color.fromARGB(255, 221, 62, 62),
      style: const TextStyle(
        color: Color.fromARGB(255, 63, 63, 63),
        fontSize: 25,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(0, 225, 68, 68),

        // field shape
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 120, 120, 120),
          ),
          borderRadius: BorderRadius.circular(7),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 221, 62, 62),
          ),
          borderRadius: BorderRadius.circular(7),
        ),
        hintText: 'title',
        hintStyle: GoogleFonts.encodeSansExpanded(
          color: const Color.fromARGB(186, 115, 115, 115),
          fontSize: 25,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      ),
    );
  }
}
