import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/ui/screens/auth/shared/text_form_field_builder.dart';
import 'package:movies_app/ui/utils/app_assets.dart';
import 'package:movies_app/ui/utils/app_colors.dart';
import 'package:movies_app/ui/utils/app_styles.dart';

class Regester extends StatelessWidget {
  static const String routeName = '/regester';
  const Regester({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> avatarImages = [
      AppAssets.avatar1,
      AppAssets.avatar2,
      AppAssets.avatar3,
      AppAssets.avatar4,
      AppAssets.avatar5,
      AppAssets.avatar6,
      AppAssets.avatar7,
      AppAssets.avatar8,
      AppAssets.avatar9,
    ];

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text('Regester', style: AppStyle.regular16primary),
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
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 170.0,
                      enlargeCenterPage: true,
                      autoPlay: false,
                      enableInfiniteScroll: true,
                      viewportFraction: 0.4,
                      initialPage: 1,
                      enlargeFactor: 0.5,
                    ),
                    items:
                        avatarImages.map((image) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(image),
                                    fit: BoxFit.cover,
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
                    controller: TextEditingController(),
                  ),
                  const SizedBox(height: 22.0),
                  buildTextFormField(
                    hintText: 'Email',
                    icon: AppAssets.emailIcon,
                    controller: TextEditingController(),
                  ),
                  const SizedBox(height: 22.0),
                  buildTextFormField(
                    hintText: 'Password',
                    icon: AppAssets.password,
                    controller: TextEditingController(),
                    obscureText: true,
                    suffixIcon: Icons.visibility_off,
                  ),
                  const SizedBox(height: 22.0),
                  buildTextFormField(
                    hintText: 'confirm password',
                    icon: AppAssets.password,
                    controller: TextEditingController(),

                    obscureText: true,
                    suffixIcon: Icons.visibility_off,
                  ),
                  const SizedBox(height: 22.0),
                  buildTextFormField(
                    hintText: 'Phone',
                    icon: AppAssets.phone,
                    controller: TextEditingController(),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 22.0),
                  ElevatedButton(
                    onPressed: () {
                      // Handle registration logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text('Register', style: AppStyle.regular20black),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'already have an account?',
                        style: AppStyle.regular14White,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Login', style: AppStyle.bold14primary),
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
  }
}
