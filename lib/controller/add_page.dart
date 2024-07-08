import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:memoir_vault/controller/dialog.dart';

Future<void> addPage(
    {required BuildContext context,
    required String title,
    required DateTime date,
    required String body}) async {
  try {
    final user = FirebaseAuth.instance.currentUser!;

    await FirebaseFirestore.instance
        .collection('Diary')
        .doc(user.uid)
        .collection('pages')
        .add({
      'title': title,
      'date': date,
      'body': body,
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Page Successfully added to your Diary')));
    Navigator.pop(context);
  } catch (error) {
    dialog(
        text:
            "Oops, somthing went wrong. Please try again later.${error.toString()}",
        title: "ERROR",
        context: context);
  }
}
