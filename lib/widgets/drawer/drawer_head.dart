import 'dart:io';

import 'package:flutter/material.dart';
import 'package:memoir_vault/controller/get_user_image.dart';
import 'package:memoir_vault/controller/get_user_name.dart';
import 'package:memoir_vault/theme/custom_theme_data.dart';

class DrawerHeadWidget extends StatefulWidget {
  const DrawerHeadWidget({
    super.key,
    required this.theme,
  });

  final CustomThemeData theme;

  @override
  State<DrawerHeadWidget> createState() => _DrawerHeadWidgetState();
}

class _DrawerHeadWidgetState extends State<DrawerHeadWidget> {
  File? selectedImage;

  void setImage() async {
    selectedImage = await getUserImageFile();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    setImage();
  }

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      child: Stack(
        children: [
          Image.asset(
            widget.theme.bannerImage,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    //user pfp
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.width / 8,
                      backgroundColor: widget.theme.customColors.profileImageBg,
                      foregroundImage: selectedImage != null
                          ? FileImage(selectedImage!)
                          : Image.asset('assets/profile/user.webp').image,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 20),
                    //username
                    GetUserName(
                      textStyle: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: widget.theme.customColors.noResultFound,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
