import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoir_vault/theme/theme_instances.dart';
import 'package:memoir_vault/theme/theme_provider.dart';

class ThemesPage extends ConsumerStatefulWidget {
  const ThemesPage({super.key});

  @override
  ConsumerState<ThemesPage> createState() => _ThemePageState();
}

class _ThemePageState extends ConsumerState<ThemesPage> {
  int selectedOption = 0;
  //list of themes
  final List<String> list = ['pink', 'green', 'purple'];
  void initState() {
    super.initState();
    // Initialize selectedOption from the provider in initState
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      int idx = await ref.read(themeProvider.notifier).loadTheme();
      setState(() {
        selectedOption = idx;
      });
    });
  }

  @override
  Widget build(context) {
    final theme = ref.watch(themeProvider);

    return Scaffold(
      backgroundColor: theme.customColors.profilePageBg,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('T H E M E'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              decoration: BoxDecoration(
                border: Border.all(color: themes[index].customColors.themeCard),
                boxShadow: [
                  BoxShadow(
                    color: themes[index].customColors.themeCard.withAlpha(120),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
                color: themes[index].customColors.themeCard.withAlpha(180),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                title: Text(
                  '${list[index].toUpperCase()} THEME',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                trailing: Radio<int>(
                  value: index,
                  groupValue: selectedOption,
                  activeColor: Colors.amber,
                  onChanged: (int? value) {
                    ref.read(themeProvider.notifier).setTheme(value!);

                    setState(() {
                      selectedOption = value;
                    });
                  },
                ),
                onTap: () {
                  ref.read(themeProvider.notifier).setTheme(index);
                  setState(() {
                    selectedOption = index;
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
