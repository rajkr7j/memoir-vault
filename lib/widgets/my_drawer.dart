import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:memoir_vault/screens/profile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(210, 222, 173, 169),
      child: Column(
        children: [
          //logo
          DrawerHeader(
            margin: const EdgeInsets.all(0),
            padding: const EdgeInsets.all(0),
            child: Image.asset(
              // 'assets/drawer/dw1.jpg',
              'assets/drawer/dw2.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),

          //home tile
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              top: 25,
            ),
            child: ListTile(
              title: const Text(
                'H O M E',
                style: TextStyle(color: Colors.black),
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
              title: const Text(
                'P R O F I L E',
                style: TextStyle(color: Colors.black),
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
              title: const Text(
                'T H E M E',
                style: TextStyle(color: Colors.black),
              ),
              leading: const Icon(Icons.color_lens_outlined),
              onTap: () {},
            ),
          ),

          //settings tile
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              top: 0,
            ),
            child: ListTile(
              title: const Text(
                'S E T T I N G S',
                style: TextStyle(color: Colors.black),
              ),
              leading: const Icon(Icons.settings_outlined),
              onTap: () {},
            ),
          ),

          //sign out
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              top: 0,
            ),
            child: ListTile(
              title: const Text(
                'L O G O U T',
                style: TextStyle(color: Colors.black),
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
