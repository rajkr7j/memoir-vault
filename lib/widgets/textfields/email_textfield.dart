import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memoir_vault/theme/theme_provider.dart';

class TextFieldWidget extends ConsumerStatefulWidget {
  const TextFieldWidget({
    super.key,
    required this.title,
    required this.controller,
  });

  final String title;
  final TextEditingController controller;
  @override
  ConsumerState<TextFieldWidget> createState() {
    return _TextFieldWidgetState();
  }
}

class _TextFieldWidgetState extends ConsumerState<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);

    return TextField(
      keyboardType: TextInputType.emailAddress,
      controller: widget.controller,
      cursorColor: theme.customColors.cursor,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(0, 255, 255, 255),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
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
      ),
    );
  }
}
