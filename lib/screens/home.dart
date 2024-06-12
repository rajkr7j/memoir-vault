import 'package:flutter/material.dart';

import 'package:memoir_vault/widgets/floating_buttons.dart';
import 'package:memoir_vault/widgets/diary_list.dart';
import 'package:memoir_vault/widgets/my_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);

    return Scaffold(
      extendBodyBehindAppBar: true,

      //App Bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),

      //Drawer
      drawer: const MyDrawer(),

      body: Stack(
        children: [
          //background image
          Image.asset(
            'assets/home/home.jpg',
            // 'assets/home/home1.jpg',
            // 'assets/home/home2.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),

          //top image
          Image.asset(
            'assets/drawer/dw2.jpg',
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
            child: DiaryList(),
          ),

          //floating button - Date, Add, Refresh
          const FloatingButton(),
        ],
      ),
    );
  }
}
