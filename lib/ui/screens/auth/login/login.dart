import 'package:flutter/material.dart';
import 'package:movies_app/ui/screens/auth/forget%20password/forget_pass.dart';
import 'package:movies_app/ui/screens/auth/login/login_viewmodel.dart';
import 'package:movies_app/ui/screens/auth/regester/regester.dart';
import 'package:movies_app/ui/screens/auth/shared/elevated_button_builder.dart';
import 'package:movies_app/ui/screens/auth/shared/text_form_field_builder.dart';
import 'package:movies_app/ui/utils/app_assets.dart';
import 'package:movies_app/ui/utils/app_colors.dart';
import 'package:movies_app/ui/utils/app_styles.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  static const String routeName = '/login';
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, viewModel, child) {
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
                          controller: viewModel.emailController,
                        ),
                        const SizedBox(height: 22.0),
                        buildTextFormField(
                          hintText: 'password',
                          icon: AppAssets.password,
                          controller: viewModel.passwordController,
                          obscureText: true,
                          suffixIcon: Icons.visibility_off,
                        ),
                        if (viewModel.errorMessage != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              viewModel.errorMessage!,
                              style: AppStyle.regular14White
                                  .copyWith(color: Colors.red),
                            ),
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, ForgetPass.routeName);
                              },
                              child: Text(
                                'Forgot Password?',
                                style: AppStyle.regular14primary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 22.0),
                        buildElevatedButton(
                          text: 'Login',
                          onPressed: viewModel.isLoading
                              ? () {}
                              : () => viewModel.login(context),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: AppStyle.regular14White,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, Regester.routeName);
                              },
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Divider(
                                  color: AppColors.primaryColor,
                                  thickness: 1,
                                ),
                              ),
                            ),
                            Text('or', style: AppStyle.regular16primary),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Divider(
                                  color: AppColors.primaryColor,
                                  thickness: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        buildElevatedButton(
                          text: 'Login with google',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
