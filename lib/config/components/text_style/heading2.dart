import 'package:flutter/material.dart';

class Heading2 extends StatelessWidget {
  final String title;
  const Heading2({super.key, 
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Text(title,
    style: TextStyle(fontSize: 18,
    fontWeight: FontWeight.w500),
    );
  }
}