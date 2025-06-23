import 'package:flutter/material.dart';
import 'package:movies_app/ui/screens/auth/login/login.dart';

class Auth extends StatelessWidget {
  static const String routeName = '/auth';

  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Login();
  }
}
