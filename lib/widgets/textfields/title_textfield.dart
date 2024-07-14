import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memoir_vault/theme/theme_provider.dart';

class TitleTextField extends ConsumerWidget {
  const TitleTextField({
    super.key,
    required this.titleController,
    this.isEdit = true,
  });
  final TextEditingController titleController;
  final bool isEdit;
  @override
  Widget build(context, ref) {
    final theme = ref.watch(themeProvider);
    return TextField(
      enabled: isEdit,
      maxLines: 1,
      // expands: true,
      keyboardType: TextInputType.multiline,
      controller: titleController,

      cursorColor: theme.customColors.cursor,
      style: TextStyle(
        color: theme.customColors.titleText,
        fontSize: 25,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(0, 225, 68, 68),

        // field shape
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: theme.customColors.titleEnabledBorder,
          ),
          borderRadius: BorderRadius.circular(7),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: theme.customColors.titleFocusedBorder,
          ),
          borderRadius: BorderRadius.circular(7),
        ),
        hintText: 'title',
        hintStyle: GoogleFonts.encodeSansExpanded(
          color: theme.customColors.titleHintTextStyle,
          fontSize: 25,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      ),
    );
  }
}
