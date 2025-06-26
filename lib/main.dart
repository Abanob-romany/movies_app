import 'package:flutter/material.dart';
import 'package:movies_app/ui/screens/auth/auth.dart';
import 'package:movies_app/ui/screens/auth/forget%20password/forget_pass.dart';
import 'package:movies_app/ui/screens/auth/login/login.dart';
import 'package:movies_app/ui/screens/auth/regester/regester.dart';
import 'package:movies_app/ui/screens/home/home.dart';
import 'package:movies_app/ui/screens/movie%20details/movie_details.dart';
import 'package:movies_app/ui/screens/onboarding/onboarding.dart';

import 'API/Models/MovieModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
      initialRoute: Onboarding.routeName,

      routes: {
        Onboarding.routeName: (context) => Onboarding(),
        Home.routeName: (context) => Home(),
        Auth.routeName: (context) => Auth(),
        MovieDetails.routeName: (context) => MovieDetails(),
        ForgetPass.routeName: (context) => ForgetPass(),
        Regester.routeName: (context) => const Regester(),
        Login.routeName: (context) => const Login(),
=======
      initialRoute: Home.routeName,
      onGenerateRoute: (settings) {
        if (settings.name == MovieDetails.routeName) {
          final movie = settings.arguments as Movie;
          return MaterialPageRoute(
            builder: (_) => MovieDetails(movie: movie),
          );
        }

=======
      initialRoute: Home.routeName,
      onGenerateRoute: (settings) {
        if (settings.name == MovieDetails.routeName) {
          final movie = settings.arguments as Movie;
          return MaterialPageRoute(
            builder: (_) => MovieDetails(movie: movie),
          );
        }

>>>>>>> Stashed changes
=======
      initialRoute: Home.routeName,
      onGenerateRoute: (settings) {
        if (settings.name == MovieDetails.routeName) {
          final movie = settings.arguments as Movie;
          return MaterialPageRoute(
            builder: (_) => MovieDetails(movie: movie),
          );
        }

>>>>>>> Stashed changes
=======
      initialRoute: Home.routeName,
      onGenerateRoute: (settings) {
        if (settings.name == MovieDetails.routeName) {
          final movie = settings.arguments as Movie;
          return MaterialPageRoute(
            builder: (_) => MovieDetails(movie: movie),
          );
        }

>>>>>>> Stashed changes
=======
      initialRoute: Home.routeName,
      onGenerateRoute: (settings) {
        if (settings.name == MovieDetails.routeName) {
          final movie = settings.arguments as Movie;
          return MaterialPageRoute(
            builder: (_) => MovieDetails(movie: movie),
          );
        }

>>>>>>> Stashed changes
        final routes = <String, WidgetBuilder>{
          Onboarding.routeName: (context) => Onboarding(),
          Home.routeName: (context) => Home(),
          Auth.routeName: (context) => Auth(),
          ForgetPass.routeName: (context) => ForgetPass(),
          Regester.routeName: (context) => const Regester(),
        };

        final builder = routes[settings.name];
        return builder != null ? MaterialPageRoute(builder: builder) : null;

      },
    );
  }
}
