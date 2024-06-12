import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlankPage extends StatefulWidget {
  const BlankPage({super.key});

  @override
  State<BlankPage> createState() => _BlankPageState();
}

class _BlankPageState extends State<BlankPage> {
  DateTime? selectedDate;

  void _datePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(1992);

    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          color: Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              Container(
                height: 200,
                child: CupertinoDatePicker(
                  initialDateTime: selectedDate ?? now,
                  mode: CupertinoDatePickerMode.date,
                  minimumDate: firstDate,
                  maximumDate: now,
                  onDateTimeChanged: (DateTime newDateTime) {
                    setState(() {
                      selectedDate = newDateTime;
                    });
                  },
                ),
              ),
              CupertinoButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _datePicker,
        child: Row(
          children: [
            const SizedBox(width: 10),

            // Date
            Text(
              selectedDate != null ? selectedDate!.day.toString() : 'sdfsdf',
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(width: 10),
            // Month
            Text(
              selectedDate != null ? selectedDate!.month.toString() : 'asda',
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 68, 68, 68),
              ),
            ),

            const SizedBox(width: 10),

            // Year
            Text(
              selectedDate != null ? selectedDate!.year.toString() : 'asd',
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 68, 68, 68),
              ),
            ),

            const SizedBox(width: 10),

            // Calendar button
            const Icon(
              Icons.arrow_drop_down,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
