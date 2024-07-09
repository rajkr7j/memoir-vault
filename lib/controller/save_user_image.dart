import 'dart:io';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

Future<void> addUserImage(File image, BuildContext context) async {
  try {
    final user = FirebaseAuth.instance.currentUser!;
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('user_images')
        .child('${user.uid}.jpg');

    await storageRef.putFile(image);

    final imageUrl = await storageRef.getDownloadURL();

    //save in firestore
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .update({'userImage': imageUrl});

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile Picture Successfully Updated')));
  } catch (error) {
    log(error.toString());
  }
}
