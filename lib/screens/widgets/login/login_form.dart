import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/login_provider.dart';
import 'build_api_error.dart';
import 'show_forget_password.dart';
import 'submit_login.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            // API Error Display
            if (provider.apiError.isNotEmpty)
              buildApiError(context, provider.apiError),

            // Username Field
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Username',
                hintText: 'Enter your username',
                prefixIcon: const Icon(Icons.person, color: Colors.blue),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                errorText: provider.usernameError.isNotEmpty
                    ? provider.usernameError
                    : null,
                errorMaxLines: 2,
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onChanged: provider.setUsername,
              enabled: !provider.isLoading,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            const SizedBox(height: 20),

            // Password Field
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: const Icon(Icons.lock, color: Colors.blue),
                suffixIcon: IconButton(
                  icon: Icon(
                    provider.isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.grey[600],
                  ),
                  onPressed: provider.togglePasswordVisibility,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                errorText: provider.passwordError.isNotEmpty
                    ? provider.passwordError
                    : null,
                errorMaxLines: 2,
              ),
              obscureText: !provider.isPasswordVisible,
              textInputAction: TextInputAction.done,
              onChanged: provider.setPassword,
              onFieldSubmitted: (_) => submitLogin(context),
              enabled: !provider.isLoading,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            const SizedBox(height: 8),

            // Forgot Password
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: provider.isLoading
                    ? null
                    : () {
                        showForgotPasswordDialog(context);
                      },
                child: const Text('Forgot Password?'),
              ),
            ),
            const SizedBox(height: 24),

            // Login Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: provider.isLoading || !provider.isFormValid()
                    ? null
                    : () => submitLogin(context),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(16),
                ),
                child: provider.isLoading
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : const Text(
                        'Sign In',
                        style: TextStyle(fontSize: 16),
                      ),
              ),
            ),
          ],
        );
      },
    );
  }
}
