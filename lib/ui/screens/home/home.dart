import 'package:flutter/material.dart';
import 'package:movies_app/ui/screens/home/tabs/BroweTap.dart';
import 'package:movies_app/ui/screens/home/tabs/HomeTab.dart';
import 'package:movies_app/ui/screens/home/tabs/ProfileTab.dart';
import 'package:movies_app/ui/screens/home/tabs/SearchTab.dart';
import 'package:movies_app/ui/utils/app_colors.dart';
import '../../utils/app_assets.dart';

class Home extends StatefulWidget {
  static const String routeName = '/home';

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ✅ Tracks which tab is selected
  int tabIndex = 0;

  // ✅ List of tab screens
  final List<Widget> screens = [
    HomeTab(),
    Searchtab(),
    Browetap(),
    Profiletab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: screens[tabIndex],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: AppColors.black,
          primaryColor: AppColors.primaryColor,
          textTheme: Theme.of(context).textTheme.copyWith(
            bodySmall: const TextStyle(color: Colors.white70),
          ),
        ),
        child: Material(
          elevation: 8, // ✅ Adds shadow below navigation bar
          child: BottomNavigationBar(
            currentIndex: tabIndex,
            onTap: (index) {
              setState(() {
                tabIndex = index;
              });
            },
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.white,
            showSelectedLabels: false,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppAssets.explore,
                  width: 22,
                  height: 22,
                  color: AppColors.white,
                ),
                label: 'Browse',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
