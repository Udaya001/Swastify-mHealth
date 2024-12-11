import 'package:flutter/material.dart';

class LifestyleInputScreen extends StatefulWidget {
  const LifestyleInputScreen({super.key});

  @override
  _LifestyleInputScreenState createState() => _LifestyleInputScreenState();
}

class _LifestyleInputScreenState extends State<LifestyleInputScreen> {
  String? _diet;
  String? _physicalActivity;
  String? _smokingHabits;
  double _sleepHours = 7; // Default sleep value

  final List<String> _dietOptions = ['Vegetarian', 'Non-Vegetarian', 'Vegan'];
  final List<String> _activityOptions = [
    'Sedentary',
    'Lightly Active',
    'Moderately Active',
    'Very Active'
  ];
  final List<String> _smokingOptions = ['Never', 'Occasionally', 'Daily'];

  void _submitLifestyleData() {
    if (_diet == null || _physicalActivity == null || _smokingHabits == null) {
      // Show a warning if all fields are not selected
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill out all the fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // You can send the data to the backend or store it locally here
    print('Diet: $_diet');
    print('Physical Activity: $_physicalActivity');
    print('Smoking Habits: $_smokingHabits');
    print('Sleep Hours: $_sleepHours');

    // Navigate to the next screen
    Navigator.pushNamed(
        context, '/healthMetrics'); // Replace with the correct route
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lifestyle Input'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Diet Field
            const Text(
              'Diet',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButtonFormField<String>(
              value: _diet,
              items: _dietOptions.map((diet) {
                return DropdownMenuItem(
                  value: diet,
                  child: Text(diet),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _diet = value!;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Select your diet',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Physical Activity Field
            const Text(
              'Physical Activity',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButtonFormField<String>(
              value: _physicalActivity,
              items: _activityOptions.map((activity) {
                return DropdownMenuItem(
                  value: activity,
                  child: Text(activity),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _physicalActivity = value!;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Select activity level',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Smoking Habits Field
            const Text(
              'Smoking Habits',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButtonFormField<String>(
              value: _smokingHabits,
              items: _smokingOptions.map((smoking) {
                return DropdownMenuItem(
                  value: smoking,
                  child: Text(smoking),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _smokingHabits = value!;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Select smoking habits',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Sleep Hours Field
            const Text(
              'Sleep Hours',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _sleepHours,
              min: 4,
              max: 12,
              divisions: 8,
              label: '$_sleepHours hours',
              onChanged: (value) {
                setState(() {
                  _sleepHours = value;
                });
              },
            ),
            const SizedBox(height: 20),

            // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: _submitLifestyleData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
