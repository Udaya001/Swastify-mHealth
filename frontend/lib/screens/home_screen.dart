import 'package:flutter/material.dart';
import 'analyze_screen.dart'; // Import Analyze Screen
import 'results_screen.dart'; // Import Results Screen (Updated from Statistics)
import 'profile_screen.dart'; // Import Profile Screen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    AnalyzeScreen(), // Navigate to Analyze Screen
    ResultsScreen(), // Navigate to Results Screen
    ProfileScreen(), // Navigate to Profile Screen
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, Welcome Back',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                Text(
                  'Pukar Bajgai',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions
            .elementAt(_selectedIndex), // Display the selected screen
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Analyze', // Analyze Screen navigation
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Results', // Results Screen navigation
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile', // Profile Screen navigation
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped, // Switch screens on tap
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      child: Center(
        child: Text(
          'Home Screen Content', // Home Screen content
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
