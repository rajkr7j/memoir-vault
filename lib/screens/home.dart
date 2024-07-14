import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:memoir_vault/provider/pages_provider.dart';
import 'package:memoir_vault/theme/theme_provider.dart';
import 'package:memoir_vault/widgets/drawer/my_drawer.dart';
import 'package:memoir_vault/widgets/floating_buttons.dart';
import 'package:memoir_vault/widgets/diary_list/diary_list.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(context, ref) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final theme = ref.watch(themeProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,

      //App Bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,

        //drawer button
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                //drawer button color
                color: theme.customColors.drawerButton,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),

      //Drawer
      drawer: const MyDrawer(),

      body: Stack(
        children: [
          //background image
          Image.asset(
            theme.bgImage,
            // 'assets/home/home1.jpg',
            // 'assets/home/home2.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),

          //top image
          Image.asset(
            theme.bannerImage,
            fit: BoxFit.cover,
            height: height / 3.11,
            width: double.infinity,
          ),

          //diary list
          Container(
            padding: EdgeInsets.only(
              right: width / 33.33,
              left: width / 33.33,
              top: height / 3.53,
              bottom: 0,
            ),
            child: const DiaryList(),
          ),

          //search bar
          Container(
            padding: EdgeInsets.only(
              top: height / 10,
              right: width / 20,
              left: width / 20,
            ),
            child: TextField(
              onChanged: (value) {
                ref.read(diaryPagesProvider.notifier).runFilter(value);
              },
              style: TextStyle(
                color: theme.customColors.searchBarText,
              ),
              cursorColor: theme.customColors.cursor,
              cursorErrorColor: Colors.red,
              decoration: InputDecoration(
                hintText: 'Search Title',

                // labelText: 'Search Title',
                suffixIcon: Icon(
                  Icons.search,
                  color: theme.customColors.searchBarIcon,
                ),
                filled: true,
                fillColor: theme.customColors.searchBarFilled,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: theme.customColors.searchBarBorder,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: theme.customColors.searchBarBorder,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),

          //floating button - Date, Add, Refresh
          const FloatingButton(),
        ],
      ),
    );
  }
}
