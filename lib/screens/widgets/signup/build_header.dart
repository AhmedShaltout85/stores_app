import 'package:flutter/material.dart';

Widget buildHeader(Size size) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Create Account',
        style: TextStyle(
          fontSize: size.width * 0.08,
          fontWeight: FontWeight.bold,
          color: Colors.blue[800],
        ),
      ),
      const SizedBox(height: 8),
      Text(
        'Fill in your details to get started',
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey[600],
        ),
      ),
    ],
  );
}
