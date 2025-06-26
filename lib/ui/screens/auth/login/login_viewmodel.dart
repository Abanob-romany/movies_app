import 'package:flutter/material.dart';
import 'package:movies_app/ui/screens/auth/login/api_service.dart';
import 'package:movies_app/ui/screens/home/home.dart';

class LoginViewModel with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? errorMessage;
  bool isLoading = false;

  Future<void> login(BuildContext context) async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      errorMessage = 'Please fill all fields';
      notifyListeners();
      return;
    }

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final response = await ApiService.login(
        email: emailController.text,
        password: passwordController.text,
      );
      if (response['message'] == 'Success Login') {
        // Handle successful login (e.g., save token, navigate to home)
        if (context.mounted) {
          Navigator.pushReplacementNamed(
              context, Home.routeName); // Adjust route as needed
        }
      } else {
        errorMessage = response['message'] ??
            'Login failed. Please check your credentials.';
      }
    } catch (e) {
      errorMessage = e.toString().contains('Failed to login')
          ? 'Server error: ${e.toString().split(':').last.trim()}'
          : 'An error occurred. Please try again.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
