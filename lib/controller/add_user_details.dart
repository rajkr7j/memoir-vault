import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future addUserDetails(
    String username, String email, UserCredential userCredential) async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(userCredential.user!.uid)
      .set({
    'username': username,
    'email': email,
    'userImage': '',
  });
}
