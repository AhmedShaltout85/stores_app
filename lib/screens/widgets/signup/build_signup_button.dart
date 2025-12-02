import 'package:flutter/material.dart';

import '../../../controller/signup_provider.dart';

Widget buildSignupButton(SignupProvider provider, BuildContext context) {
  return SizedBox(
    width: double.infinity,
    height: 56,
    child: ElevatedButton(
      onPressed: provider.isLoading || !provider.isFormValid()
          ? null
          : () {
              provider.submitSignup(context);
            },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[600],
        disabledBackgroundColor: Colors.blue[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      child: provider.isLoading
          ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3,
              ),
            )
          : const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                Icon(Icons.arrow_forward, color: Colors.white, size: 20),
              ],
            ),
    ),
  );
}
