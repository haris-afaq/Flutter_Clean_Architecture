import 'package:flutter/material.dart';

class Bodytext extends StatelessWidget {
  final String text;
  const Bodytext({
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: TextStyle(fontSize: 12,
    fontWeight: FontWeight.w400),
    );
  }
}