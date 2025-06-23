import 'package:flutter/material.dart';
import 'package:movies_app/ui/screens/auth/shared/text_form_field_builder.dart';
import 'package:movies_app/ui/utils/app_assets.dart';
import 'package:movies_app/ui/utils/app_colors.dart';
import 'package:movies_app/ui/utils/app_styles.dart';

class ForgetPass extends StatelessWidget {
  static const String routeName = '/forgot-password';
  const ForgetPass({super.key});

  @override
  Widget build(BuildContext context) {
    var controller =
        TextEditingController(); // Controller for the email input field
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text('Forgot Password', style: AppStyle.regular16primary),
        centerTitle: true,
        backgroundColor: AppColors.black,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.primaryColor),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.forgotPassword),
                  const SizedBox(height: 22.0),
                  buildTextFormField(
                    hintText: 'Email',
                    icon: AppAssets.emailIcon,
                    controller: controller,
                  ),
                  const SizedBox(height: 22.0),
                  ElevatedButton(
                    onPressed: () {
                      // Handle password reset logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text('Verify Email', style: AppStyle.regular20black),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
