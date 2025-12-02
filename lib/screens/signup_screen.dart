
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/signup_provider.dart';
import 'widgets/signup/build_header.dart';
import 'widgets/signup/build_login_redirect.dart';
import 'widgets/signup/build_signup_button.dart';
import 'widgets/signup/build_signup_form.dart';
import 'widgets/signup/build_terms_section.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey[700]),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Consumer<SignupProvider>(
            builder: (context, provider, child) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.08,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Section
                    buildHeader(size),
                    const SizedBox(height: 40),

                    // Form Section
                    buildSignupForm(provider, context),
                    const SizedBox(height: 30),

                    // Terms and Conditions
                    buildTermsSection(),
                    const SizedBox(height: 40),

                    // Sign Up Button
                    buildSignupButton(provider, context),
                    const SizedBox(height: 30),

                    // Login Redirect
                    buildLoginRedirect(context),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  


 
  

  }
