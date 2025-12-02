import 'package:flutter/material.dart';

Widget buildTextField({
  required BuildContext context,
  required String label,
  required String hint,
  required IconData icon,
  required String errorText,
  required ValueChanged<String> onChanged,
  required TextInputType keyboardType,
  required bool enabled,
  required bool hasError,
  required Color prefixIconColor,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.grey[700],
        ),
      ),
      const SizedBox(height: 8),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: hasError ? Colors.red : Colors.grey[300]!,
            width: hasError ? 1.5 : 1,
          ),
        ),
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[500]),
            prefixIcon: Icon(icon, color: prefixIconColor),
            border: InputBorder.none,
            errorStyle: const TextStyle(height: 0),
          ),
          style: const TextStyle(fontSize: 16),
          keyboardType: keyboardType,
          textInputAction: TextInputAction.next,
          onChanged: onChanged,
          enabled: enabled,
          cursorColor: Colors.blue[600],
        ),
      ),
      if (errorText.isNotEmpty) ...[
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            errorText,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 12,
            ),
          ),
        ),
      ],
    ],
  );
}
