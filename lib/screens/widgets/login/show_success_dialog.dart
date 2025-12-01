import 'package:flutter/material.dart';
import 'package:store_app/models/login_model.dart';

import '../../../utils/app_routes.dart';

void showSuccessDialog(BuildContext context, Login loginUser) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: const Row(
        children: [
          Icon(Icons.check_circle, color: Colors.green),
          SizedBox(width: 8),
          Text('Login Successful'),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome back, you have successfully logged in!',
              style: TextStyle(color: Colors.grey[700])),
          const SizedBox(height: 8),
          // Text('User: ${loginUser.token}', style: TextStyle(color: Colors.grey[700])),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            // Navigate to home screen
            Navigator.pushNamed(context, AppRoutes.productRouteName);
          },
          child: const Text('Continue'),
        ),
      ],
    ),
  );
}
