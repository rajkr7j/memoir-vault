import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:memoir_vault/screens/new_diary.dart';
import 'package:memoir_vault/theme/theme_provider.dart';

class FloatingButton extends ConsumerWidget {
  const FloatingButton({super.key});

  @override
  Widget build(context, ref) {
    double height = MediaQuery.of(context).size.height;
    final theme = ref.watch(themeProvider);
    return Column(
      children: [
        if (height > 130) SizedBox(height: height - 130),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Calender button
            SizedBox(
              height: height > 130 ? 50 : height * .1,
              width: height > 130 ? 50 : height * .1,
              child: FloatingActionButton(
                heroTag: "btn1",
                elevation: .5,
                backgroundColor: const Color.fromARGB(0, 255, 2, 2),
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Icon(
                  Icons.calendar_month_outlined,
                  color: theme.customColors.floatingButtonIcon,
                ),
              ),
            ),

            const SizedBox(width: 20),

            //Add new Diary
            SizedBox(
              height: height > 130 ? 80 : height * .3,
              width: height > 130 ? 80 : height * .3,
              child: FloatingActionButton(
                heroTag: "btn2",
                elevation: 0,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => const NewDiary()));
                },
                backgroundColor: theme.customColors.floatingButtonBg,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Icon(
                  Icons.add,
                  color: theme.customColors.floatingButtonIcon,
                  size: 50,
                ),
              ),
            ),

            const SizedBox(width: 20),

            //refresh or sync
            SizedBox(
              height: height > 130 ? 50 : height * .1,
              width: height > 130 ? 50 : height * .1,
              child: FloatingActionButton(
                heroTag: "btn3",
                elevation: .5,
                backgroundColor: Colors.transparent,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Icon(
                  Icons.refresh,
                  color: theme.customColors.floatingButtonIcon,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
