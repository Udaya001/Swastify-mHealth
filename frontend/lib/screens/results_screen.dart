import 'package:flutter/material.dart';
import 'home_screen.dart'; // Import your Home screen
import 'analyze_screen.dart'; // Import your Analyze screen

class ResultsScreen extends StatefulWidget {
  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  int _selectedIndex = 2; // Default to Results Screen

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AnalyzeScreen()),
      );
    } else if (index == 2) {
      // Already on Results Screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Results', style: TextStyle(color: Colors.blue)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Your Health Risk Assessment',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _buildResultCard('Health Risk Score', 'High Risk'),
            SizedBox(height: 16),
            _buildResultCard('Cholesterol', '220 mg/dL'),
            SizedBox(height: 16),
            _buildResultCard('Blood Pressure', '145/90 mmHg'),
            SizedBox(height: 16),
            _buildResultCard('Sleep Hours', '6 hours per night'),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                // You can handle the action when the button is clicked
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Action Completed')),
                );
              },
              child: Text('Take Action', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.analytics),
      //       label: 'Analyze',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.assessment),
      //       label: 'Results',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.blue,
      //   unselectedItemColor: Colors.grey,
      //   onTap: _onItemTapped,
      // ),
    );
  }

  Widget _buildResultCard(String title, String result) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(fontSize: 18)),
            Text(result,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
