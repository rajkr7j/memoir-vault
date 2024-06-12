import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'package:memoir_vault/widgets/date_selector.dart';
import 'package:memoir_vault/widgets/textfields/body_textfield.dart';
import 'package:memoir_vault/widgets/textfields/title_textfield.dart';

class NewDiary extends StatefulWidget {
  const NewDiary({super.key});

  @override
  State<NewDiary> createState() => _NewDiaryState();
}

class _NewDiaryState extends State<NewDiary> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final DateTime _selectedDate = DateTime.now();
  bool button = false;

  //add page to diary
  Future addPage() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;

      FirebaseFirestore.instance
          .collection('Diary')
          .doc(user.uid)
          .collection('pages')
          .add({
        'title': _titleController.text,
        'date': _selectedDate,
        'body': _bodyController.text,
      });
    } catch (error) {
      dialog(
          text:
              "Oops, somthing went wrong. Please try again later.${error.toString()}",
          title: "ERROR");
    }
  }

  //TO show Error or dialog
  void dialog({required String text, required String title}) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text(
                title,
                // style: TextStyle(color: Colors.white),
              ),
              content: Text(
                text,
                // style: TextStyle(color: Colors.white),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: const Text("Okay"),
                )
              ],
            ));
  }

  @override
  Widget build(context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 222, 173, 169),

      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton.icon(
            onPressed: addPage,
            icon: const Icon(Icons.save_outlined),
            label: const Text('SAVE'),
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 255, 125, 116)),
              foregroundColor: MaterialStateProperty.all(Colors.black),
              iconSize: MaterialStateProperty.all(30),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          //backgraound image
          Container(
            padding: const EdgeInsets.only(top: 0),
            child: Image.asset(
              'assets/home/home.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),

          //main screen with texts
          SingleChildScrollView(
            padding: const EdgeInsets.only(
              right: 10,
              left: 10,
              top: 90,
            ),
            child: Column(
              children: [
                //Date and Date selector
                DateSelector(selectedDate: _selectedDate),

                const SizedBox(height: 5),

                //Title textField box
                TitleTextField(titleController: _titleController),

                const SizedBox(height: 10),

                //Body textField Box
                BodyTextField(bodyController: _bodyController),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
