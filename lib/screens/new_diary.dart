import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoir_vault/controller/add_page.dart';
import 'package:memoir_vault/theme/theme_provider.dart';

import 'package:memoir_vault/widgets/date_selector.dart';
import 'package:memoir_vault/widgets/textfields/body_textfield.dart';
import 'package:memoir_vault/widgets/textfields/title_textfield.dart';

class NewDiary extends ConsumerStatefulWidget {
  const NewDiary({super.key});

  @override
  ConsumerState<NewDiary> createState() => _NewDiaryState();
}

class _NewDiaryState extends ConsumerState<NewDiary> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  bool button = false;
  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _bodyController.dispose();
  }

  @override
  Widget build(context) {
    final theme = ref.watch(themeProvider);
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.customColors.newDiaryScaffold,

      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,

        //SAVE BUTTON
        actions: [
          TextButton.icon(
            onPressed: () {
              addPage(
                  context: context,
                  title: _titleController.text.trim(),
                  date: _selectedDate,
                  body: _bodyController.text.trim());
            },
            icon: Icon(
              Icons.save_outlined,
              color: theme.customColors.saveButtonIcon,
            ),
            label: Text(
              'SAVE',
              style: TextStyle(color: theme.customColors.saveButtonText),
            ),
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
              // 'assets/home/home1.jpg',

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
                  onChange: (pickedDate) {
                    _selectedDate = pickedDate;
                  },
                ),

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
