import 'package:flutter/material.dart';

import 'build_social_button.dart';

class AdditionalOptions extends StatelessWidget {
  const AdditionalOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 32),
        Row(
          children: [
            Expanded(
              child: Divider(color: Colors.grey[300]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Or continue with',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            Expanded(
              child: Divider(color: Colors.grey[300]),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSocialButton(Icons.g_mobiledata, Colors.red),
            const SizedBox(width: 16),
            buildSocialButton(Icons.facebook, Colors.blue),
            const SizedBox(width: 16),
            buildSocialButton(Icons.apple, Colors.black),
          ],
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have an account?"),
            TextButton(
              onPressed: () {
                // Handle sign up action
              },
              child: const Text('Sign up'),
            ),
          ],
        ),
      ],
    );
  }
}
