import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoir_vault/theme/theme_provider.dart';
import 'firebase_options.dart';

import 'package:memoir_vault/screens/home.dart';
import 'package:memoir_vault/screens/auth.dart';

void main() async {
  BindingBase.debugZoneErrorsAreFatal = true;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(context, ref) {
    final theme = ref.watch(themeProvider);
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(.8)),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //   snackBarTheme: SnackBarThemeData(
        //     backgroundColor: const Color.fromARGB(79, 0, 0, 0),
        //     contentTextStyle: const TextStyle(color: Colors.white),
        //     shape: RoundedRectangleBorder(
        //       borderRadius:
        //           BorderRadius.circular(10), // Customize the shape here
        //     ),
        //     behavior: SnackBarBehavior.floating,
        //   ),
        // ),
        theme: theme.baseTheme,
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              return const HomeScreen();
            }
            return const LoginScreen();
          },
        ),
      ),
    );
  }
}
