import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:memoir_vault/controller/edit_page_button.dart';
import 'package:memoir_vault/models/diary_page.dart';
import 'package:memoir_vault/theme/theme_provider.dart';
import 'package:memoir_vault/widgets/date_selector.dart';
import 'package:memoir_vault/widgets/textfields/body_textfield.dart';
import 'package:memoir_vault/widgets/textfields/title_textfield.dart';

class EditPage extends ConsumerStatefulWidget {
  const EditPage({
    super.key,
    required this.page,
    this.isEdit = true,
  });
  final DiaryPage page;
  final bool isEdit;

  @override
  ConsumerState<EditPage> createState() => _EditPageState();
}

class _EditPageState extends ConsumerState<EditPage> {
  bool isEdit = false;
  @override
  void initState() {
    super.initState();
    isEdit = widget.isEdit;
  }

  //toggle isEdit
  void toggleIsEdit() {
    setState(() {
      isEdit = !isEdit;
    });
  }

  @override
  Widget build(context) {
    final TextEditingController titleController =
        TextEditingController(text: widget.page.title);
    final TextEditingController bodyController =
        TextEditingController(text: widget.page.body);
    DateTime selectedDate = DateTime.now();
    final theme = ref.watch(themeProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.customColors.newDiaryScaffold,

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
              icon: Icon(
                Icons.save_outlined,
                color: theme.customColors.saveButtonIcon,
              ),
              label: Text('SAVE CHANGES',
                  style:
                      TextStyle(color: theme.customColors.editpageButtonIcon)),
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(
                  theme.customColors.saveButtonFill,
                ),
                foregroundColor: MaterialStateProperty.all(Colors.black),
                iconSize: MaterialStateProperty.all(30),
              ),
            ),

          //toggle edit page button, if page is not editable
          if (!isEdit)
            TextButton.icon(
              onPressed: toggleIsEdit,
              icon: Icon(
                Icons.edit,
                color: theme.customColors.editpageButtonIcon,
              ),
              label: Text('EDIT',
                  style:
                      TextStyle(color: theme.customColors.editpageButtonIcon)),
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(
                  theme.customColors.saveButtonFill,
                ),
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
              theme.bgImage,
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
