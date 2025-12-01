import 'package:flutter/material.dart';

void showForgotPasswordDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      final emailController = TextEditingController();
      return AlertDialog(
        title: const Text('Reset Password'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Enter your email to receive a reset link'),
            const SizedBox(height: 16),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle password reset API call
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Reset link sent to your email'),
                ),
              );
              Navigator.pop(context);
            },
            child: const Text('Send Link'),
          ),
        ],
      );
    },
  );
}
