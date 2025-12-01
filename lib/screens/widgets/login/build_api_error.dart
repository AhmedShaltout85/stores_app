import 'package:flutter/material.dart';

Widget buildApiError(BuildContext context, String error) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(12),
    margin: const EdgeInsets.only(bottom: 16),
    decoration: BoxDecoration(
      color: Colors.red[50],
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.red[200]!),
    ),
    child: Row(
      children: [
        Icon(Icons.error, color: Colors.red[700], size: 20),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            error,
            style: TextStyle(
              color: Colors.red[700],
              fontSize: 14,
            ),
          ),
        ),
      ],
    ),
  );
}
