
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/login_provider.dart';
import '../../../network_repos/local_repo/cache_helper.dart';
import 'show_success_dialog.dart';

Future<void> submitLogin(BuildContext context) async {
  final provider = Provider.of<LoginProvider>(context, listen: false);

  provider.resetValidation();
  FocusScope.of(context).unfocus();

  final result = await provider.submitLogin();

  if (result.success) {
    showSuccessDialog(context, result.loginResponse!);
    // Save tokens to secure storage
    //TODO: Fix the saved data
    CacheHelper.saveTokens(
      token: result.loginResponse!.token ?? '',
      refreshToken: result.loginResponse!.userName ?? '',
      userData: result.loginResponse!.userName ?? '',
    );
    // log('Login Successful print from submitLogin: ${result.loginResponse!.token}');
  } else {
    // Show snackbar for errors that aren't already displayed in form
    if (result.error != null && provider.apiError.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result.error!),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
