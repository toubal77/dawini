import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildTitleInfo extends StatelessWidget {
  final String text;
  const BuildTitleInfo({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 233.w,
      height: 15.h,
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xff7C7C7C),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
