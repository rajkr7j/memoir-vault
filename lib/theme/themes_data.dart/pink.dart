import 'package:flutter/material.dart';
import 'package:memoir_vault/theme/custom_color_class.dart';
import 'package:memoir_vault/theme/custom_theme_data.dart';

final pinkTheme = CustomThemeData(
  baseTheme: ThemeData(
    snackBarTheme: SnackBarThemeData(
      backgroundColor: const Color.fromARGB(79, 0, 0, 0),
      contentTextStyle: const TextStyle(color: Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Customize the shape here
      ),
      behavior: SnackBarBehavior.floating,
    ),
  ),
  bannerImage: 'assets/drawer/dw2.jpg',
  bgImage: 'assets/home/home.jpg',

  //colors
  customColors: CustomColors(
    //authentication page colors

    memoirVaultTitle: const Color.fromARGB(255, 221, 62, 62),
    loginButton: const Color.fromARGB(255, 221, 62, 62),
    authTextFielFocusedBorder: const Color.fromARGB(255, 221, 62, 62),
    oAuthCard: const Color.fromARGB(45, 228, 67, 67),
    circularProgressIndicator: const Color.fromARGB(255, 221, 62, 62),
    circularProgressIndicatorBg: const Color.fromARGB(255, 248, 171, 171),
    cursor: const Color.fromARGB(255, 221, 62, 62),

    //home page colors
    cardColor: const Color.fromARGB(170, 249, 169, 169),
    cardText: Colors.white,
    cardDelIconBg: const Color.fromARGB(129, 244, 67, 54),
    cardEditIconBg: const Color.fromARGB(129, 158, 158, 158),
    searchBarFilled: const Color.fromARGB(132, 255, 201, 201),
    searchBarBorder: const Color.fromARGB(255, 255, 3, 3),
    searchBarIcon: const Color.fromARGB(255, 73, 73, 73),
    searchBarText: Colors.black,
    noResultFound: Colors.black,
    floatingButtonBg: const Color.fromARGB(255, 171, 117, 113),
    floatingButtonIcon: Colors.white,

    //drawer
    drawerBg: const Color.fromARGB(210, 222, 173, 169),
    drawerText: Colors.black,
    drawerButton: Colors.white,

    //profile page
    profilePageBg: const Color.fromARGB(210, 222, 173, 169),
    profileImageBg: const Color.fromARGB(154, 255, 208, 208),
    editImageButton: const Color.fromARGB(213, 255, 208, 208),
    profileText: Colors.grey.shade800,
    saveChangesButtonBg: const Color.fromARGB(212, 104, 255, 124),
    saveChangesButtonText: Colors.black,

    //new diary page color
    newDiaryScaffold: const Color.fromARGB(255, 222, 173, 169),
    saveButtonFill: const Color.fromARGB(255, 255, 125, 116),
    saveButtonIcon: Colors.black,
    saveButtonText: Colors.black,
    dateSelectorBg: const Color.fromARGB(210, 222, 173, 169),
    dateText: Colors.black,
    titleText: const Color.fromARGB(255, 63, 63, 63),
    titleEnabledBorder: const Color.fromARGB(255, 120, 120, 120),
    titleFocusedBorder: const Color.fromARGB(255, 221, 62, 62),
    titleHintTextStyle: const Color.fromARGB(186, 115, 115, 115),
    bodyText: const Color.fromARGB(255, 58, 58, 58),
    bodyHintText: const Color.fromARGB(186, 54, 54, 54),

    //edit page color
    editpageButtonIcon: Colors.black,

    //theme page
    themeCard: Colors.pink,
  ),
);
