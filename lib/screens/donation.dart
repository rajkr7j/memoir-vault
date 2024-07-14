import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memoir_vault/theme/theme_provider.dart';

class DonationPage extends ConsumerWidget {
  const DonationPage({super.key});

  @override
  Widget build(context, ref) {
    final theme = ref.watch(themeProvider);
    return Scaffold(
      backgroundColor: theme.customColors.drawerBg,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: theme.customColors.memoirVaultTitle,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'We\'re students without financial backing 🙏. Support us today.',
              textAlign: TextAlign.center,
              style: GoogleFonts.encodeSansExpanded(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          //Email TextField

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width / 1.2,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 5,
                ),
              ),
              child: Image.asset('assets/images/qr.jpg'),
            ),
          ),

          //credits
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Created by Raj Kumar\nEmail us at: rajkr7j@gmail.com',
              textAlign: TextAlign.center,
              style: GoogleFonts.encodeSansExpanded(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
