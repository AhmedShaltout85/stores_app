import 'package:flutter/material.dart';

Widget buildPasswordField({
  required BuildContext context,
  required String label,
  required String hint,
  required String errorText,
  required ValueChanged<String> onChanged,
  required bool isVisible,
  required VoidCallback onToggleVisibility,
  required bool enabled,
  required bool hasError,
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
            prefixIcon: Icon(Icons.lock_outline, color: Colors.blue[600]),
            suffixIcon: IconButton(
              icon: Icon(
                isVisible ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey[600],
              ),
              onPressed: onToggleVisibility,
            ),
            border: InputBorder.none,
            errorStyle: const TextStyle(height: 0),
          ),
          obscureText: !isVisible,
          style: const TextStyle(fontSize: 16),
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
