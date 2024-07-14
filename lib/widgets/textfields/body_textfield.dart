import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memoir_vault/theme/theme_provider.dart';

class BodyTextField extends ConsumerWidget {
  const BodyTextField({
    super.key,
    required this.bodyController,
    this.isEdit = true,
  });

  final TextEditingController bodyController;
  final bool isEdit;

  @override
  Widget build(context, ref) {
    final theme = ref.watch(themeProvider);
    return TextField(
      enabled: isEdit,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      controller: bodyController,
      textAlign: TextAlign.justify,
      cursorColor: theme.customColors.cursor,
      style: TextStyle(
        color: theme.customColors.bodyText,
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
          color: theme.customColors.bodyHintText,
          fontSize: 20,
        ),
      ),
    );
  }
}
