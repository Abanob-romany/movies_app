import 'package:flutter/material.dart';
import 'package:movies_app/ui/screens/auth/regester/api_service.dart';

class RegisterViewModel with ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  int avaterId = 0; // Updated to match API example
  String? errorMessage;
  bool isLoading = false;

  void setAvaterId(int index) {
    // Updated to setAvaterId
    avaterId = index;
    notifyListeners();
  }

  Future<void> register(BuildContext context) async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty ||
        phoneController.text.isEmpty) {
      errorMessage = 'Please fill all fields';
      notifyListeners();
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      errorMessage = 'Passwords do not match';
      notifyListeners();
      return;
    }

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final response = await ApiService.register(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text, // Updated to match API
        phone: phoneController.text,
        avaterId: avaterId, // Updated to match API
      );
      if (response['message'] == 'User created successfully') {
        if (context.mounted) {
          Navigator.pop(context);
        }
      } else {
        errorMessage = response['message'] ??
            'Registration failed. Please check your input.';
      }
    } catch (e) {
      errorMessage = e.toString().contains('Failed to register')
          ? 'Server error: ${e.toString().split(':').last.trim()}'
          : 'An error occurred. Please try again.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
