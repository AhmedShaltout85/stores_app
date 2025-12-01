import 'package:flutter/material.dart';

import '../network_repos/remote_repos/app_api_service_impl.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup Screen'),
      ),
      body:  Center(
        child: ElevatedButton(
          onPressed: () async {
           await AppApiServiceImpl.instance.signupUser();
          },
          child: const Text('new user'),
        )
      ),
    );
  }
}