import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:memoir_vault/models/diary_page.dart';
import 'package:memoir_vault/widgets/diary_list/diary_list_builder.dart';

class DiaryList extends StatelessWidget {
  const DiaryList({super.key});

  @override
  Widget build(context) {
    final user = FirebaseAuth.instance.currentUser!;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Diary')
            .doc(user.uid)
            .collection('pages')
            .orderBy('date', descending: true)
            .snapshots(),
        builder: ((context, diarySnapshot) {
          //circular progress indicator while waiting connection state
          if (diarySnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          //when snapshot has error
          if (diarySnapshot.hasError) {
            return Center(
                child: Text('Something went wrong! ${diarySnapshot.error}'));
          }

          //when snapshot is empty or there is no data present
          if (!diarySnapshot.hasData || diarySnapshot.data!.docs.isEmpty) {
            return const Center(
                child:
                    Text('No pages found. Start Adding pages to your Diary'));
          }

          //extracting data
          final diary = diarySnapshot.data!.docs;

          List<DiaryPage> pages = [];
          for (var pageDoc in diary) {
            final data = pageDoc.data();

            DiaryPage page = DiaryPage(
              title: data['title'],
              body: data['body'],
              date: data['date'].toDate(),
              docId: pageDoc.id,
            );

            pages.add(page);
          }

          //returning the Diary List builder widget to be displayed
          return DiaryListBuilder(pages: pages);
        }));
  }
}
