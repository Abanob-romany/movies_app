import 'package:flutter/material.dart';
import 'package:movies_app/ui/screens/home/tabs/BroweTap.dart';
import 'package:movies_app/ui/utils/app_colors.dart';
import 'package:movies_app/ui/utils/app_styles.dart';
import '../../../utils/app_assets.dart';

class HomeTab extends StatefulWidget {
  static const String routeName = '/home';

  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final List<String> imagePaths = [
    AppAssets.film1,
    AppAssets.film2,
    AppAssets.film3,
    AppAssets.film4,
  ];

  final PageController pageController = PageController(viewportFraction: 0.54);
  int currentIndex = 0;

  void nextPage() {
    setState(() {
      currentIndex = (currentIndex + 1) % imagePaths.length;
    });
    pageController.animateToPage(
      currentIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔹 Stack with background and slider
            SizedBox(
              height: screenHeight * 0.75, // control height
              child: Stack(
                children: [
                  // 🔹 Background image
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      key: ValueKey(currentIndex),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imagePaths[currentIndex]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // 🔹 Dark overlay
                  Container(
                    color: Colors.black.withOpacity(0.6),
                  ),
                  // 🔹 Top content over the background
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        Center(
                          child: Image.asset(AppAssets.availablenow),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: screenHeight * 0.38,
                          width: screenWidth,
                          child: PageView.builder(
                            controller: pageController,
                            itemCount: imagePaths.length,
                            onPageChanged: (index) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    imagePaths[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 🔹 Watch Now button at the bottom of stack
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Image.asset(
                        AppAssets.Watchnow,
                        width: screenWidth * 0.82,
                        height: screenHeight * 0.15,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 🔹 Extra scrollable content below the stack
            // Inside the build method after the Stack
            Padding(
              padding: const EdgeInsets.only(top:20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'action',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          TextButton(onPressed: (){}, child: Text("See More",style: AppStyle.bold14primary,))
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 150, // Height of the horizontal image list
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: imagePaths.length, // Reuse your imagePaths list
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Container(
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: AssetImage(imagePaths[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
