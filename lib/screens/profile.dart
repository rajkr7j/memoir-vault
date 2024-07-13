import 'dart:io';
import 'package:flutter/material.dart';
import 'package:memoir_vault/controller/get_email.dart';
import 'package:memoir_vault/controller/get_user_image.dart';
import 'package:memoir_vault/controller/get_user_name.dart';
import 'package:memoir_vault/controller/save_user_image.dart';
import 'package:memoir_vault/controller/user_image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? selectedImage;
  bool isEdit = false;
  bool isSaving = false;

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
  Widget build(context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(210, 222, 173, 169),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('P R O F I L E'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: height / 8,
                ),
                //user profile image
                CircleAvatar(
                  radius: height / 10,
                  backgroundColor: const Color.fromARGB(154, 255, 208, 208),
                  foregroundImage: selectedImage != null
                      ? FileImage(selectedImage!)
                      : Image.asset('assets/profile/user.webp').image,
                ),
                SizedBox(height: height / 100),
                //username
                GetUserName(
                  textStyle: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                //email
                GetEmail(
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),

                //change profile image

                SizedBox(height: height / 25),

                //Edit Image button
                InkWell(
                  onTap: () {
                    UserImagePicker(
                        context: context,
                        onPickImage: (pickedimage) {
                          setState(() {
                            //set image data
                            selectedImage = pickedimage;
                            //set isedit variable to enable save button
                            isEdit = true;
                          });
                        }).addImage();
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: const Color.fromARGB(213, 255, 208, 208),
                    ),
                    child: const Center(
                        child: Text(
                      'Edit Image',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                  ),
                ),

                //Save Image Button conditonal
                SizedBox(height: height / 3),
                if (isEdit)
                  InkWell(
                    onTap: () async {
                      setState(() {
                        isSaving = true;
                      });
                      await addUserImage(selectedImage!, context);
                      setState(() {
                        isEdit = false;
                        isSaving = false;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: const Color.fromARGB(212, 104, 255, 124),
                      ),
                      child: Center(
                          child: Text(
                        isSaving ? 'Saving......' : 'Save Changes',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      )),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
