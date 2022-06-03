import 'dart:async';

import 'package:dawini/common_widgets/input_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({
    Key? key,
    required this.title,
    required this.selectedDate,
    required this.onSelectedDate,
    required this.hintText,
    this.titleStyle,
    this.isEnabled = true,
  }) : super(key: key);

  final String hintText;
  final String title;
  final DateTime? selectedDate;
  final ValueChanged<DateTime> onSelectedDate;
  final TextStyle? titleStyle;
  final bool isEnabled;

  static String date(DateTime date) {
    return DateFormat.yMMMd().format(date);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime temp = selectedDate != null ? selectedDate! : DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: temp,
      firstDate: DateTime(1960),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      onSelectedDate(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    const off = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w300,
    );
    const on = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: InputDropdown(
            textStyle: titleStyle ??
                const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
            title: title,
            valueText: selectedDate != null
                ? Text(date(selectedDate!), style: on)
                : Text(hintText, style: off),
            onPressed: () {
              if (isEnabled) _selectDate(context);
            },
          ),
        ),
      ],
    );
  }
}
