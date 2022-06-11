import 'package:flutter/material.dart';

class BuildButtonQR extends StatelessWidget {
  final String title;
  const BuildButtonQR({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 165,
        height: 45,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: Colors.blue,
            width: 2,
          ),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
