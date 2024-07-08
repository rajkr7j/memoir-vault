import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> editPage(
    {required String docId,
    required BuildContext context,
    required String title,
    required DateTime date,
    required String body}) async {
  try {
    final user = FirebaseAuth.instance.currentUser!;

    FirebaseFirestore.instance
        .collection('Diary')
        .doc(user.uid)
        .collection('pages')
        .doc(docId)
        .update({
      'title': title,
      'date': date,
      'body': body,
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Changes Saved Successfully Successfully')));
  } catch (error) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(error.toString())));
  }
}
