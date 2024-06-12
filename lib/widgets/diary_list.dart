import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DiaryList extends StatelessWidget {
  DiaryList({super.key});

  final List<String> raj = [
    'raj',
    'rarar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
    'arrar',
  ];

  @override
  Widget build(context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('diary')
            .doc()
            .collection('pages')
            .snapshots(),
        builder: ((context, diarySnapshot) {
          if (diarySnapshot.hasData) {
            final diary = diarySnapshot.data!.docs;
            print(diary);
            return ListView.builder(
              padding: const EdgeInsets.only(top: 0),
              itemCount: raj.length,
              itemBuilder: (ctx, index) => Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Card(
                  color: const Color.fromARGB(170, 249, 169, 169),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 10,
                    ),
                    child: Text(
                      raj[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            );
          } else {
            //loading screen
            return Center(child: CircularProgressIndicator());
          }
        }));
    /*return ListView.builder(
      padding: const EdgeInsets.only(top: 0),
      itemCount: raj.length,
      itemBuilder: (ctx, index) => Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Card(
          color: const Color.fromARGB(170, 249, 169, 169),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 10,
            ),
            child: Text(
              raj[index],
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );*/
  }
}
