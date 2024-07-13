import 'package:flutter/material.dart';

import 'package:memoir_vault/controller/edit_page_button.dart';
import 'package:memoir_vault/models/diary_page.dart';
import 'package:memoir_vault/widgets/date_selector.dart';
import 'package:memoir_vault/widgets/textfields/body_textfield.dart';
import 'package:memoir_vault/widgets/textfields/title_textfield.dart';

class EditPage extends StatefulWidget {
  const EditPage({
    super.key,
    required this.page,
    this.isEdit = true,
  });
  final DiaryPage page;
  final bool isEdit;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  bool isEdit = false;
  @override
  void initState() {
    super.initState();
    isEdit = widget.isEdit;
  }

  @override
  Widget build(context) {
    final TextEditingController titleController =
        TextEditingController(text: widget.page.title);
    final TextEditingController bodyController =
        TextEditingController(text: widget.page.body);
    DateTime selectedDate = DateTime.now();

    //toggle isEdit
    void toggleIsEdit() {
      setState(() {
        isEdit = !isEdit;
      });
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 222, 173, 169),

      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          //if page is editable
          if (isEdit)
            TextButton.icon(
              onPressed: () {
                editPage(
                  docId: widget.page.docId,
                  context: context,
                  title: titleController.text.trim(),
                  date: selectedDate,
                  body: bodyController.text.trim(),
                );
                toggleIsEdit();
              },
              icon: const Icon(Icons.save_outlined),
              label: const Text('SAVE CHANGES'),
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 255, 125, 116)),
                foregroundColor: MaterialStateProperty.all(Colors.black),
                iconSize: MaterialStateProperty.all(30),
              ),
            ),

          //toggle edit page button, if page is not editable
          if (!isEdit)
            TextButton.icon(
              onPressed: toggleIsEdit,
              icon: const Icon(Icons.edit, color: Colors.black),
              label: const Text('EDIT'),
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
                DateSelector(
                  isEdit: isEdit,
                  initialDate: widget.page.date,
                  onChange: (pickedDate) {
                    selectedDate = pickedDate;
                  },
                ),

                const SizedBox(height: 5),

                //Title textField box
                TitleTextField(
                  titleController: titleController,
                  isEdit: isEdit,
                ),

                const SizedBox(height: 10),

                //Body textField Box
                BodyTextField(
                  bodyController: bodyController,
                  isEdit: isEdit,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
