import 'package:flutter/material.dart';

import 'widgets/login/additional_option.dart';
import 'widgets/login/login_form.dart';
import 'widgets/login/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 48,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo/Header
                LoginHeader(),
                SizedBox(height: 48),

                // Login Form
                LoginForm(),

                // Additional Options
                AdditionalOptions(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



 
  
  