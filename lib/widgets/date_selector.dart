import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:memoir_vault/models/months.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({
    super.key,
    required this.onChange,
    this.initialDate,
    this.isEdit = true,
  });
  final void Function(DateTime) onChange;
  final DateTime? initialDate;
  final bool isEdit;

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate ?? DateTime.now();
  }

  //date picker
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
                  initialDateTime: selectedDate,
                  mode: CupertinoDatePickerMode.date,
                  minimumDate: firstDate,
                  maximumDate: now,
                  onDateTimeChanged: (DateTime newDateTime) {
                    widget.onChange(newDateTime);
                    setState(() {
                      selectedDate = newDateTime;
                    });
                  },
                ),
              ),
              CupertinoButton(
                child: const Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
    return InkWell(
      onTap: widget.isEdit ? _datePicker : () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 10),

          //Date
          Text(
            selectedDate.day.toString(),
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),

          const SizedBox(width: 10),
          //month
          Text(
            GetMonth().getMonthName(selectedDate.month),
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),

          const SizedBox(width: 10),

          //year
          Text(
            selectedDate.year.toString(),
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
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
