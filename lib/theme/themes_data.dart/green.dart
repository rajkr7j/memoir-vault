import 'package:flutter/material.dart';
import 'package:memoir_vault/theme/custom_color_class.dart';
import 'package:memoir_vault/theme/custom_theme_data.dart';

final greenTheme = CustomThemeData(
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
  bannerImage: 'assets/theme/greenTheme/banner.jpg',
  bgImage: 'assets/theme/greenTheme/home.jpg',

  //colors
  customColors: CustomColors(
    //authentication page colors
    memoirVaultTitle: const Color.fromARGB(255, 0, 123, 4),
    loginButton: const Color.fromARGB(255, 44, 136, 25),
    authTextFielFocusedBorder: const Color.fromARGB(255, 44, 136, 25),
    oAuthCard: const Color.fromARGB(45, 44, 136, 25),
    circularProgressIndicator: const Color.fromARGB(255, 44, 136, 25),
    circularProgressIndicatorBg: const Color.fromARGB(255, 169, 223, 158),
    cursor: const Color.fromARGB(255, 44, 136, 25),

    //home page colors
    cardColor: const Color.fromARGB(100, 169, 249, 181),
    cardText: Colors.white,
    cardDelIconBg: const Color.fromARGB(129, 244, 67, 54),
    cardEditIconBg: const Color.fromARGB(129, 158, 158, 158),
    searchBarFilled: const Color.fromARGB(132, 201, 255, 205),
    searchBarBorder: const Color.fromARGB(255, 44, 136, 25),
    noResultFound: Colors.white,
    searchBarText: Colors.black,
    searchBarIcon: Colors.black,
    floatingButtonBg: const Color.fromARGB(255, 113, 171, 144),
    floatingButtonIcon: Colors.white,

    //drawer
    drawerBg: const Color.fromARGB(210, 169, 222, 187),
    drawerText: Colors.black,
    drawerButton: Colors.white,

    //profile page
    profilePageBg: const Color.fromARGB(210, 169, 222, 183),
    profileImageBg: const Color.fromARGB(154, 208, 255, 217),
    editImageButton: const Color.fromARGB(213, 208, 255, 217),
    profileText: Colors.grey.shade800,
    saveChangesButtonBg: const Color.fromARGB(212, 104, 255, 124),
    saveChangesButtonText: Colors.black,

    //new diary page color
    newDiaryScaffold: const Color.fromARGB(255, 169, 222, 171),
    saveButtonFill: const Color.fromARGB(255, 130, 255, 116),
    saveButtonIcon: Colors.black,
    saveButtonText: Colors.black,
    dateSelectorBg: const Color.fromARGB(210, 169, 222, 183),
    dateText: Colors.black,
    titleText: const Color.fromARGB(255, 63, 63, 63),
    titleEnabledBorder: const Color.fromARGB(255, 120, 120, 120),
    titleFocusedBorder: const Color.fromARGB(255, 44, 136, 25),
    titleHintTextStyle: const Color.fromARGB(186, 115, 115, 115),
    bodyText: Colors.white,
    bodyHintText: const Color.fromARGB(186, 54, 54, 54),

    //edit page color
    editpageButtonIcon: Colors.black,

    //theme page
    themeCard: Colors.green,
  ),
);
