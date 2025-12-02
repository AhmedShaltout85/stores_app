import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/signup_provider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title: const Text('Signup Screen'),
          iconTheme: const IconThemeData(color: Colors.blue),
        ),
        body: Consumer<SignupProvider>(
            builder: (context, provider, child) => ListView(
                  children: [
                    const Text('Register',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                        textAlign: TextAlign.center),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        margin: const EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                fillColor: Colors.grey[200],
                                filled: true,
                                labelText: 'Username',
                                hintText: 'Enter your username',
                                prefixIcon: const Icon(Icons.person),
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
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              decoration: InputDecoration(
                                fillColor: Colors.grey[200],
                                filled: true,
                                labelText: 'Email',
                                hintText: 'Enter your email',
                                prefixIcon: const Icon(Icons.email),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                errorText: provider.emailError.isNotEmpty
                                    ? provider.emailError
                                    : null,
                                errorMaxLines: 2,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              onChanged: provider.setEmail,
                              enabled: !provider.isLoading,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              decoration: InputDecoration(
                                fillColor: Colors.grey[200],
                                filled: true,
                                labelText: 'Password',
                                hintText: 'Enter your password',
                                prefixIcon: const Icon(Icons.lock),
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
                              onChanged: provider.setPassword,
                              enabled: !provider.isLoading,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              decoration: InputDecoration(
                                fillColor: Colors.grey[200],
                                filled: true,
                                labelText: 'Confirm Password',
                                hintText: 'Confirm your password',
                                prefixIcon: const Icon(Icons.lock),
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
                              onChanged: provider.setPassword,
                              enabled: !provider.isLoading,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: provider.isLoading
                                  ? null
                                  : provider.submitSignup,
                              child: provider.isLoading
                                  ? const CircularProgressIndicator()
                                  : const Text('Signup'),
                            ),
                            const SizedBox(height: 20),
                            Text(provider.apiError),
                          ],
                        ),
                      ),
                    ),
                  ],
                )));
  }
}
