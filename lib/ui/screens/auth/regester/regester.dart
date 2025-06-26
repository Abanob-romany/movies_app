import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/ui/screens/auth/regester/register_viewmodel.dart';
import 'package:movies_app/ui/screens/auth/shared/text_form_field_builder.dart';
import 'package:movies_app/ui/utils/app_assets.dart';
import 'package:movies_app/ui/utils/app_colors.dart';
import 'package:movies_app/ui/utils/app_styles.dart';
import 'package:provider/provider.dart';

class Regester extends StatelessWidget {
  static const String routeName = '/regester';
  const Regester({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterViewModel(),
      child: Consumer<RegisterViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: AppColors.black,
            appBar: AppBar(
              title: Text('Register', style: AppStyle.regular16primary),
              centerTitle: true,
              backgroundColor: AppColors.black,
              elevation: 0,
              iconTheme: IconThemeData(color: AppColors.primaryColor),
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: AppColors.primaryColor),
                onPressed: () => Navigator.pop(context),
              ),
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
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 170.0,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.5,
                            autoPlay: false,
                            enableInfiniteScroll: true,
                            viewportFraction: 0.4,
                            initialPage: 1,
                            onPageChanged: (index, reason) => viewModel
                                .setAvaterId(index), // Updated to setAvaterId
                          ),
                          items: [
                            AppAssets.avatar1,
                            AppAssets.avatar2,
                            AppAssets.avatar3,
                            AppAssets.avatar4,
                            AppAssets.avatar5,
                            AppAssets.avatar6,
                            AppAssets.avatar7,
                            AppAssets.avatar8,
                            AppAssets.avatar9,
                          ].map((image) {
                            return Builder(
                              builder: (BuildContext context) {
                                final index = [
                                  AppAssets.avatar1,
                                  AppAssets.avatar2,
                                  AppAssets.avatar3,
                                  AppAssets.avatar4,
                                  AppAssets.avatar5,
                                  AppAssets.avatar6,
                                  AppAssets.avatar7,
                                  AppAssets.avatar8,
                                  AppAssets.avatar9,
                                ].indexOf(image);
                                return GestureDetector(
                                  onTap: () => viewModel.setAvaterId(
                                      index), // Updated to setAvaterId
                                  child: Container(
                                    width: 150,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(image),
                                        fit: BoxFit.cover,
                                      ),
                                      border: viewModel.avaterId == index
                                          ? Border.all(
                                              color: AppColors.primaryColor,
                                              width: 4.0)
                                          : null,
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 22.0),
                        buildTextFormField(
                          hintText: 'Name',
                          icon: AppAssets.nameIcon,
                          controller: viewModel.nameController,
                        ),
                        const SizedBox(height: 22.0),
                        buildTextFormField(
                          hintText: 'Email',
                          icon: AppAssets.emailIcon,
                          controller: viewModel.emailController,
                        ),
                        const SizedBox(height: 22.0),
                        buildTextFormField(
                          hintText: 'Password',
                          icon: AppAssets.password,
                          controller: viewModel.passwordController,
                          obscureText: true,
                          suffixIcon: Icons.visibility_off,
                        ),
                        const SizedBox(height: 22.0),
                        buildTextFormField(
                          hintText: 'Confirm Password',
                          icon: AppAssets.password,
                          controller: viewModel.confirmPasswordController,
                          obscureText: true,
                          suffixIcon: Icons.visibility_off,
                        ),
                        const SizedBox(height: 22.0),
                        buildTextFormField(
                          hintText: 'Phone',
                          icon: AppAssets.phone,
                          controller: viewModel.phoneController,
                          keyboardType: TextInputType.phone,
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
                        const SizedBox(height: 22.0),
                        ElevatedButton(
                          onPressed: viewModel.isLoading
                              ? null
                              : () => viewModel.register(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: viewModel.isLoading
                              ? CircularProgressIndicator(
                                  color: AppColors.black)
                              : Text('Register',
                                  style: AppStyle.regular20black),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account?',
                                style: AppStyle.regular14White),
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child:
                                  Text('Login', style: AppStyle.bold14primary),
                            ),
                          ],
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
