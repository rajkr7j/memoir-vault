import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker {
  const UserImagePicker({required this.onPickImage, required this.context});
  final void Function(File pickedimage) onPickImage;
  final BuildContext context;

  void addImage() async {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color.fromARGB(210, 222, 173, 169),
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void pickImage(ImageSource imageSource) async {
    final pickedImage = await ImagePicker().pickImage(
      source: imageSource,
      imageQuality: 100,
      maxWidth: 150,
    );
    if (pickedImage == null) {
      return;
    }
    File image = File(pickedImage.path);
    onPickImage(image);
  }
}
