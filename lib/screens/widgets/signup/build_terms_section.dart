import 'package:flutter/material.dart';

Widget buildTermsSection() {
  return Row(
    children: [
      Checkbox(
        value: true,
        onChanged: (value) {},
        activeColor: Colors.blue[600],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      Expanded(
        child: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
            children: [
              const TextSpan(text: 'I agree to the '),
              TextSpan(
                text: 'Terms of Service',
                style: TextStyle(
                  color: Colors.blue[600],
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(text: ' and '),
              TextSpan(
                text: 'Privacy Policy',
                style: TextStyle(
                  color: Colors.blue[600],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

