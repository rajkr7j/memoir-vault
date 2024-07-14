import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoir_vault/theme/theme_provider.dart';

class AccCard extends ConsumerWidget {
  const AccCard({
    super.key,
    required this.image,
    required this.onTap,
  });

  final String image;
  final void Function() onTap;
  @override
  Widget build(context, ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Card(
          color: ref.watch(themeProvider).customColors.oAuthCard,
          child: Image.asset(image),
        ),
      ),
    );
  }
}
