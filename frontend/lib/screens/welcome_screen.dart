import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Welcome Image (replace with your actual asset)
            Image.asset('assets/images/welcome.png',
                height: 200), // Make sure to add the correct asset path
            const SizedBox(height: 40),

            // Get Started Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/login'); // Navigate to login screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, // Set button color
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 24.0),
              ),
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
