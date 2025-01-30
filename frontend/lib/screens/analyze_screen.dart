import 'package:flutter/material.dart';
import 'results_screen.dart'; // Import your results screen

class AnalyzeScreen extends StatefulWidget {
  @override
  _AnalyzeScreenState createState() => _AnalyzeScreenState();
}

class _AnalyzeScreenState extends State<AnalyzeScreen> {
  final _ageController = TextEditingController();
  final _cholesterolController = TextEditingController();
  final _bpController = TextEditingController();
  final _familyHistoryController = TextEditingController();
  final _smokingController = TextEditingController();
  final _obesityController = TextEditingController();
  final _alcoholController = TextEditingController();
  final _dietController = TextEditingController();
  final _physicalActivityController = TextEditingController();
  final _sleepController = TextEditingController();

  String _sex = 'Male';
  String _smoking = 'No';
  String _obesity = 'No';
  String _alcohol = 'No';
  String _diet = 'Balanced';
  String _physicalActivity = 'None';

  int _selectedIndex = 1; // Default to AnalyzeScreen

  @override
  void dispose() {
    _ageController.dispose();
    _cholesterolController.dispose();
    _bpController.dispose();
    _familyHistoryController.dispose();
    _smokingController.dispose();
    _obesityController.dispose();
    _alcoholController.dispose();
    _dietController.dispose();
    _physicalActivityController.dispose();
    _sleepController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/home'); // Home Screen
    } else if (index == 1) {
      // Already on Analyze Screen
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultsScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Analyze', style: TextStyle(color: Colors.blue)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildLifestyleSection(),
              SizedBox(height: 16),
              _buildHealthDetailsSection(),
              SizedBox(height: 16),
              _buildAdditionalDetailsSection(),
              SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsScreen(),
                    ),
                  );
                },
                child: Text('Analyze', style: TextStyle(color: Colors.white)),
              )
            ],
          ),
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

  Widget _buildLifestyleSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tell us about your lifestyle',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          _buildRadioButtons('Sex', ['Male', 'Female'], (value) {
            setState(() {
              _sex = value!;
            });
          }),
          _buildRadioButtons('Smoking', ['Yes', 'No'], (value) {
            setState(() {
              _smoking = value!;
            });
          }),
          _buildRadioButtons('Obesity', ['Yes', 'No'], (value) {
            setState(() {
              _obesity = value!;
            });
          }),
          _buildRadioButtons('Alcohol', ['Yes', 'No'], (value) {
            setState(() {
              _alcohol = value!;
            });
          }),
          _buildRadioButtons('Diet', ['Balanced', 'Unbalanced'], (value) {
            setState(() {
              _diet = value!;
            });
          }),
          _buildRadioButtons(
              'Physical Activity', ['None', 'Low', 'Moderate', 'High'],
              (value) {
            setState(() {
              _physicalActivity = value!;
            });
          }),
        ],
      ),
    );
  }

  Widget _buildHealthDetailsSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Health Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          TextField(
            controller: _ageController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Age (years)'),
          ),
          TextField(
            controller: _cholesterolController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Cholesterol (mg/dL)'),
          ),
          TextField(
            controller: _bpController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'BP (mmHg)'),
          ),
          TextField(
            controller: _sleepController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Sleep Hrs per night'),
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalDetailsSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Additional Detail (Optional)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          TextField(
            controller: _familyHistoryController,
            decoration: InputDecoration(labelText: 'Family History'),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioButtons(
      String label, List<String> options, Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Row(
          children: options
              .map((option) => Row(
                    children: [
                      Radio<String>(
                        value: option,
                        groupValue: _getRadioGroupValue(label),
                        onChanged: onChanged,
                      ),
                      Text(option),
                    ],
                  ))
              .toList(),
        ),
      ],
    );
  }

  String _getRadioGroupValue(String label) {
    switch (label) {
      case 'Sex':
        return _sex;
      case 'Smoking':
        return _smoking;
      case 'Obesity':
        return _obesity;
      case 'Alcohol':
        return _alcohol;
      case 'Diet':
        return _diet;
      case 'Physical Activity':
        return _physicalActivity;
      default:
        return '';
    }
  }
}
