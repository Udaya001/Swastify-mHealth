import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/logo.png'),
            ),
            SizedBox(height: 16),
            Text(
              'Name: Pukar Bajgai',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Age: 24',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Email: pukar@example.com',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                // Navigate to edit profile screen
              },
              child:
                  Text('Edit Profile', style: TextStyle(color: Colors.white)),
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
      //       icon: Icon(Icons.bar_chart),
      //       label: 'Statistics',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.notifications),
      //       label: 'Notifications',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //   ],
      //   currentIndex: 3, // Profile screen is at index 3
      //   selectedItemColor: Colors.blue,
      //   unselectedItemColor: Colors.grey,
      //   onTap: (index) {
      //     if (index == 0) {
      //       // Navigate to Home Screen
      //       Navigator.pushReplacementNamed(context, '/home');
      //     } else if (index == 1) {
      //       // Navigate to Statistics Screen
      //       Navigator.pushReplacementNamed(context, '/statistics');
      //     } else if (index == 2) {
      //       // Navigate to Notifications Screen
      //       Navigator.pushReplacementNamed(context, '/notifications');
      //     } else if (index == 3) {
      //       // Already on Profile screen
      //       Navigator.pushReplacementNamed(context, '/profile');
      //     }
      //   },
      // ),
    );
  }
}
