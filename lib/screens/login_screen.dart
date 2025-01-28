import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'home_screen.dart'; // Ensure you import your HomeScreen
import 'signup_screen.dart'; // Import the SignUpScreen

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to handle login API request
  Future<void> loginUser(String username, String password) async {
    try {
      var response = await http.post(
        Uri.parse('http://192.168.0.110:8000/login'),
        body: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // If login is successful, navigate to the HomeScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        // Handle login failure
        print('Login failed: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed, please try again')),
        );
      }
    } catch (e) {
      print('Error during login: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
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
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Navigate to reset password screen
                  // Replace with actual navigation logic if you have a ResetPasswordScreen
                },
                child: Text('Forgot Password?'),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Call loginUser function with entered credentials
                String username = _usernameController.text;
                String password = _passwordController.text;
                loginUser(username, password);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text('Log In'),
            ),
            SizedBox(height: 10),
            Center(
              child: TextButton(
                onPressed: () {
                  // Navigate to SignUpScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                child: Text("Don't have an account? Sign Up"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
