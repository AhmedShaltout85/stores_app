import 'package:flutter/material.dart';

import '../../../controller/signup_provider.dart';
import 'build_password_field.dart';
import 'build_text_field.dart';

Widget buildSignupForm(SignupProvider provider, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 20,
          spreadRadius: 5,
        ),
      ],
    ),
    padding: const EdgeInsets.all(25),
    child: Column(
      children: [
        // Username Field
        buildTextField(
          context: context,
          label: 'Username',
          hint: 'Enter username',
          icon: Icons.person_outline,
          errorText: provider.usernameError,
          onChanged: provider.setUsername,
          keyboardType: TextInputType.text,
          enabled: !provider.isLoading,
          hasError: provider.usernameError.isNotEmpty,
          prefixIconColor: Colors.blue[600]!,
        ),
        const SizedBox(height: 20),

        // Email Field
        buildTextField(
          context: context,
          label: 'Email',
          hint: 'Enter your email',
          icon: Icons.email_outlined,
          errorText: provider.emailError,
          onChanged: provider.setEmail,
          keyboardType: TextInputType.emailAddress,
          enabled: !provider.isLoading,
          hasError: provider.emailError.isNotEmpty,
          prefixIconColor: Colors.blue[600]!,
        ),
        const SizedBox(height: 20),

        // Password Field
        buildPasswordField(
          context: context,
          label: 'Password',
          hint: 'Enter password',
          errorText: provider.passwordError,
          onChanged: provider.setPassword,
          isVisible: provider.isPasswordVisible,
          onToggleVisibility: provider.togglePasswordVisibility,
          enabled: !provider.isLoading,
          hasError: provider.passwordError.isNotEmpty,
        ),
        const SizedBox(height: 20),

        // Confirm Password Field
        buildPasswordField(
          context: context,
          label: 'Confirm Password',
          hint: 'Confirm your password',
          errorText: provider.confirmPasswordError,
          onChanged: provider.setConfirmPassword,
          isVisible: provider.isConfirmPasswordVisible,
          onToggleVisibility: provider.toggleConfirmPasswordVisibility,
          enabled: !provider.isLoading,
          hasError: provider.confirmPasswordError.isNotEmpty,
        ),
      ],
    ),
  );
}
