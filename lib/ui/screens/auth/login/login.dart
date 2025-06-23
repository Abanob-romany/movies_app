import 'package:flutter/material.dart';
import 'package:movies_app/ui/screens/auth/shared/text_form_field_builder.dart';
import 'package:movies_app/ui/utils/app_assets.dart';
import 'package:movies_app/ui/utils/app_colors.dart';
import 'package:movies_app/ui/utils/app_styles.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(image: AssetImage(AppAssets.appLogo)),
                  buildTextFormField(
                    hintText: 'email',
                    icon: AppAssets.emailIcon,
                    controller: emailController,
                  ),
                  const SizedBox(height: 22.0),
                  buildTextFormField(
                    hintText: 'password',
                    icon: AppAssets.password,
                    controller: passwordController,
                    obscureText: true,
                    suffixIcon: Icons.visibility_off,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          //todo: Handle forgot password
                        },
                        child: Text(
                          'Forgot Password?',
                          style: AppStyle.regular14primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22.0),
                  ElevatedButton(
                    // todo: Handle login
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text('Login', style: AppStyle.regular20black),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: AppStyle.regular14White,
                      ),
                      TextButton(
                        // todo: Handle sign up
                        onPressed: () {},
                        child: Text(
                          'create one',
                          style: AppStyle.bold14primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Divider(
                            color: AppColors.primaryColor,
                            thickness: 1,
                          ),
                        ),
                      ),
                      Text('or', style: AppStyle.regular16primary),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Divider(
                            color: AppColors.primaryColor,
                            thickness: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                    // todo: Handle login with Google
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      'Login with Google',
                      style: AppStyle.regular20black,
                    ),
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
