import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoir_vault/theme/custom_theme_data.dart';
import 'package:memoir_vault/theme/theme_instances.dart';
import 'package:memoir_vault/theme/theme_local_db.dart';

final themeProvider =
    StateNotifierProvider<ThemeNotifier, CustomThemeData>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<CustomThemeData> {
  ThemeNotifier() : super(themes[0]) {
    loadTheme();
  }

  void setTheme(int themeidx) async {
    state = themes[themeidx];
    await _saveTheme(themeidx);
  }

  Future<void> _saveTheme(int theme) async {
    await DatabaseHelper.instance.saveTheme(theme);
  }

  Future<int> loadTheme() async {
    final themeidx = await DatabaseHelper.instance.loadTheme();
    if (themeidx != null) {
      switch (themeidx) {
        case 0:
          state = themes[0];
          break;
        case 1:
          state = themes[1];
          break;

        case 2:
          state = themes[2];
        // Add more themes here
        default:
          state = themes[0]; // Default theme
      }
    }
    return themeidx ?? 0;
  }
}
