import 'package:flutter/material.dart';

import '../../../utils/app_routes.dart';

Widget buildLoginRedirect(BuildContext context) {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey[600],
          ),
        ),
        GestureDetector(
          onTap: () {
            // Navigate to login screen
            Navigator.pushNamed(context, AppRoutes.loginRouteName);
          },
          child: Text(
            'Log In',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.blue[600],
            ),
          ),
        ),
      ],
    ),
  );
}
