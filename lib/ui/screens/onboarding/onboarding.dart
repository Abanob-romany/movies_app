import 'package:flutter/material.dart';
import 'package:movies_app/ui/screens/auth/auth.dart';
import 'package:movies_app/ui/utils/app_assets.dart';
import 'package:movies_app/ui/utils/app_colors.dart';

class Onboarding extends StatefulWidget {
  static const String routeName = '/onboarding';

  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentStep = 0;
  final int totalSteps = 4;

  final PageController _pageController = PageController();

  final List<String> imagePaths = [
    AppAssets.film1,
    AppAssets.film2,
    AppAssets.film3,
    AppAssets.film4,
  ];

  void nextStep() {
    if (currentStep < totalSteps - 1) {
      setState(() {
        currentStep++;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, Auth.routeName);
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔹 Background Image
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Container(
              key: ValueKey(currentStep),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePaths[currentStep]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // 🔹 PageView for state syncing
          PageView.builder(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: totalSteps,
            itemBuilder: (context, index) => const SizedBox.expand(),
          ),

          // 🔹 Bottom Content
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(topRight: Radius.circular(35),topLeft: Radius.circular(35)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Explore All Genres',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.',
                    style: TextStyle(color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),

                  if (currentStep == 0)
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: nextStep,
                        child: const Text("Explore Now"),
                      ),
                    )
                  else ...[
                    Row(
                      children: [
                        if (currentStep >= 2)
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: AppColors.primaryColor),
                                foregroundColor: AppColors.primaryColor,
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: previousStep,
                              child: const Text("Back"),
                            ),
                          ),
                        if (currentStep >= 2) const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: nextStep,
                            child: Text(currentStep == totalSteps - 1 ? "Finish" : "Next"),
                          ),
                        ),
                      ],
                    )
                  ]
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
