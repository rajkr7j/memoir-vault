import 'package:flutter/material.dart';
import 'package:memoir_vault/theme/custom_color_class.dart';
import 'package:memoir_vault/theme/custom_theme_data.dart';

final purpleTheme = CustomThemeData(
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
  bannerImage: 'assets/theme/purple/banner1.jpg',
  bgImage: 'assets/theme/purple/hm.jpg',

  //colors
  customColors: CustomColors(
    //authentication page colors

    memoirVaultTitle: const Color.fromARGB(255, 147, 62, 221),
    loginButton: const Color.fromARGB(255, 176, 62, 221),
    authTextFielFocusedBorder: const Color.fromARGB(255, 205, 3, 255),
    oAuthCard: const Color.fromARGB(44, 158, 67, 228),
    circularProgressIndicator: const Color.fromARGB(255, 158, 62, 221),
    circularProgressIndicatorBg: const Color.fromARGB(255, 219, 171, 248),
    cursor: const Color.fromARGB(255, 150, 62, 221),

    //home page colors
    cardColor: const Color.fromARGB(170, 249, 169, 248),
    cardText: Colors.white,
    cardDelIconBg: const Color.fromARGB(129, 244, 67, 54),
    cardEditIconBg: const Color.fromARGB(129, 158, 158, 158),
    searchBarFilled: const Color.fromARGB(132, 242, 201, 255),
    searchBarBorder: const Color.fromARGB(255, 205, 3, 255),
    searchBarIcon: const Color.fromARGB(255, 73, 73, 73),
    searchBarText: Colors.black,
    noResultFound: Colors.white,
    floatingButtonBg: const Color.fromARGB(255, 136, 97, 166),
    floatingButtonIcon: Colors.white,

    //drawer
    drawerBg: const Color.fromARGB(210, 209, 169, 222),
    drawerText: Colors.black,
    drawerButton: Colors.white,

    //profile page
    profilePageBg: const Color.fromARGB(210, 212, 169, 222),
    profileImageBg: const Color.fromARGB(154, 252, 208, 255),
    editImageButton: const Color.fromARGB(213, 252, 208, 255),
    profileText: Colors.grey.shade800,
    saveChangesButtonBg: const Color.fromARGB(212, 104, 255, 124),
    saveChangesButtonText: Colors.black,

    //new diary page color
    newDiaryScaffold: const Color.fromARGB(255, 222, 173, 169),
    saveButtonFill: const Color.fromARGB(255, 204, 116, 255),
    saveButtonIcon: Colors.white,
    saveButtonText: Colors.white,
    dateSelectorBg: const Color.fromARGB(210, 209, 169, 222),
    dateText: Colors.white,
    titleText: Colors.white,
    titleEnabledBorder: Colors.white,
    titleFocusedBorder: const Color.fromARGB(255, 205, 3, 255),
    titleHintTextStyle: Colors.white,
    bodyText: Colors.white,
    bodyHintText: Colors.white,

    //edit page color
    editpageButtonIcon: Colors.white,

    //theme page
    themeCard: Colors.purple,
  ),
);
