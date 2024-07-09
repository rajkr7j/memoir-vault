import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:memoir_vault/models/diary_page.dart';

final diaryPagesProvider =
    StateNotifierProvider<DiaryPagesNotifier, List<DiaryPage>>(
        (ref) => DiaryPagesNotifier());

class DiaryPagesNotifier extends StateNotifier<List<DiaryPage>> {
  DiaryPagesNotifier() : super([]);

  List<DiaryPage> diary = [];

  //initialize the statenotifier with loaded pages from the firebase(streamlistener)
  Future<void> initiliazeDiary(List<DiaryPage> pages) async {
    diary = pages;
    state = pages;
  }

  //filter the listbuilder and this updates the state
  void runFilter(String enteredKeyword) {
    List<DiaryPage> results = [];
    if (enteredKeyword.isEmpty) {
      results = diary;
    } else {
      results = diary
          .where((video) =>
              video.title.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    state = results;
  }
}
