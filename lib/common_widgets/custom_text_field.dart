import 'package:dawini/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    Key? key,
    this.title,
    this.titleStyle,
    this.hintText,
    this.maxLength,
    required this.onChanged,
    this.isEnabled = true,
    required this.validator,
    this.isPhoneNumber = false,
    this.initialValue,
    this.isPassword = false,
    this.prefix,
    this.suffix,
    this.textInputAction,
    this.textInputType = TextInputType.text,
    this.lines,
    this.readOnly = false,
    this.fillColor = Colors.white,
  }) : super(key: key);

  final TextInputType textInputType;
  final String? title;
  final TextStyle? titleStyle;
  final String? initialValue;
  final String? hintText;
  final int? maxLength;
  final bool isPassword;
  final ValueChanged<String> onChanged;
  final bool isPhoneNumber;
  final bool isEnabled;
  final FormFieldValidator<String> validator;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputAction? textInputAction;
  final int? lines;
  final bool readOnly;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (title != null) ...[
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: titleStyle != null
                  ? Text(title!, style: titleStyle)
                  : Text(
                      title!,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
            ),
            const SizedBox(height: 2),
          ],
          // because it not redondant
          // ignore: avoid_unnecessary_containers
          Container(
            child: TextFormField(
              minLines: lines,
              maxLines: ((lines ?? 0) > 1) ? lines : 1,
              textInputAction: textInputAction,
              enabled: isEnabled,
              initialValue: initialValue,
              keyboardType: isPhoneNumber ? TextInputType.phone : textInputType,
              maxLength: maxLength,
              readOnly: readOnly,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.fromLTRB(12, 20, 12, 12),
                prefixIcon: prefix,
                suffixIcon: suffix,
                hintText: hintText,
                fillColor: fillColor,
                filled: true,
                counterText: '',
                focusColor: backgroundColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              obscureText: isPassword,
              onChanged: (value) => onChanged(value),
              validator: validator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ),
        ],
      ),
    );
  }
}
