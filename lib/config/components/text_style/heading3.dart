import 'package:flutter/material.dart';

class Heading3 extends StatelessWidget {
  final String title;
  const Heading3({super.key, 
    required this.title
  });

  @override
  Widget build(BuildContext context) {
     return Text(title,
    style: TextStyle(fontSize: 15,
    fontWeight: FontWeight.w500,
    ),
    );
  }
}