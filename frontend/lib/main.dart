import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/forgotpassword_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/input_screen.dart'; // Import the new screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'स्वस्थify',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(), // Welcome screen route
        '/login': (context) => const LoginScreen(), // Login screen route
        '/signup': (context) => const SignUpScreen(), // Sign-up screen route
        '/forgot-password': (context) =>
            const ForgotPasswordScreen(), // Forgot password route
        '/input': (context) =>
            const LifestyleInputScreen(), // New Lifestyle Input screen route
      },
    );
  }
}
