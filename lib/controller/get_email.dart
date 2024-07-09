import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetEmail extends StatelessWidget {
  const GetEmail({
    super.key,
    this.textStyle = const TextStyle(),
  });
  final TextStyle textStyle;
  @override
  Widget build(context) {
    final user = FirebaseAuth.instance.currentUser!;
    //get the collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(user.uid).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text(
              data['email'],
              style: textStyle,
            );
          }
          return const Text('Loading....');
        });
  }
}
