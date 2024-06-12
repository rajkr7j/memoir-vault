import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:memoir_vault/models/months.dart';

class DateSelector extends StatefulWidget {
  DateSelector({
    super.key,
    required this.selectedDate,
  });
  DateTime? selectedDate;
  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  void _datePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(1992);

    showCupertinoModalPopup(
      context: context,
      // barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          color: const Color.fromARGB(210, 222, 173, 169),
          child: Column(
            children: [
              Container(
                height: 200,
                child: CupertinoDatePicker(
                  initialDateTime: widget.selectedDate ?? now,
                  mode: CupertinoDatePickerMode.date,
                  minimumDate: firstDate,
                  maximumDate: now,
                  onDateTimeChanged: (DateTime newDateTime) {
                    setState(() {
                      widget.selectedDate = newDateTime;
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
    return GestureDetector(
      onTap: _datePicker,
      child: Row(
        children: [
          const SizedBox(width: 10),

          //Date
          Text(
            widget.selectedDate!.day.toString(),
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(width: 10),
          //month
          Text(
            getMonth().getMonthName(widget.selectedDate!.month),
            style: const TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 68, 68, 68),
            ),
          ),

          const SizedBox(width: 10),

          //year
          Text(
            widget.selectedDate!.year.toString(),
            style: const TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 68, 68, 68),
            ),
          ),

          const SizedBox(width: 10),

          //calender button
          const Icon(
            Icons.arrow_drop_down,
            size: 30,
          ),
        ],
      ),
    );
  }
}
