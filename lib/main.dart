import 'package:flutter/material.dart';
 main
import 'screens/splash_screen/splash_screen.dart';
=======
import 'package:movies_app/ui/screens/auth/auth.dart';
import 'package:movies_app/ui/screens/home/home.dart';
import 'package:movies_app/ui/screens/movie%20details/movie_details.dart';
import 'package:movies_app/ui/screens/onboarding/onboarding.dart';

 main

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
 main
      title: 'My App',
      home: const SplashScreen(),
=======
      initialRoute: Onboarding.routeName,
      routes: {
        Onboarding.routeName: (context) => Onboarding(),
        Home.routeName: (context) => Home(),
        Auth.routeName: (context) => Auth(),
        MovieDetails.routeName: (context) => MovieDetails(),
      },
 main
    );
  }
}
