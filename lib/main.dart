import 'package:flutter/material.dart';
import 'package:movies_app/ui/screens/auth/auth.dart';
import 'package:movies_app/ui/screens/auth/forget%20password/forget_pass.dart';
import 'package:movies_app/ui/screens/auth/regester/regester.dart';
import 'package:movies_app/ui/screens/home/home.dart';
import 'package:movies_app/ui/screens/movie%20details/movie_details.dart';
import 'package:movies_app/ui/screens/onboarding/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home.routeName,

      routes: {
        Onboarding.routeName: (context) => Onboarding(),
        Home.routeName: (context) => Home(),
        Auth.routeName: (context) => Auth(),
        MovieDetails.routeName: (context) => MovieDetails(),
        ForgetPass.routeName: (context) => ForgetPass(),
        Regester.routeName: (context) => const Regester(),
      },
    );
  }
}
