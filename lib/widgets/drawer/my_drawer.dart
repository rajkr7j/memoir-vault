import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:memoir_vault/screens/donation.dart';
import 'package:memoir_vault/screens/forget_password.dart';
import 'package:memoir_vault/screens/profile.dart';
import 'package:memoir_vault/screens/themes.dart';
import 'package:memoir_vault/theme/theme_provider.dart';
import 'package:memoir_vault/widgets/drawer/drawer_head.dart';

class MyDrawer extends ConsumerWidget {
  const MyDrawer({super.key});

  @override
  Widget build(context, ref) {
    final theme = ref.watch(themeProvider);
    return Drawer(
      backgroundColor: theme.customColors.drawerBg,
      child: Column(
        children: [
          //logo
          DrawerHeadWidget(theme: theme),

          //home tile
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              top: 25,
            ),
            child: ListTile(
              title: Text(
                'H O M E',
                style: TextStyle(color: theme.customColors.drawerText),
              ),
              leading: const Icon(Icons.home_outlined),
              onTap: () => Navigator.pop(context),
            ),
          ),

          //profile
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
            ),
            child: ListTile(
              title: Text(
                'P R O F I L E',
                style: TextStyle(color: theme.customColors.drawerText),
              ),
              leading: const Icon(Icons.person_2_outlined),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const ProfilePage()));
              },
            ),
          ),

          //theme
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              top: 0,
            ),
            child: ListTile(
              title: Text(
                'T H E M E',
                style: TextStyle(color: theme.customColors.drawerText),
              ),
              leading: const Icon(Icons.color_lens_outlined),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const ThemesPage()));
              },
            ),
          ),

          //settings tile
          // Padding(
          //   padding: const EdgeInsets.only(
          //     left: 25,
          //     top: 0,
          //   ),
          //   child: ListTile(
          //     title: Text(
          //       'S E T T I N G S',
          //       style: TextStyle(color: theme.customColors.drawerText),
          //     ),
          //     leading: const Icon(Icons.settings_outlined),
          //     onTap: () {},
          //   ),
          // ),

          //forget password
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              top: 0,
            ),
            child: ListTile(
              title: Text(
                'F O R G E T  P A S S W O R D',
                style: TextStyle(color: theme.customColors.drawerText),
              ),
              leading: const Icon(Icons.password),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: ((context) {
                  return const ForgetPasswordPage();
                })));
              },
            ),
          ),

          //donation
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              top: 0,
            ),
            child: ListTile(
              title: Text(
                'D O N A T I O N',
                style: TextStyle(color: theme.customColors.drawerText),
              ),
              leading: const Icon(Icons.attach_money),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: ((context) {
                  return const DonationPage();
                })));
              },
            ),
          ),

          //sign out
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              top: 0,
            ),
            child: ListTile(
              title: Text(
                'L O G O U T',
                style: TextStyle(color: theme.customColors.drawerText),
              ),
              leading: const Icon(Icons.logout),
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
            ),
          ),
        ],
      ),
    );
  }
}
