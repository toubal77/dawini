import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    Key? key,
    required this.onChanged,
    required this.hint,
    required this.title,
    this.titleStyle,
    this.validator,
    this.options,
    this.initialValue,
    this.fillColor = Colors.white,
  }) : super(key: key);

  final ValueChanged<String> onChanged;
  final String hint;
  final String title;
  final TextStyle? titleStyle;
  final List<String>? options;
  final String? initialValue;
  final String? Function(String?)? validator;
  final Color fillColor;
  @override
  _WilayaPickerState createState() => _WilayaPickerState();
}

class _WilayaPickerState extends State<CustomDropDown> {
  late List<String> options = ['a', 'a', 'a'];
  String? dropdownValue;

  @override
  void initState() {
    dropdownValue = widget.initialValue;
    //! fix this, this is a temp fixs
    // if (widget.options != null) {
    //   options = widget.options!.toSet();
    // } else {
    //   // options = algeriaCities
    //   //     .map((e) {
    //   //       return "${e['wilaya_code']} - ${e['wilaya_name_ascii']}";
    //   //     })
    //   //     .toList()
    //   //     .toSet();
    // }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: widget.titleStyle != null
              ? Text(widget.title, style: widget.titleStyle)
              : Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
          //  BorderedText(
          //     strokeColor: Colors.black,
          //     strokeWidth: 3.0,
          //     child: Text(
          //       widget.title,
          //       style: const TextStyle(
          //         fontSize: 15,
          //         color: Colors.black,
          //       ),
          //     ),
          //   ),
        ),
        const SizedBox(height: 2),
        DropdownButtonFormField<String>(
          focusColor: Colors.transparent,
          validator: widget.validator,
          hint: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              widget.hint,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.fromLTRB(12, 20, 12, 12),
            fillColor: widget.fillColor,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromRGBO(119, 138, 164, 1),
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromRGBO(119, 138, 164, 1),
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                color: Color.fromRGBO(119, 138, 164, 1),
              ),
            ),
          ),
          isExpanded: true,
          value: dropdownValue,
          icon: const Icon(Icons.expand_more),
          style: const TextStyle(color: Colors.black),
          onChanged: (String? newValue) {
            setState(() => dropdownValue = newValue);
            if (dropdownValue != null) {
              widget.onChanged(dropdownValue!);
            }
          },
          items: options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  value,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
