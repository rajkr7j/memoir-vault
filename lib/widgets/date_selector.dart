import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:memoir_vault/models/months.dart';
import 'package:memoir_vault/theme/theme_provider.dart';

class DateSelector extends ConsumerStatefulWidget {
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
  ConsumerState<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends ConsumerState<DateSelector> {
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
          color: ref.watch(themeProvider).customColors.dateSelectorBg,
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
    final theme = ref.watch(themeProvider);
    return InkWell(
      onTap: widget.isEdit ? _datePicker : () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 10),

          //Date
          Text(
            selectedDate.day.toString(),
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w600,
              color: theme.customColors.dateText,
            ),
          ),

          const SizedBox(width: 10),
          //month
          Text(
            GetMonth().getMonthName(selectedDate.month),
            style: TextStyle(
              fontSize: 20,
              color: theme.customColors.dateText,
            ),
          ),

          const SizedBox(width: 10),

          //year
          Text(
            selectedDate.year.toString(),
            style: TextStyle(
              fontSize: 20,
              color: theme.customColors.dateText,
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
