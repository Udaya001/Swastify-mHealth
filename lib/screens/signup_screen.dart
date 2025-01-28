import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import HTTP package
import 'dart:convert'; // For JSON encoding and decoding

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Controllers for retrieving user input
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isPasswordVisible = false; // State for password visibility
  bool _isConfirmPasswordVisible =
      false; // State for confirm password visibility

  // Function to handle sign-up logic
  Future<void> _signUp() async {
    String username = _usernameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();

    // Input validation
    if (username.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields.')),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match.')),
      );
      return;
    }

    try {
      // Sending data to the backend in JSON format
      var response = await http.post(
        Uri.parse('http:// 192.168.0.110:8000/auth/register/'),
        headers: {
          'Content-Type': 'application/json', // Specify JSON content type
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'username': username,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // Handle success
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sign-up successful!')),
        );
        Navigator.pushReplacementNamed(
            context, '/login'); // Navigate to login screen
      } else {
        // Handle error from backend
        Map<String, dynamic> errorResponse = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Sign-up failed: ${errorResponse['message']}')),
        );
      }
    } catch (e) {
      // Handle network or other errors
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An error occurred. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('New Account'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible, // Toggle visibility
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _confirmPasswordController,
                obscureText: !_isConfirmPasswordVisible, // Toggle visibility
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _signUp, // Call the sign-up function
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Sign Up'),
              ),
              const SizedBox(height: 10),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Already have an account? Log In"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
