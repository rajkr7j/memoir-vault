import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoir_vault/theme/custom_theme_data.dart';
import 'package:memoir_vault/theme/theme_instances.dart';
import 'package:memoir_vault/theme/theme_local_db.dart';

final themeProvider =
    StateNotifierProvider<ThemeNotifier, CustomThemeData>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<CustomThemeData> {
  ThemeNotifier() : super(pinkTheme) {
    _loadTheme();
  }

  void setTheme(CustomThemeData theme) async {
    state = theme;
    await _saveTheme(theme);
  }

  Future<void> _saveTheme(CustomThemeData theme) async {
    await DatabaseHelper.instance.saveTheme(theme.toString());
  }

  Future<void> _loadTheme() async {
    final themeName = await DatabaseHelper.instance.loadTheme();
    if (themeName != null) {
      switch (themeName) {
        case 'pinkTheme':
          state = pinkTheme;
          break;
        case 'blueTheme':
          state = greenTheme;
          break;
        // Add more themes here
        default:
          state = pinkTheme; // Default theme
      }
    }
  }
}
