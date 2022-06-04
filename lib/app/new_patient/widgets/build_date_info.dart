import 'package:dawini/common_widgets/date_picker.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BuildDateInfo extends StatelessWidget {
  final DateTime date;
  late Function(DateTime) fct;
  BuildDateInfo({Key? key, required this.date, required this.fct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DatePicker(
      title: 'Date',
      hintText: 'DD/MM/YYYY',
      selectedDate: date,
      onSelectedDate: fct,
    );
  }
}
