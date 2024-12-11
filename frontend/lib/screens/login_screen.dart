import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLoading = false; // To track loading state

  // Function to handle login
  Future<void> _login() async {
    setState(() {
      isLoading = true; // Set loading to true while the request is made
    });

    final email = _emailController.text;
    final password = _passwordController.text;

    const url = 'http://10.0.2.2:8000/auth/login/'; // Your login API endpoint

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'username': email,
        'password': password,
      }),
    );

    setState(() {
      isLoading = false; // Set loading to false once the request is completed
    });

    if (response.statusCode == 200) {
      // Show success pop-up
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Login Successful'),
          content: const Text('You have logged in successfully!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close pop-up
                // Navigate to Lifestyle Input Screen after login
                Navigator.pushNamed(context, '/lifestyle-input');
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      // Show error message if login fails
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Login Failed'),
          content: const Text('Invalid username or password'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close pop-up
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login'), backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to स्वस्थify',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Username input field
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Password input field
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),

            // Show the loading indicator or the login button
            isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                    child: const Text('Login'),
                  ),
            const SizedBox(height: 10),

            // Don't have an account? Sign up link
            TextButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/signup'); // Navigate to signup screen
              },
              child: const Text('Don\'t have an account? Sign Up'),
            ),

            // Forgot Password link
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context,
                    '/forgot-password'); // Navigate to forgot password screen
              },
              child: const Text('Forgot Password?'),
            ),
          ],
        ),
      ),
    );
  }
}
